package main

import (
	"flag"
	"fmt"
	"log"
	"math"
	"math/cmplx"
	"os"
	"time"

	"github.com/faiface/beep/wav"
	"github.com/mjibson/go-dsp/fft"
	"github.com/mjibson/go-dsp/window"
)

const SAMPLE_RATE = 44100
const ITERATIONS = 10 // 1000
const N = 2048        // 4096
const N_HARMONICS = 5

var SRC_LENGTH = 30 * time.Second
var TOTAL_SAMPLES = int(SAMPLE_RATE * (SRC_LENGTH / time.Second))

func init() {
	TOTAL_SAMPLES -= (TOTAL_SAMPLES % N) // make sure it's a multiple of N
}

func main() {
	fFlag := flag.String("path", "dist.wav", "file path for the result")
	flag.Parse()

	res, err := ParseResults(*fFlag)
	if err != nil {
		log.Panic(err)
	}

}

type Results map[Iteration][]float64

func ParseResults(path string) (Results, error) {
	f, err := os.Open(path)
	if err != nil {
		return nil, err
	}

	stream, ft, err := wav.Decode(f)
	if err != nil {
		return nil, err
	}
	if ft.SampleRate != SAMPLE_RATE {
		return nil, fmt.Errorf("expected sample rate %v but was %v", SAMPLE_RATE, ft.SampleRate)
	}

	// load the whole wav into memory so we can easily seek backwards for windowing
	samples := make([]float64, TOTAL_SAMPLES)
	chunk := make([][2]float64, N)
	if stream.Len() < len(samples) {
		return nil, fmt.Errorf("file incorrect size. expected: %v, was %v", len(samples), stream.Len())
	}
	for i := range TOTAL_SAMPLES / N {
		_, ok := stream.Stream(chunk)
		if !ok {
			return nil, stream.Err()
		}
		for j := range chunk {
			samples[(i*N)+j] = chunk[j][0]
		}
	}

	res := make(Results)
	work := make([]float64, N)
	for _, it := range Iterations() {
		start, end := it.Range()
		if end-start != N {
			panic("incorrect bounds")
		}
		copy(work, samples[start:end])
		window.Apply(work, window.Hann)
		cfreq := fft.FFTReal(work)

		// TODO for testing, print the ffts for now
		res[it] = make([]float64, len(cfreq))
		for j, v := range cfreq {
			res[it][j] = cmplx.Abs(v)
		}
	}
	return res, nil
}

func (res Results) PrintTSV() {
	// display power graphs
	fmt.Printf("HARMONIC")
	for it := range res {
		fmt.Printf("\t%v", it)
	}
	fmt.Println()
	for i := range N_HARMONICS {
		h := 2*i + 1
		fmt.Printf("%v", h)
		for it := range res {
			p := it.ComputePower(res[it], h)
			fmt.Printf("\t%v", p)
		}
		fmt.Println()
	}
	fmt.Println()
	fmt.Println()
	// display all raw data
	fmt.Printf("INDEX\tFREQ")
	for it := range res {
		fmt.Printf("\t%v", it)
	}
	fmt.Println()
	for i := range N / 2 {
		f := float64(i) / N * SAMPLE_RATE
		fmt.Printf("%v\t%v", i, f)
		for it := range res {
			fmt.Printf("\t%v", res[it][i])
		}
		fmt.Println()
	}
}

// Iterations generates all the steps for the operation
func Iterations() []Iteration {
	out := make([]Iteration, ITERATIONS)
	tsamp := float64(TOTAL_SAMPLES)
	// generate ITERATIONS log-scale frequencies from 20Hz to 20kHz
	// actually more like 20.215 to 19787 because we need a full window
	usable := float64(tsamp-N-1) / float64(tsamp) // 0.9969
	decs := usable * 3.0                          // 2.99
	offset := (1 - usable) * 3.0 / 2.0            // 0.004
	for i := range out {
		// linear steps from 1.004 to 2.996 inclusive
		ex := float64(i)/float64(ITERATIONS-1)*decs + offset
		f := 20.0 * math.Pow(10, ex)
		out[i] = Iteration(f)
	}
	return out
}

type Iteration float64

// Range returns the index of the samples to window around
// where the center of the window is when the chirp is at frequency f
func (f Iteration) Range() (start, stop int) {
	// percent of the way through exponential chirp
	ex := math.Log10(float64(f)/20.0) / 3.0
	// total samples
	tsamp := float64(TOTAL_SAMPLES)
	center := int(tsamp * ex)
	return center - N/2, center + N/2
}

// func (f Iteration) Harmonics() []float64 {
// 	// n, 3n, 5n, 7n, 9n, 11n
// 	out := make([]float64, N_HARMONICS)
// 	for j := range N_HARMONICS {
// 		n := float64(2*j) + 1
// 		out[j] = n * float64(f)
// 	}
// 	return out
// }

// func (f Iteration) Bins() []float64 {
// 	out := make([]float64, N_HARMONICS+1)
// 	// n/2, 2n, 4n, 6n, 8n, 10n, 12n
// 	for j := range out {
// 		n := 2 * float64(j)
// 		if j == 0 {
// 			n = 0.5
// 		}
// 		out[j] = n * float64(f)
// 	}
// 	return out
// }

// func (f Iteration) FreqIndex(freq float64) int {
// 	// 0-N is 0-SAMPLE_RATE hz
// 	return int(freq / float64(SAMPLE_RATE) * N)
// }

// ComputePower measures the power at the nth harmonic by taking the sqrt-sum-of-squares
// of the frequency domain measurements from the harmonic below to the harmonic above.
// For frequencies beyond SAMPLE_RATE/2, the results are truncated (0).
func (f Iteration) ComputePower(fdomain []float64, nharmonic int) (pow float64) {
	// center := float64(f) * float64(nharmonic)
	start := float64(f) * float64(nharmonic-1)
	end := float64(f) * float64(nharmonic+1)

	// start = 100Hz, end 300Hz
	// 44100kHz sample rate, N=4096 -> 10.76kHz bins
	// 100/44100*4096 = 9.29 index start
	// 300/44100*4096 = 27.86 index end
	// (27.86-9.29)*10.76 = 200Hz

	start_i := start / float64(SAMPLE_RATE) * float64(N)
	end_i := end / float64(SAMPLE_RATE) * float64(N)

	// =if(C23<=0,0,
	// 	if(D23>=1,0,
	// 	if(AND(C23>=1,D23<0),1,
	// 	if(AND(C23>0,C23<=1,D23>=0,D23<1),C23-D23,
	// 	if(AND(C23>0,C23<=1),C23,
	// 	if(AND(D23>=0,D23<1),1-D23))))))
	var ratio float64
	for i := range N / 2 {
		sd := float64(i+1) - start_i
		ed := float64(i+1) - end_i
		if sd <= 0 || ed >= 1 {
			continue
		} else if sd >= 1 && ed < 0 {
			ratio = 1
		} else {
			st := sd > 0 && sd <= 1
			et := ed >= 0 && ed < 1
			if st && et {
				ratio = sd - ed
			} else if st {
				ratio = sd
			} else if et {
				ratio = 1 - ed
			} else {
				panic("impossible")
			}
		}

		pow += (ratio * fdomain[i]) * (ratio * fdomain[i])
	}
	pow = math.Sqrt(pow)
	return
}

// Tone returns a Streamer of a sine wave of the iteration's freq for 2*N samples
// func (f Iteration) Tone() beep.Streamer {
// 	s, err := generators.SineTone(SAMPLE_RATE, float64(f))
// 	if err != nil {
// 		panic(err)
// 	}
// 	t := beep.Take(2*N, s)
// 	// set volume to -3db (0.5pp)
// 	// TODO: what to set to? Need to account for enormous gain...
// 	return &effects.Volume{
// 		Streamer: t,
// 		Base:     10,
// 		Volume:   -3.0 / 10,
// 	}
// }

// func (f Iteration) ComputeMagnitudes(samples []float64) ([]float64, error) {
// run the real-value FFT and discard phase data, getting only normalized magnitudes
// norm := make([]float64, len(samples))
// trans := fft.FFTReal(samples)
// for i, v := range trans {
// 	norm[i] = cmplx.Abs(v) / float64(len(samples))
// }

// run a nonuniform discrete Fourier transform (NUDFT)
// of Type 1 (NUDFT-I), transforming uniform (in time) samples to
// non-uniform frequencies.
// https://en.wikipedia.org/wiki/Non-uniform_discrete_Fourier_transform
// }

// func nudft1(x []complex128, f []float64) []complex128 {
// 	// run a nonuniform discrete Fourier transform (NUDFT)
// 	// of Type 1 (NUDFT-I), transforming uniform (in time) samples to
// 	// non-uniform frequencies.
// 	// https://en.wikipedia.org/wiki/Non-uniform_discrete_Fourier_transform
// 	N := len(x)
// 	out := make([]complex128, N)
// 	for k := range N - 1 {
// 		for n := range N - 1 {
// 			// NDFT -2 pi i p_n f_k
// 			// where p_n are sample points in [0, 1]
// 			// and f_k in [0, N] are frequencies
// 			// p_n -> n/N, f_k -> K is normal DFT
// 			// TODO: this is the normal DFT.
// 			angle := -2.0 * math.Pi * float64(k) * float64(n) / float64(N)
// 			out[k] += x[n] * complex(math.Cos(angle), math.Sin(angle))
// 		}
// 	}
// 	return out
// }

// TODO: generate 2 sin signal, run dft and ndft and compare results

// TODO: simpler approach. Generate continuous exponential chirp, generate
// spectrogram. Use known fundamental to compute power bands from spectrogram

// window:
// "github.com/mjibson/go-dsp/window"
// windowFunc := window.Hann(fftSize)
// windowEnergy := 0.0
// for _, w := range windowFunc {
// 	windowEnergy += w * w
// }
// src := make([]float64, fftSize)
// for i := start; i < end; i++ {
// 	src[i-start] = pcm[i] * windowFunc[i-start] // Windowed data
// }
// spectrum := fft.FFTReal(src)

// func GenSource() error {
// 	f, err := os.Create("src.wav")
// 	if err != nil {
// 		return err
// 	}
// 	defer f.Close()

// 	tones := make([]beep.Streamer, ITERATIONS)
// 	for i, it := range Iterations() {
// 		tones[i] = it.Tone()
// 	}
// 	// TODO: should we slide between tones to avoid big transients?
// 	seq := beep.Seq(tones...)

// 	// 16bit, mono, 44.1kHz wav
// 	fmt := beep.Format{SampleRate: SAMPLE_RATE, NumChannels: 1, Precision: 2}
// 	err = wav.Encode(f, seq, fmt)
// 	if err != nil {
// 		return err
// 	}

// 	return nil
// }
