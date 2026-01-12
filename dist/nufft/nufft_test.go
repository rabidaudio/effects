package nufft

import (
	"math"
	"math/cmplx"
	"math/rand"
	"testing"
)

// directDFT computes F_k = sum_j c_j * exp(-2π i k x_j), k=0..N-1
func directDFT(x []float64, c []complex128, N int) []complex128 {
	K := len(x)
	F := make([]complex128, N)
	for k := 0; k < N; k++ {
		var sum complex128
		for j := 0; j < K; j++ {
			angle := -2.0 * math.Pi * float64(k) * x[j]
			sum += c[j] * complex(math.Cos(angle), math.Sin(angle))
		}
		F[k] = sum
	}
	return F
}

// directIDFT computes f_j = sum_k F_k * exp(2π i k x_j)
func directIDFT(F []complex128, x []float64) []complex128 {
	N := len(F)
	K := len(x)
	out := make([]complex128, K)
	for j := 0; j < K; j++ {
		var sum complex128
		for k := 0; k < N; k++ {
			angle := 2.0 * math.Pi * float64(k) * x[j]
			sum += F[k] * complex(math.Cos(angle), math.Sin(angle))
		}
		out[j] = sum
	}
	return out
}

func TestNUFFT_Type1_vs_Direct(t *testing.T) {
	rnd := rand.New(rand.NewSource(12345))
	N := 64
	K := 120
	x := make([]float64, K)
	c := make([]complex128, K)
	for j := 0; j < K; j++ {
		x[j] = rnd.Float64() // in [0,1)
		// random complex
		c[j] = complex(rnd.NormFloat64(), rnd.NormFloat64())
	}
	nufft, err := NewNUFFT(N, 2.0, 8)
	if err != nil {
		t.Fatal(err)
	}
	F_dir := directDFT(x, c, N)
	F_nu, err := nufft.Type1(x, c)
	if err != nil {
		t.Fatal(err)
	}
	// compute relative error
	var errMax float64
	var maxAbs float64
	for k := 0; k < N; k++ {
		diff := cmplx.Abs(F_dir[k] - F_nu[k])
		abs := cmplx.Abs(F_dir[k])
		if diff > errMax {
			errMax = diff
		}
		if abs > maxAbs {
			maxAbs = abs
		}
	}
	relErr := errMax / (maxAbs + 1e-16)
	t.Logf("Type1 max abs error = %g, relative = %g", errMax, relErr)
	if relErr > 1e-2 {
		t.Fatalf("relative error too large: %g", relErr)
	}
}

func TestNUFFT_Type2_vs_Direct(t *testing.T) {
	rnd := rand.New(rand.NewSource(54321))
	N := 64
	K := 120
	x := make([]float64, K)
	for j := 0; j < K; j++ {
		x[j] = rnd.Float64()
	}
	// Choose random Fourier coefficients
	F := make([]complex128, N)
	for k := 0; k < N; k++ {
		F[k] = complex(rnd.NormFloat64(), rnd.NormFloat64())
	}
	nufft, err := NewNUFFT(N, 2.0, 8)
	if err != nil {
		t.Fatal(err)
	}
	f_dir := directIDFT(F, x)
	f_nu, err := nufft.Type2(F, x)
	if err != nil {
		t.Fatal(err)
	}
	var errMax float64
	var maxAbs float64
	for j := 0; j < K; j++ {
		diff := cmplx.Abs(f_dir[j] - f_nu[j])
		abs := cmplx.Abs(f_dir[j])
		if diff > errMax {
			errMax = diff
		}
		if abs > maxAbs {
			maxAbs = abs
		}
	}
	relErr := errMax / (maxAbs + 1e-16)
	t.Logf("Type2 max abs error = %g, relative = %g", errMax, relErr)
	if relErr > 1e-2 {
		t.Fatalf("relative error too large: %g", relErr)
	}
}
