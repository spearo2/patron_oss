/*
 *    This file is part of darktable,
 *    Copyright (C) 2018-2021 darktable developers.
 *
 *    darktable is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    darktable is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with darktable.  If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include <stddef.h>
#include <math.h>
#include <stdint.h>
#ifdef __SSE__
#include <xmmintrin.h>
#endif
#include "common/darktable.h"

// work around missing standard math.h symbols
/** ln(10) */
#ifndef M_LN10
#define M_LN10 2.30258509299404568402
#endif /* !M_LN10 */

/** PI */
#ifndef M_PI
#define M_PI   3.14159265358979323846
#endif /* !M_PI */
#ifndef M_PI_F
#define M_PI_F  3.14159265358979324f
#endif /* !M_PI_F */


#define DT_M_PI_F (3.14159265358979324f)
#define DT_M_PI (3.14159265358979324)

#define DT_M_LN2f (0.6931471805599453f)

// clip channel value to be between 0 and 1
// NaN-safe: NaN compares false and will result in 0.0
// also does not force promotion of floats to doubles, but will use the type of its argument
#define CLIP(x) (((x) >= 0) ? ((x) <= 1 ? (x) : 1) : 0)
#define MM_CLIP_PS(X) (_mm_min_ps(_mm_max_ps((X), _mm_setzero_ps()), _mm_set1_ps(1.0)))

// clip luminance values to be between 0 and 100
#define LCLIP(x) ((x < 0) ? 0.0 : (x > 100.0) ? 100.0 : x)

// clamp value to lie between mn and mx
// Nan-safe: NaN compares false and will result in mn
#define CLAMPF(a, mn, mx) ((a) >= (mn) ? ((a) <= (mx) ? (a) : (mx)) : (mn))
//#define CLAMPF(a, mn, mx) ((a) < (mn) ? (mn) : ((a) > (mx) ? (mx) : (a)))

#if defined(__SSE__)
#define MMCLAMPPS(a, mn, mx) (_mm_min_ps((mx), _mm_max_ps((a), (mn))))
#endif

static inline float clamp_range_f(const float x, const float low, const float high)
{
  return x > high ? high : (x < low ? low : x);
}

// Kahan summation algorithm
#ifdef _OPENMP
#pragma omp declare simd aligned(c)
#endif
static inline float Kahan_sum(const float m, float *const __restrict__ c, const float add)
{
   const float t1 = add - (*c);
   const float t2 = m + t1;
   *c = (t2 - m) - t1;
   return t2;
}

#ifdef __SSE2__
// vectorized Kahan summation algorithm
static inline __m128 Kahan_sum_sse(const __m128 m, __m128 *const __restrict__ c, const __m128 add)
{
   const __m128 t1 = add - (*c);
   const __m128 t2 = m + t1;
   *c = (t2 - m) - t1;
   return t2;
}
#endif /* __SSE2__ */

static inline float Log2(float x)
{
  return (x > 0.0f) ? (logf(x) / DT_M_LN2f) : x;
}

static inline float Log2Thres(float x, float Thres)
{
  return logf(x > Thres ? x : Thres) / DT_M_LN2f;
}

// ensure that any changes here are synchronized with data/kernels/extended.cl
static inline float fastlog2(float x)
{
  union { float f; uint32_t i; } vx = { x };
  union { uint32_t i; float f; } mx = { (vx.i & 0x007FFFFF) | 0x3f000000 };

  float y = vx.i;

  y *= 1.1920928955078125e-7f;

  return y - 124.22551499f
    - 1.498030302f * mx.f
    - 1.72587999f / (0.3520887068f + mx.f);
}

// ensure that any changes here are synchronized with data/kernels/extended.cl
static inline float
fastlog (float x)
{
  return DT_M_LN2f * fastlog2(x);
}

// multiply 3x3 matrix with 3x1 vector
// dest needs to be different from v
#ifdef _OPENMP
#pragma omp declare simd
#endif
static inline void mat3mulv(float *const __restrict__ dest, const float *const mat, const float *const __restrict__ v)
{
  for(int k = 0; k < 3; k++)
  {
    float x = 0.0f;
    for(int i = 0; i < 3; i++)
      x += mat[3 * k + i] * v[i];
    dest[k] = x;
  }
}

// multiply two 3x3 matrices
// dest needs to be different from m1 and m2
// dest = m1 * m2 in this order
#ifdef _OPENMP
#pragma omp declare simd
#endif
static inline void mat3mul(float *const __restrict__ dest, const float *const __restrict__ m1, const float *const __restrict__ m2)
{
  for(int k = 0; k < 3; k++)
  {
    for(int i = 0; i < 3; i++)
    {
      float x = 0.0f;
      for(int j = 0; j < 3; j++)
        x += m1[3 * k + j] * m2[3 * j + i];
      dest[3 * k + i] = x;
    }
  }
}

// multiply two padded 3x3 matrices
// dest needs to be different from m1 and m2
// dest = m1 * m2 in this order
#ifdef _OPENMP
#pragma omp declare simd
#endif
static inline void mat3SSEmul(dt_colormatrix_t dest, const dt_colormatrix_t m1, const dt_colormatrix_t m2)
{
  for(int k = 0; k < 3; k++)
  {
    for(int i = 0; i < 3; i++)
    {
      float x = 0.0f;
      for(int j = 0; j < 3; j++)
        x += m1[k][j] * m2[j][i];
      dest[k][i] = x;
    }
  }
}

#ifdef _OPENMP
#pragma omp declare simd
#endif
static inline void mul_mat_vec_2(const float *m, const float *p, float *o)
{
  o[0] = p[0] * m[0] + p[1] * m[1];
  o[1] = p[0] * m[2] + p[1] * m[3];
}

#ifdef _OPENMP
#pragma omp declare simd uniform(v_2) aligned(v_1, v_2:16)
#endif
static inline float scalar_product(const dt_aligned_pixel_t v_1, const dt_aligned_pixel_t v_2)
{
  // specialized 3×1 dot products 2 4×1 RGB-alpha pixels.
  // v_2 needs to be uniform along loop increments, e.g. independent from current pixel values
  // we force an order of computation similar to SSE4 _mm_dp_ps() hoping the compiler will get the clue
  float acc = 0.f;

#ifdef _OPENMP
#pragma omp simd aligned(v_1, v_2:16) reduction(+:acc)
#endif
  for(size_t c = 0; c < 3; c++) acc += v_1[c] * v_2[c];

  return acc;
}


#ifdef _OPENMP
#pragma omp declare simd uniform(M) aligned(M:64) aligned(v_in, v_out:16)
#endif
static inline void dot_product(const dt_aligned_pixel_t v_in, const dt_colormatrix_t M, dt_aligned_pixel_t v_out)
{
  // specialized 3×4 dot products of 4×1 RGB-alpha pixels
  #ifdef _OPENMP
  #pragma omp simd aligned(M:64) aligned(v_in, v_out:16)
  #endif
  for(size_t i = 0; i < 3; ++i) v_out[i] = scalar_product(v_in, M[i]);
}


#ifdef _OPENMP
#pragma omp declare simd
#endif
static inline float dt_log2f(const float f)
{
#ifdef __GLIBC__
  return log2f(f);
#else
  return logf(f) / logf(2.0f);
#endif
}

union float_int {
  float f;
  int k;
};

// a faster, vectorizable version of hypotf() when we know that there won't be overflow, NaNs, or infinities
#ifdef _OPENMP
#pragma omp declare simd
#endif
static inline float dt_fast_hypotf(const float x, const float y)
{
  return sqrtf(x * x + y * y);
}

// fast approximation of expf()
/****** if you change this function, you need to make the same change in data/kernels/{basecurve,basic}.cl ***/
#ifdef _OPENMP
#pragma omp declare simd
#endif
static inline float dt_fast_expf(const float x)
{
  // meant for the range [-100.0f, 0.0f]. largest error ~ -0.06 at 0.0f.
  // will get _a_lot_ worse for x > 0.0f (9000 at 10.0f)..
  const int i1 = 0x3f800000u;
  // e^x, the comment would be 2^x
  const int i2 = 0x402DF854u; // 0x40000000u;
  // const int k = CLAMPS(i1 + x * (i2 - i1), 0x0u, 0x7fffffffu);
  // without max clamping (doesn't work for large x, but is faster):
  const int k0 = i1 + x * (i2 - i1);
  union float_int u;
  u.k = k0 > 0 ? k0 : 0;
  return u.f;
}

static inline void dt_fast_expf_4wide(const float x[4], float result[4])
{
  // meant for the range [-100.0f, 0.0f]. largest error ~ -0.06 at 0.0f.
  // will get _a_lot_ worse for x > 0.0f (9000 at 10.0f)..
  const int i1 = 0x3f800000u;
  // e^x, the comment would be 2^x
  const int i2 = 0x402DF854u; // 0x40000000u;
  // const int k = CLAMPS(i1 + x * (i2 - i1), 0x0u, 0x7fffffffu);
  // without max clamping (doesn't work for large x, but is faster):
  union float_int u[4];
#ifdef _OPENMP
#pragma omp simd aligned(x, result)
#endif
  for(size_t c = 0; c < 4; c++)
  {
    const int k0 = i1 + (int)(x[c] * (i2 - i1));
    u[c].k = k0 > 0 ? k0 : 0;
    result[c] = u[c].f;
  }
}

#if defined(__SSE2__)
#define ALIGNED(a) __attribute__((aligned(a)))
#define VEC4(a)                                                                                              \
  {                                                                                                          \
    (a), (a), (a), (a)                                                                                       \
  }

/* SSE intrinsics version of dt_fast_expf */
static const __m128 dt__fone ALIGNED(64) = VEC4(0x3f800000u);
static const __m128 femo ALIGNED(64) = VEC4(0x00adf880u);
static inline __m128 dt_fast_expf_sse2(const __m128 x)
{
  __m128 f = dt__fone + (x * femo);                 // f(n) = i1 + x(n)*(i2-i1)
  __m128i i = _mm_cvtps_epi32(f);                   // i(n) = int(f(n))
  __m128i mask = _mm_srai_epi32(i, 31);             // mask(n) = 0xffffffff if i(n) < 0
  i = _mm_andnot_si128(mask, i);                    // i(n) = 0 if i(n) < 0
  return _mm_castsi128_ps(i);                       // return *(float*)&i
}
#undef ALIGNED
#undef VEC4

#endif // __SSE2__

// fast approximation of 2^-x for 0<x<126
/****** if you change this function, you need to make the same change in data/kernels/{denoiseprofile,nlmeans}.cl ***/
static inline float dt_fast_mexp2f(const float x)
{
  const int i1 = 0x3f800000; // bit representation of 2^0
  const int i2 = 0x3f000000; // bit representation of 2^-1
  const int k0 = i1 + (int)(x * (i2 - i1));
  union {
    float f;
    int i;
  } k;
  k.i = k0 >= 0x800000 ? k0 : 0;
  return k.f;
}

// The below version is incorrect, suffering from reduced precision.
// It is used by the non-local means code in both nlmeans.c and
// denoiseprofile.c, and fixing it would cause a change in output.
static inline float fast_mexp2f(const float x)
{
  const float i1 = (float)0x3f800000u; // 2^0
  const float i2 = (float)0x3f000000u; // 2^-1
  const float k0 = i1 + x * (i2 - i1);
  union {
    float f;
    int i;
  } k;
  k.i = k0 >= (float)0x800000u ? k0 : 0;
  return k.f;
}

/** Compute ceil value of a float
 * @remark Avoid libc ceil for now. Maybe we'll revert to libc later.
 * @param x Value to ceil
 * @return ceil value
 */
static inline float ceil_fast(float x)
{
  if(x <= 0.f)
  {
    return (float)(int)x;
  }
  else
  {
    return -((float)(int)-x) + 1.f;
  }
}

#if defined(__SSE2__)
/** Compute absolute value
 * @param t Vector of 4 floats
 * @return Vector of their absolute values
 */ static inline __m128 _mm_abs_ps(__m128 t)
{
  static const uint32_t signmask[4] __attribute__((aligned(64)))
  = { 0x7fffffff, 0x7fffffff, 0x7fffffff, 0x7fffffff };
  return _mm_and_ps(*(__m128 *)signmask, t);
}
#endif

/** Compute an approximate sine.
 * This function behaves correctly for the range [-pi pi] only.
 * It has the following properties:
 * <ul>
 *   <li>It has exact values for 0, pi/2, pi, -pi/2, -pi</li>
 *   <li>It has matching derivatives to sine for these same points</li>
 *   <li>Its relative error margin is <= 1% iirc</li>
 *   <li>It computational cost is 5 mults + 3 adds + 2 abs</li>
 * </ul>
 * @param t Radian parameter
 * @return guess what
 */
static inline float sinf_fast(float t)
{
  /***** if you change this function, you must also change the copy in data/kernels/basic.cl *****/
  static const float a = 4 / (M_PI * M_PI);
  static const float p = 0.225f;

  t = a * t * (M_PI_F - fabsf(t));

  return t * (p * (fabsf(t) - 1) + 1);
}

#if defined(__SSE2__)
/** Compute an approximate sine (SSE version, four sines a call).
 * This function behaves correctly for the range [-pi pi] only.
 * It has the following properties:
 * <ul>
 *   <li>It has exact values for 0, pi/2, pi, -pi/2, -pi</li>
 *   <li>It has matching derivatives to sine for these same points</li>
 *   <li>Its relative error margin is <= 1% iirc</li>
 *   <li>It computational cost is 5 mults + 3 adds + 2 abs</li>
 * </ul>
 * @param t Radian parameter
 * @return guess what
 */
static inline __m128 sinf_fast_sse(__m128 t)
{
  static const __m128 a
      = { 4.f / (M_PI * M_PI), 4.f / (M_PI * M_PI), 4.f / (M_PI * M_PI), 4.f / (M_PI * M_PI) };
  static const __m128 p = { 0.225f, 0.225f, 0.225f, 0.225f };
  static const __m128 pi = { M_PI, M_PI, M_PI, M_PI };

  // m4 = a*t*(M_PI - fabsf(t));
  const __m128 m1 = _mm_abs_ps(t);
  const __m128 m2 = _mm_sub_ps(pi, m1);
  const __m128 m3 = _mm_mul_ps(t, m2);
  const __m128 m4 = _mm_mul_ps(a, m3);

  // p*(m4*fabsf(m4) - m4) + m4;
  const __m128 n1 = _mm_abs_ps(m4);
  const __m128 n2 = _mm_mul_ps(m4, n1);
  const __m128 n3 = _mm_sub_ps(n2, m4);
  const __m128 n4 = _mm_mul_ps(p, n3);

  return _mm_add_ps(n4, m4);
}
#endif


// modelines: These editor modelines have been set for all relevant files by tools/update_modelines.sh
// vim: shiftwidth=2 expandtab tabstop=2 cindent
// kate: tab-indents: off; indent-width 2; replace-tabs on; indent-mode cstyle; remove-trailing-spaces modified;
