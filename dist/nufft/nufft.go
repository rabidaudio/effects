package nufft

import (
	"fmt"
	"math"
	"math/cmplx"
)

// NUFFT implements a simple 1D NUFFT (type-1 and type-2) using convolutional gridding
// with a Gaussian kernel and an internal radix-2 FFT.
type NUFFT struct {
	N         int     // number of Fourier modes requested (output length for type-1, input length for type-2)
	sigma     float64 // oversampling factor (>=1, typical 2)
	J         int     // kernel half-width in grid samples (total support ~ J)
	M         int     // oversampled grid length (power of two, >= sigma*N)
	delta     float64 // gaussian kernel width parameter (std dev)
	kernel    []float64
	kernelDFT []complex128
}

// NewNUFFT creates a NUFFT instance.
// N: number of Fourier modes (target frequencies 0..N-1).
// sigma: oversampling factor, recommend 1.25..3. Typical 2.0.
// J: kernel support size in grid points (odd or even), typical 6..12.
func NewNUFFT(N int, sigma float64, J int) (*NUFFT, error) {
	if N <= 0 {
		return nil, fmt.Errorf("N must be > 0")
	}
	if sigma <= 0 {
		return nil, fmt.Errorf("sigma must be > 0")
	}
	if J <= 0 {
		return nil, fmt.Errorf("J must be > 0")
	}
	// choose M = next pow2 >= ceil(sigma * N)
	Mf := math.Ceil(sigma * float64(N))
	M := nextPow2(int(Mf))
	// choose gaussian width parameter delta such that kernel effectively spans ~J samples
	// We pick stddev such that phi(x=J/2) ~ 1e-3: exp(-(J/2)^2/(2*delta^2)) = 1e-3
	// => delta = (J/2) / sqrt(2*ln(1e3))
	delta := (float64(J) / 2.0) / math.Sqrt(2.0*math.Log(1e3))
	kernel := make([]float64, M)
	// sample kernel centered at 0: kernel[n] corresponds to position n in 0..M-1, but we map to signed positions later
	for n := 0; n < M; n++ {
		x := float64(n)
		if n >= M/2 {
			x = float64(n - M) // negative positions
		}
		kernel[n] = gaussian(x, delta)
	}
	// compute kernel DFT (H_k)
	// We will compute FFT(kernel) with our internal FFT
	kernelDFT := make([]complex128, M)
	for i := 0; i < M; i++ {
		kernelDFT[i] = complex(kernel[i], 0)
	}
	fft(kernelDFT) // now kernelDFT holds H_k (unnormalized). We'll keep consistent forward FFT convention.
	return &NUFFT{
		N:         N,
		sigma:     sigma,
		J:         J,
		M:         M,
		delta:     delta,
		kernel:    kernel,
		kernelDFT: kernelDFT,
	}, nil
}

// Type1 performs the NUFFT type-1 (nonuniform -> uniform Fourier modes).
// x: locations in [0,1) for each sample (length K).
// c: complex sample values at x (length K).
// returns F of length N (Fourier modes k=0..N-1), i.e. F_k = sum_j c_j * exp(-2π i k x_j)
func (u *NUFFT) Type1(x []float64, c []complex128) ([]complex128, error) {
	K := len(x)
	if K != len(c) {
		return nil, fmt.Errorf("len(x) must equal len(c)")
	}
	M := u.M
	// zero oversampled grid
	grid := make([]complex128, M)
	// spread each nonuniform sample onto grid
	for j := 0; j < K; j++ {
		xx := x[j]
		if xx < 0 || xx >= 1 {
			// wrap periodicly
			xx = xx - math.Floor(xx)
		}
		t := xx * float64(M) // continuous grid coordinate
		m0 := int(math.Round(t))
		halfJ := u.J / 2
		// spread to neighbors m in [m0-halfJ .. m0+halfJ]
		for dj := -halfJ; dj <= halfJ; dj++ {
			m := m0 + dj
			// wrap into [0,M)
			mWrapped := ((m % M) + M) % M
			// kernel argument: distance from sample to grid index
			dist := t - float64(m)
			weight := gaussian(dist, u.delta)
			grid[mWrapped] += c[j] * complex(weight, 0)
		}
	}
	// forward FFT of grid
	fft(grid) // unnormalized forward FFT
	// deconvolve by kernel DFT and take first N modes
	F := make([]complex128, u.N)
	// kernelDFT is FFT(kernel) already
	threshold := 1e-12
	for k := 0; k < u.N; k++ {
		Hk := u.kernelDFT[k]
		absH := cmplx.Abs(Hk)
		if absH < threshold {
			// avoid division by 0 — set to zero (or leave uncorrected)
			F[k] = 0
		} else {
			F[k] = grid[k] / Hk
		}
	}
	// Note: our FFT forward is unnormalized, while mathematical DFT used in definitions
	// uses standard conventions; for a consistent normalization across forward/inverse use the same convention.
	// If you want unitary transforms, divide/scale accordingly outside.
	return F, nil
}

// Type2 performs the NUFFT type-2 (uniform Fourier coefficients -> nonuniform samples).
// F: Fourier coefficients length N (F_k representing k=0..N-1).
// x: locations in [0,1) at which to evaluate the inverse (len K).
// returns f_j approximations of f(x_j) = sum_k F_k * exp(2π i k x_j).
func (u *NUFFT) Type2(F []complex128, x []float64) ([]complex128, error) {
	if len(F) != u.N {
		return nil, fmt.Errorf("len(F) must equal N")
	}
	K := len(x)
	M := u.M
	// pad F into length M (indices 0..N-1)
	G := make([]complex128, M)
	for k := 0; k < u.N; k++ {
		G[k] = F[k]
	}
	// multiply by kernel DFT (H_k)
	for k := 0; k < M; k++ {
		G[k] *= u.kernelDFT[k]
	}
	// inverse FFT to obtain grid samples (unnormalized inverse)
	ifft(G)
	// interpolate grid at nonuniform points via kernel
	out := make([]complex128, K)
	for j := 0; j < K; j++ {
		xx := x[j]
		if xx < 0 || xx >= 1 {
			xx = xx - math.Floor(xx)
		}
		t := xx * float64(M)
		m0 := int(math.Round(t))
		halfJ := u.J / 2
		var val complex128
		for dj := -halfJ; dj <= halfJ; dj++ {
			m := m0 + dj
			mWrapped := ((m % M) + M) % M
			dist := t - float64(m)
			weight := gaussian(dist, u.delta)
			val += G[mWrapped] * complex(weight, 0)
		}
		out[j] = val
	}
	return out, nil
}

// gaussian kernel phi(x) = exp(-x^2 / (2*delta^2))
func gaussian(x, delta float64) float64 {
	return math.Exp(-(x * x) / (2.0 * delta * delta))
}

// nextPow2 returns the smallest power-of-two >= n
func nextPow2(n int) int {
	if n <= 1 {
		return 1
	}
	p := 1
	for p < n {
		p <<= 1
	}
	return p
}

// ----------------- FFT implementation (in-place, radix-2) ------------------
//
// We implement an unnormalized forward FFT:
//   X[k] = sum_{n=0}^{N-1} x[n] * exp(-2πi n k / N)
// and inverse FFT:
//   x[n] = (1/N) * sum_{k=0}^{N-1} X[k] * exp(2πi n k / N)
// The implementation does bit-reversal reordering and iterative Danielson-Lanczos loops.
//
// Note: input length must be a power-of-two.

func fft(a []complex128) {
	n := len(a)
	if n == 1 {
		return
	}
	if (n & (n - 1)) != 0 {
		panic("fft: length must be power of two")
	}
	// bit-reverse
	j := 0
	for i := 0; i < n; i++ {
		if i < j {
			a[i], a[j] = a[j], a[i]
		}
		m := n >> 1
		for j >= m && m > 0 {
			j -= m
			m >>= 1
		}
		j += m
	}
	// Cooley-Tukey
	for len_ := 2; len_ <= n; len_ <<= 1 {
		angle := -2.0 * math.Pi / float64(len_)
		wlen := complex(math.Cos(angle), math.Sin(angle))
		for i := 0; i < n; i += len_ {
			w := complex(1.0, 0.0)
			for j := 0; j < len_/2; j++ {
				u := a[i+j]
				v := a[i+j+len_/2] * w
				a[i+j] = u + v
				a[i+j+len_/2] = u - v
				w *= wlen
			}
		}
	}
}

// inverse FFT (in-place). Uses normalization 1/N.
func ifft(a []complex128) {
	n := len(a)
	// conjugate, forward FFT, conjugate, divide by n
	for i := 0; i < n; i++ {
		a[i] = cmplx.Conj(a[i])
	}
	fft(a)
	for i := 0; i < n; i++ {
		a[i] = cmplx.Conj(a[i]) / complex(float64(n), 0)
	}
}
