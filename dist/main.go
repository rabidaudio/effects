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
	"github.com/fogleman/gg"
	"github.com/mjibson/go-dsp/fft"
	"github.com/mjibson/go-dsp/window"
)

const SAMPLE_RATE = 44100
const ITERATIONS = 50
const N = 4096
const N_HARMONICS = 10

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
	res.PrintTSV()
	err = res.WritePNG("out.png", 10, 50)
	// TODO: need to normalize in frequency so that global EQs align
}

// Results is a mapping of Iteration to the magnitude of the FFT
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
		// get magnitudes
		for j, v := range cfreq {
			work[j] = cmplx.Abs(v) // TODO: normalize / N
		}

		res[it] = make([]float64, N_HARMONICS)
		for i := range N_HARMONICS {
			h := 2*i + 1
			res[it][i] = it.ComputePower(work, h)
		}
	}
	return res, nil
}

func (res Results) PrintTSV() {
	// display power graphs
	fmt.Printf("FREQvHARMONIC")
	for i := range N_HARMONICS {
		h := 2*i + 1
		fmt.Printf("\t%v", h)
	}
	fmt.Println()
	for _, it := range Iterations() {
		fmt.Printf("%v", it)
		for _, p := range res[it] {
			fmt.Printf("\t%v", p)
		}
		fmt.Println()
	}
}

func (res Results) WritePNG(path string, wscale, hscale float64) error {
	dc := gg.NewContext(int(wscale*float64(ITERATIONS)), int(hscale*N_HARMONICS))
	x := 0
	// TODO: normalize power - use sins of known amplitudes to calibrate
	// for now, normalize to max power
	max := 0.0
	for _, pp := range res {
		for _, p := range pp {
			if p > max {
				max = p
			}
		}
	}

	for _, powers := range res {
		for y, p := range powers {
			v := p / max
			dc.SetRGB(v, v, v)
			dc.DrawRectangle(wscale*float64(x), hscale*float64(y), wscale, hscale)
			dc.Fill()
		}
		x += 1
	}
	return dc.SavePNG(path)
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

	var weight float64
	for i := range N / 2 {
		sd := float64(i+1) - start_i
		ed := float64(i+1) - end_i
		if sd <= 0 || ed >= 1 {
			continue
		} else if sd >= 1 && ed < 0 {
			weight = 1
		} else {
			st := sd > 0 && sd <= 1
			et := ed >= 0 && ed < 1
			if st && et {
				weight = sd - ed
			} else if st {
				weight = sd
			} else if et {
				weight = 1 - ed
			} else {
				panic("impossible")
			}
		}

		pow += (weight * fdomain[i]) * (weight * fdomain[i])
	}
	pow = math.Sqrt(pow)
	return
}
