/*
    This file is part of darktable,
    copyright (c) 2018-2020 darktable developers.

    darktable is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    darktable is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with darktable.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "common.h"
#include "colorspace.h"
#include "color_conversion.h"
#include "noise_generator.h"

#define INVERSE_SQRT_3 0.5773502691896258f

// In case the OpenCL driver doesn't have a dot method
static inline float vdot(const float4 vec1, const float4 vec2)
{
    return vec1.x * vec2.x + vec1.y * vec2.y + vec1.z * vec2.z;
}

typedef enum dt_iop_filmicrgb_methods_type_t
{
  DT_FILMIC_METHOD_NONE = 0,
  DT_FILMIC_METHOD_MAX_RGB = 1,
  DT_FILMIC_METHOD_LUMINANCE = 2,
  DT_FILMIC_METHOD_POWER_NORM = 3,
  DT_FILMIC_METHOD_EUCLIDEAN_NORM_V2 = 5,
  DT_FILMIC_METHOD_EUCLIDEAN_NORM_V1 = 4,
} dt_iop_filmicrgb_methods_type_t;

typedef enum dt_iop_filmicrgb_colorscience_type_t
{
  DT_FILMIC_COLORSCIENCE_V1 = 0,
  DT_FILMIC_COLORSCIENCE_V2 = 1,
  DT_FILMIC_COLORSCIENCE_V3 = 2,
} dt_iop_filmicrgb_colorscience_type_t;

typedef enum dt_iop_filmicrgb_reconstruction_type_t
{
  DT_FILMIC_RECONSTRUCT_RGB = 0,
  DT_FILMIC_RECONSTRUCT_RATIOS = 1,
} dt_iop_filmicrgb_reconstruction_type_t;

typedef enum dt_iop_filmicrgb_curve_type_t
{
  DT_FILMIC_CURVE_POLY_4 = 0, // $DESCRIPTION: "hard"
  DT_FILMIC_CURVE_POLY_3 = 1,  // $DESCRIPTION: "soft"
  DT_FILMIC_CURVE_RATIONAL = 2, // $DESCRIPTION: "safe"
} dt_iop_filmicrgb_curve_type_t;

kernel void
filmic (read_only image2d_t in, write_only image2d_t out, int width, int height,
        const float dynamic_range, const float shadows_range, const float grey,
        read_only image2d_t table, read_only image2d_t diff,
        const float contrast, const float power, const int preserve_color,
        const float saturation)
{
  const unsigned int x = get_global_id(0);
  const unsigned int y = get_global_id(1);

  if(x >= width || y >= height) return;

  float4 i = read_imagef(in, sampleri, (int2)(x, y));
  const float4 xyz = Lab_to_XYZ(i);
  float4 o = XYZ_to_prophotorgb(xyz);

  const float noise = pow(2.0f, -16.0f);
  const float4 noise4 = noise;
  const float4 dynamic4 = dynamic_range;
  const float4 shadows4 = shadows_range;
  float derivative, luma;

  // Global desaturation
  if (saturation != 1.0f)
  {
    const float4 lum = xyz.y;
    o = lum + (float4)saturation * (o - lum);
  }

  if (preserve_color)
  {

    // Save the ratios
    float maxRGB = max(max(o.x, o.y), o.z);
    const float4 ratios = o / (float4)maxRGB;

    // Log profile
    maxRGB = maxRGB / grey;
    maxRGB = (maxRGB < noise) ? noise : maxRGB;
    maxRGB = (native_log2(maxRGB) - shadows_range) / dynamic_range;
    maxRGB = clamp(maxRGB, 0.0f, 1.0f);

    const float index = maxRGB;

    // Curve S LUT
    maxRGB = lookup(table, (const float)maxRGB);

    // Re-apply the ratios
    o = (float4)maxRGB * ratios;

    // Derivative
    derivative = lookup(diff, (const float)index);
    luma = maxRGB;
  }
  else
  {
    // Log profile
    o = o / grey;
    o = (o < noise) ? noise : o;
    o = (native_log2(o) - shadows4) / dynamic4;
    o = clamp(o, (float4)0.0f, (float4)1.0f);

    const float index = prophotorgb_to_XYZ(o).y;

    // Curve S LUT
    o.x = lookup(table, (const float)o.x);
    o.y = lookup(table, (const float)o.y);
    o.z = lookup(table, (const float)o.z);

    // Get the derivative
    derivative = lookup(diff, (const float)index);
    luma = prophotorgb_to_XYZ(o).y;
  }

  // Desaturate selectively
  o = (float4)luma + (float4)derivative * (o - (float4)luma);
  o = clamp(o, (float4)0.0f, (float4)1.0f);

  // Apply the transfer function of the display
  const float4 power4 = power;
  o = native_powr(o, power4);

  i.xyz = prophotorgb_to_Lab(o).xyz;

  write_imagef(out, (int2)(x, y), i);
}


/* Norms */
static inline float pixel_rgb_norm_power(const float4 pixel)
{
  // weird norm sort of perceptual. This is black magic really, but it looks good.
  const float4 RGB = fabs(pixel);
  const float4 RGB_square = RGB * RGB;
  const float4 RGB_cubic = RGB_square * RGB;
  return (RGB_cubic.x + RGB_cubic.y + RGB_cubic.z) / fmax(RGB_square.x + RGB_square.y + RGB_square.z, 1e-12f);
}

static inline float pixel_rgb_norm_euclidean(const float4 pixel)
{
  const float4 RGB = pixel;
  const float4 RGB_square = RGB * RGB;
  return native_sqrt(RGB_square.x + RGB_square.y + RGB_square.z);
}

static inline float get_pixel_norm(const float4 pixel, const dt_iop_filmicrgb_methods_type_t variant,
                                   constant const dt_colorspaces_iccprofile_info_cl_t *const profile_info,
                                   read_only image2d_t lut, const int use_work_profile)
{
  switch(variant)
  {
    case DT_FILMIC_METHOD_MAX_RGB:
      return fmax(fmax(pixel.x, pixel.y), pixel.z);

    case DT_FILMIC_METHOD_LUMINANCE:
      return (use_work_profile) ? get_rgb_matrix_luminance(pixel, profile_info, profile_info->matrix_in, lut)
                                : dt_camera_rgb_luminance(pixel);

    case DT_FILMIC_METHOD_POWER_NORM:
      return pixel_rgb_norm_power(pixel);

    case DT_FILMIC_METHOD_EUCLIDEAN_NORM_V1:
      return pixel_rgb_norm_euclidean(pixel);

    case DT_FILMIC_METHOD_EUCLIDEAN_NORM_V2:
      return pixel_rgb_norm_euclidean(pixel) * INVERSE_SQRT_3;

    case DT_FILMIC_METHOD_NONE:
    default:
      return (use_work_profile) ? get_rgb_matrix_luminance(pixel, profile_info, profile_info->matrix_in, lut)
                                : dt_camera_rgb_luminance(pixel);
  }
}

/* Saturation */

static inline float filmic_desaturate_v1(const float x, const float sigma_toe, const float sigma_shoulder, const float saturation)
{
  const float radius_toe = x;
  const float radius_shoulder = 1.0f - x;

  const float key_toe = native_exp(-0.5f * radius_toe * radius_toe / sigma_toe);
  const float key_shoulder = native_exp(-0.5f * radius_shoulder * radius_shoulder / sigma_shoulder);

  return 1.0f - clamp((key_toe + key_shoulder) / saturation, 0.0f, 1.0f);
}


static inline float filmic_desaturate_v2(const float x, const float sigma_toe, const float sigma_shoulder, const float saturation)
{
  const float radius_toe = x;
  const float radius_shoulder = 1.0f - x;
  const float sat2 = 0.5f / native_sqrt(saturation);
  const float key_toe = native_exp(-radius_toe * radius_toe / sigma_toe * sat2);
  const float key_shoulder = native_exp(-radius_shoulder * radius_shoulder / sigma_shoulder * sat2);

  return (saturation - (key_toe + key_shoulder) * (saturation));
}


static inline float4 linear_saturation(const float4 x, const float luminance, const float saturation)
{
  return (float4)luminance + (float4)saturation * (x - (float4)luminance);
}


static inline float filmic_spline(const float x,
                                  const float4 M1, const float4 M2, const float4 M3, const float4 M4, const float4 M5,
                                  const float latitude_min, const float latitude_max,
                                  const dt_iop_filmicrgb_curve_type_t type[2])
{
  // if type polynomial :
  // y = M5 * x⁴ + M4 * x³ + M3 * x² + M2 * x¹ + M1 * x⁰
  // but we rewrite it using Horner factorisation, to spare ops and enable FMA in available
  // else if type rational :
  // y = M1 * (M2 * (x - x_0)² + (x - x_0)) / (M2 * (x - x_0)² + (x - x_0) + M3)

  float result;

  if(x < latitude_min)
  {
    // toe
    if(type[0] == DT_FILMIC_CURVE_POLY_4)
    {
      // polynomial toe, 4th order
      result = M1.x + x * (M2.x + x * (M3.x + x * (M4.x + x * M5.x)));
    }
    else if(type[0] == DT_FILMIC_CURVE_POLY_3)
    {
      // polynomial toe, 3rd order
      result = M1.x + x * (M2.x + x * (M3.x + x * M4.x));
    }
    else
    {
      // rational toe
      const float xi = latitude_min - x;
      const float rat = xi * (xi * M2.x + 1.f);
      result = M4.x - M1.x * rat / (rat + M3.x);
    }
  }
  else if(x > latitude_max)
  {
    // shoulder
    if(type[1] == DT_FILMIC_CURVE_POLY_4)
    {
      // polynomial shoulder, 4th order
      result = M1.y + x * (M2.y + x * (M3.y + x * (M4.y + x * M5.y)));
    }
    else if(type[1] == DT_FILMIC_CURVE_POLY_3)
    {
      // polynomial shoulder, 3rd order
      result = M1.y + x * (M2.y + x * (M3.y + x * M4.y));
    }
    else
    {
      // rational toe
      const float xi = x - latitude_max;
      const float rat = xi * (xi * M2.y + 1.f);
      result = M4.y + M1.y * rat / (rat + M3.y);
    }
  }
  else
  {
    // latitude
    result = M1.z + x * M2.z;
  }

  return result;
}

#define NORM_MIN 1.52587890625e-05f // norm can't be < to 2^(-16)


static inline float log_tonemapping_v1(const float x,
                                       const float grey, const float black,
                                       const float dynamic_range)
{
  const float temp = (native_log2(x / grey) - black) / dynamic_range;
  return clamp(temp, NORM_MIN, 1.f);
}

static inline float log_tonemapping_v2(const float x,
                                       const float grey, const float black,
                                       const float dynamic_range)
{
  return clamp((native_log2(x / grey) - black) / dynamic_range, 0.f, 1.f);
}

static inline float4 filmic_split_v1(const float4 i,
                                     const float dynamic_range, const float black_exposure, const float grey_value,
                                     constant const dt_colorspaces_iccprofile_info_cl_t *const profile_info,
                                     read_only image2d_t lut, const int use_work_profile,
                                     const float sigma_toe, const float sigma_shoulder, const float saturation,
                                     const float4 M1, const float4 M2, const float4 M3, const float4 M4, const float4 M5,
                                     const float latitude_min, const float latitude_max, const float output_power,
                                     const dt_iop_filmicrgb_curve_type_t type[2])
{
  float4 o;

  // Log tonemapping
  o.x = log_tonemapping_v1(fmax(i.x, NORM_MIN), grey_value, black_exposure, dynamic_range);
  o.y = log_tonemapping_v1(fmax(i.y, NORM_MIN), grey_value, black_exposure, dynamic_range);
  o.z = log_tonemapping_v1(fmax(i.z, NORM_MIN), grey_value, black_exposure, dynamic_range);

  // Selective desaturation of extreme luminances
  const float luminance = (use_work_profile) ? get_rgb_matrix_luminance(o,
                                                                        profile_info,
                                                                        profile_info->matrix_in,
                                                                        lut)
                                             : dt_camera_rgb_luminance(o);

  const float desaturation = filmic_desaturate_v1(luminance, sigma_toe, sigma_shoulder, saturation);
  o = linear_saturation(o, luminance, desaturation);

  // Filmic spline
  o.x = filmic_spline(o.x, M1, M2, M3, M4, M5, latitude_min, latitude_max, type);
  o.y = filmic_spline(o.y, M1, M2, M3, M4, M5, latitude_min, latitude_max, type);
  o.z = filmic_spline(o.z, M1, M2, M3, M4, M5, latitude_min, latitude_max, type);

  // Output power
  o = native_powr(clamp(o, (float4)0.0f, (float4)1.0f), output_power);

  return o;
}

static inline float4 filmic_split_v2_v3(const float4 i,
                                        const float dynamic_range, const float black_exposure, const float grey_value,
                                        constant const dt_colorspaces_iccprofile_info_cl_t *const profile_info,
                                        read_only image2d_t lut, const int use_work_profile,
                                        const float sigma_toe, const float sigma_shoulder, const float saturation,
                                        const float4 M1, const float4 M2, const float4 M3, const float4 M4, const float4 M5,
                                        const float latitude_min, const float latitude_max, const float output_power,
                                        const dt_iop_filmicrgb_curve_type_t type[2])
{
  float4 o;

  // Log tonemapping
  o.x = log_tonemapping_v2(fmax(i.x, NORM_MIN), grey_value, black_exposure, dynamic_range);
  o.y = log_tonemapping_v2(fmax(i.y, NORM_MIN), grey_value, black_exposure, dynamic_range);
  o.z = log_tonemapping_v2(fmax(i.z, NORM_MIN), grey_value, black_exposure, dynamic_range);

  // Selective desaturation of extreme luminances
  const float luminance = (use_work_profile) ? get_rgb_matrix_luminance(o,
                                                                        profile_info,
                                                                        profile_info->matrix_in,
                                                                        lut)
                                             : dt_camera_rgb_luminance(o);

  const float desaturation = filmic_desaturate_v2(luminance, sigma_toe, sigma_shoulder, saturation);
  o = linear_saturation(o, luminance, desaturation);

  // Filmic spline
  o.x = filmic_spline(o.x, M1, M2, M3, M4, M5, latitude_min, latitude_max, type);
  o.y = filmic_spline(o.y, M1, M2, M3, M4, M5, latitude_min, latitude_max, type);
  o.z = filmic_spline(o.z, M1, M2, M3, M4, M5, latitude_min, latitude_max, type);

  // Output power
  o = native_powr(clamp(o, (float4)0.0f, (float4)1.0f), output_power);

  return o;
}

kernel void
filmicrgb_split (read_only image2d_t in, write_only image2d_t out,
                 const int width, const int height,
                 const float dynamic_range, const float black_exposure, const float grey_value,
                 constant const dt_colorspaces_iccprofile_info_cl_t *const profile_info,
                 read_only image2d_t lut, const int use_work_profile,
                 const float sigma_toe, const float sigma_shoulder, const float saturation,
                 const float4 M1, const float4 M2, const float4 M3, const float4 M4, const float4 M5,
                 const float latitude_min, const float latitude_max, const float output_power,
                 const dt_iop_filmicrgb_colorscience_type_t color_science,
                 const dt_iop_filmicrgb_curve_type_t type_1, const dt_iop_filmicrgb_curve_type_t type_2)
{
  const unsigned int x = get_global_id(0);
  const unsigned int y = get_global_id(1);

  if(x >= width || y >= height) return;

  const float4 i = read_imagef(in, sampleri, (int2)(x, y));
  float4 o;

  const dt_iop_filmicrgb_curve_type_t type[2] = { type_1, type_2 };

  switch(color_science)
  {
    case DT_FILMIC_COLORSCIENCE_V1:
    {
      o = filmic_split_v1(i, dynamic_range, black_exposure, grey_value,
                          profile_info, lut, use_work_profile,
                          sigma_toe, sigma_shoulder, saturation,
                          M1, M2, M3, M4, M5, latitude_min, latitude_max, output_power, type);
      break;
    }
    case DT_FILMIC_COLORSCIENCE_V2:
    case DT_FILMIC_COLORSCIENCE_V3:
    {
      o = filmic_split_v2_v3(i, dynamic_range, black_exposure, grey_value,
                             profile_info, lut, use_work_profile,
                             sigma_toe, sigma_shoulder, saturation,
                             M1, M2, M3, M4, M5, latitude_min, latitude_max, output_power, type);
      break;
    }
  }

  // Copy alpha layer and save
  o.w = i.w;
  write_imagef(out, (int2)(x, y), o);
}


static inline float4 filmic_chroma_v1(const float4 i,
                                      const float dynamic_range, const float black_exposure, const float grey_value,
                                      constant const dt_colorspaces_iccprofile_info_cl_t *const profile_info,
                                      read_only image2d_t lut, const int use_work_profile,
                                      const float sigma_toe, const float sigma_shoulder, const float saturation,
                                      const float4 M1, const float4 M2, const float4 M3, const float4 M4, const float4 M5,
                                      const float latitude_min, const float latitude_max, const float output_power,
                                      const dt_iop_filmicrgb_methods_type_t variant,
                                      const dt_iop_filmicrgb_curve_type_t type[2])
{
  float norm = fmax(get_pixel_norm(i, variant, profile_info, lut, use_work_profile), NORM_MIN);

  // Save the ratios
  float4 o = i / (float4)norm;

  // Sanitize the ratios
  const float min_ratios = fmin(fmin(o.x, o.y), o.z);
  if(min_ratios < 0.0f) o -= (float4)min_ratios;

  // Log tonemapping
  norm = log_tonemapping_v1(norm, grey_value, black_exposure, dynamic_range);

  // Selective desaturation of extreme luminances
  o *= (float4)norm;
  const float luminance = (use_work_profile) ? get_rgb_matrix_luminance(o,
                                                                        profile_info,
                                                                        profile_info->matrix_in,
                                                                        lut)
                                             : dt_camera_rgb_luminance(o);
  const float desaturation = filmic_desaturate_v1(norm, sigma_toe, sigma_shoulder, saturation);
  o = linear_saturation(o, luminance, desaturation);
  o /= (float4)norm;

  // Filmic S curve on the max RGB
  // Apply the transfer function of the display
  norm = native_powr(clamp(filmic_spline(norm, M1, M2, M3, M4, M5, latitude_min, latitude_max, type), 0.0f, 1.0f), output_power);

  return o * norm;
}


static inline float4 filmic_chroma_v2_v3(const float4 i,
                                         const float dynamic_range, const float black_exposure, const float grey_value,
                                         constant const dt_colorspaces_iccprofile_info_cl_t *const profile_info,
                                         read_only image2d_t lut, const int use_work_profile,
                                         const float sigma_toe, const float sigma_shoulder, const float saturation,
                                         const float4 M1, const float4 M2, const float4 M3, const float4 M4, const float4 M5,
                                         const float latitude_min, const float latitude_max, const float output_power,
                                         const dt_iop_filmicrgb_methods_type_t variant,
                                         const dt_iop_filmicrgb_colorscience_type_t colorscience_version,
                                         const dt_iop_filmicrgb_curve_type_t type[2])
{
  float norm = fmax(get_pixel_norm(i, variant, profile_info, lut, use_work_profile), NORM_MIN);

  // Save the ratios
  float4 ratios = i / (float4)norm;

  // Sanitize the ratios
  const float min_ratios = fmin(fmin(ratios.x, ratios.y), ratios.z);
  if(min_ratios < 0.0f) ratios -= (float4)min_ratios;

  // Log tonemapping
  norm = log_tonemapping_v2(norm, grey_value, black_exposure, dynamic_range);

  // Get the desaturation value based on the log value
  const float4 desaturation = (float4)filmic_desaturate_v2(norm, sigma_toe, sigma_shoulder, saturation);

  // Filmic S curve on the max RGB
  // Apply the transfer function of the display
  norm = native_powr(clamp(filmic_spline(norm, M1, M2, M3, M4, M5, latitude_min, latitude_max, type), 0.0f, 1.0f), output_power);

  // Re-apply ratios with saturation change
  ratios = fmax(ratios + ((float4)1.0f - ratios) * ((float4)1.0f - desaturation), (float4)0.f);

  if(colorscience_version == DT_FILMIC_COLORSCIENCE_V3)
    norm /= fmax(get_pixel_norm(ratios, variant, profile_info, lut, use_work_profile), NORM_MIN);

  float4 o = (float4)norm * ratios;

  // Gamut mapping
  const float max_pix = fmax(fmax(o.x, o.y), o.z);
  const int penalize = (max_pix > 1.0f);

  // Penalize the ratios by the amount of clipping
  if(penalize)
  {
    ratios = fmax(ratios + ((float4)1.0f - (float4)max_pix), (float4)0.0f);
    o = clamp((float4)norm * ratios, (float4)0.0f, (float4)1.0f);
  }

  return o;
}

kernel void
filmicrgb_chroma (read_only image2d_t in, write_only image2d_t out,
                 const int width, const int height,
                 const float dynamic_range, const float black_exposure, const float grey_value,
                 constant const dt_colorspaces_iccprofile_info_cl_t *const profile_info,
                 read_only image2d_t lut, const int use_work_profile,
                 const float sigma_toe, const float sigma_shoulder, const float saturation,
                 const float4 M1, const float4 M2, const float4 M3, const float4 M4, const float4 M5,
                 const float latitude_min, const float latitude_max, const float output_power,
                 const dt_iop_filmicrgb_methods_type_t variant,
                 const dt_iop_filmicrgb_colorscience_type_t color_science,
                 const dt_iop_filmicrgb_curve_type_t type_1, const dt_iop_filmicrgb_curve_type_t type_2)
{
  const unsigned int x = get_global_id(0);
  const unsigned int y = get_global_id(1);

  if(x >= width || y >= height) return;

  const float4 i = read_imagef(in, sampleri, (int2)(x, y));
  float4 o;

  const dt_iop_filmicrgb_curve_type_t type[2] = { type_1, type_2 };

  switch(color_science)
  {
    case DT_FILMIC_COLORSCIENCE_V1:
    {
      o = filmic_chroma_v1(i, dynamic_range, black_exposure, grey_value,
                           profile_info, lut, use_work_profile,
                           sigma_toe, sigma_shoulder, saturation,
                           M1, M2, M3, M4, M5, latitude_min, latitude_max, output_power, variant, type);
      break;
    }
    case DT_FILMIC_COLORSCIENCE_V2:
    case DT_FILMIC_COLORSCIENCE_V3:
    {
      o = filmic_chroma_v2_v3(i, dynamic_range, black_exposure, grey_value,
                              profile_info, lut, use_work_profile,
                              sigma_toe, sigma_shoulder, saturation,
                              M1, M2, M3, M4, M5, latitude_min, latitude_max, output_power, variant,
                              color_science, type);
      break;
    }
  }

  o.w = i.w;
  write_imagef(out, (int2)(x, y), o);
}


kernel void
filmic_mask_clipped_pixels(read_only image2d_t in, write_only image2d_t out,
                           int width, int height,
                           const float normalize, const float feathering, write_only image2d_t is_clipped)
{
  const unsigned int x = get_global_id(0);
  const unsigned int y = get_global_id(1);

  if(x >= width || y >= height) return;

  float4 i = read_imagef(in, sampleri, (int2)(x, y));
  const float4 i2 = i * i;

  const float pix_max = fmax(native_sqrt(i2.x + i2.y + i2.z), 0.f);
  const float argument = -pix_max * normalize + feathering;
  const float weight = clamp(1.0f / ( 1.0f + native_exp2(argument)), 0.f, 1.f);

  if(4.f > argument) write_imageui(is_clipped, (int2)(0, 0), 1);

  write_imagef(out, (int2)(x, y), weight);
}

kernel void
filmic_show_mask(read_only image2d_t in, write_only image2d_t out,
                 const int width, const int height)
{
  const unsigned int x = get_global_id(0);
  const unsigned int y = get_global_id(1);

  if(x >= width || y >= height) return;

  const float i = (read_imagef(in, sampleri, (int2)(x, y))).x;
  write_imagef(out, (int2)(x, y), (float4){i, i, i, 1.0f});
}


kernel void
filmic_inpaint_noise(read_only image2d_t in, read_only image2d_t mask, write_only image2d_t out,
                     const int width, const int height, const float noise_level, const float threshold,
                     const dt_noise_distribution_t noise_distribution)
{
  const unsigned int x = get_global_id(0);
  const unsigned int y = get_global_id(1);

  if(x >= width || y >= height) return;

  // Init random number generator
  unsigned int state[4] = { splitmix32(x + 1), splitmix32((x + 1) * (y + 3)), splitmix32(1337), splitmix32(666) };
  xoshiro128plus(state);
  xoshiro128plus(state);
  xoshiro128plus(state);
  xoshiro128plus(state);

  // create noise
  const float4 i = read_imagef(in, sampleri, (int2)(x, y));
  const float4 sigma = i * noise_level / threshold;
  const float4 noise = dt_noise_generator_simd(noise_distribution, i, sigma, state);
  const float weight = (read_imagef(mask, sampleri, (int2)(x, y))).x;
  const float4 o = fmax(i * (1.0f - weight) + weight * noise, 0.f);
  write_imagef(out, (int2)(x, y), o);
}

kernel void init_reconstruct(read_only image2d_t in, read_only image2d_t mask, write_only image2d_t out,
                             const int width, const int height)
{
  // init the reconstructed buffer with non-clipped and partially clipped pixels
  // Note : it's a simple multiplied alpha blending where mask = alpha weight
  const int x = get_global_id(0);
  const int y = get_global_id(1);
  if(x >= width || y >= height) return;

  const float4 i = read_imagef(in, sampleri, (int2)(x, y));
  const float4 weight = 1.f - (read_imagef(mask, sampleri, (int2)(x, y))).x;
  float4 o = fmax(i * weight, 0.f);

  // copy masks and alpha
  o.w = i.w;
  write_imagef(out, (int2)(x, y), o);
}


// B spline filter
#define FSIZE 5
#define FSTART (FSIZE - 1) / 2

kernel void blur_2D_Bspline_vertical(read_only image2d_t in, write_only image2d_t out,
                                     const int width, const int height, const int mult)
{
  // À-trous B-spline interpolation/blur shifted by mult
  // Convolve B-spline filter over lines
  const int x = get_global_id(0);
  const int y = get_global_id(1);
  if(x >= width || y >= height) return;

  const float4 filter[FSIZE] = { (float4)1.0f / 16.0f,
                                 (float4)4.0f / 16.0f,
                                 (float4)6.0f / 16.0f,
                                 (float4)4.0f / 16.0f,
                                 (float4)1.0f / 16.0f };

  float4 accumulator = (float4)0.f;
  for(int jj = 0; jj < FSIZE; ++jj)
  {
    const int yy = mult * (jj - FSTART) + y;
    accumulator += filter[jj] * read_imagef(in, sampleri, (int2)(x, clamp(yy, 0, height - 1)));
  }

  write_imagef(out, (int2)(x, y), fmax(accumulator, 0.f));
}

kernel void blur_2D_Bspline_horizontal(read_only image2d_t in, write_only image2d_t out,
                                       const int width, const int height, const int mult)
{
  // À-trous B-spline interpolation/blur shifted by mult
  // Convolve B-spline filter over columns
  const int x = get_global_id(0);
  const int y = get_global_id(1);
  if(x >= width || y >= height) return;

  const float4 filter[FSIZE] = { (float4)1.0f / 16.0f,
                                 (float4)4.0f / 16.0f,
                                 (float4)6.0f / 16.0f,
                                 (float4)4.0f / 16.0f,
                                 (float4)1.0f / 16.0f };

  float4 accumulator = (float4)0.f;
  for(int ii = 0; ii < FSIZE; ++ii)
  {
    const int xx = mult * (ii - FSTART) + x;
    accumulator += filter[ii] * read_imagef(in, sampleri, (int2)(clamp(xx, 0, width - 1), y));
  }

  write_imagef(out, (int2)(x, y), fmax(accumulator, 0.f));
}

static inline float fmaxabsf(const float a, const float b)
{
  // Find the max in absolute value and return it with its sign
  return (fabs(a) > fabs(b) && !isnan(a)) ? a :
                                          (isnan(b)) ? 0.f : b;
}

static inline float fminabsf(const float a, const float b)
{
  // Find the min in absolute value and return it with its sign
  return (fabs(a) < fabs(b) && !isnan(a)) ? a :
                                          (isnan(b)) ? 0.f : b;
}

kernel void wavelets_detail_level(read_only image2d_t detail, read_only image2d_t LF,
                                      write_only image2d_t HF, write_only image2d_t texture,
                                      const int width, const int height, dt_iop_filmicrgb_reconstruction_type_t variant)
{
  /*
  * we pack the ratios and RGB methods in the same kernels since they differ by 1 line
  * and avoiding kernels proliferation is a good thing since each kernel creates overhead
  * when initialized
  */
  const int x = get_global_id(0);
  const int y = get_global_id(1);
  if(x >= width || y >= height) return;

  const float4 d = read_imagef(detail, sampleri, (int2)(x, y));
  const float4 lf = read_imagef(LF, sampleri, (int2)(x, y));
  const float4 hf = d - lf;

  write_imagef(HF, (int2)(x, y), hf);
  write_imagef(texture, (int2)(x, y), hf);
}

kernel void wavelets_reconstruct(read_only image2d_t HF, read_only image2d_t LF, read_only image2d_t texture,
                                 read_only image2d_t mask,
                                 read_only image2d_t reconstructed_read, write_only image2d_t reconstructed_write,
                                 const int width, const int height,
                                 const float gamma, const float gamma_comp, const float beta, const float beta_comp, const float delta,
                                 const int s, const int scales, const dt_iop_filmicrgb_reconstruction_type_t variant)
{
  /*
  * we pack the ratios and RGB methods in the same kernels since they differ by 2 lines
  * and avoiding kernels proliferation is a good thing since each kernel creates overhead
  * when initialized
  */
  const int x = get_global_id(0);
  const int y = get_global_id(1);
  if(x >= width || y >= height) return;

  const float alpha = read_imagef(mask, sampleri, (int2)(x, y)).x;
  const float4 HF_c = read_imagef(HF, sampleri, (int2)(x, y));
  const float4 LF_c = read_imagef(LF, sampleri, (int2)(x, y));
  const float4 TT_c = read_imagef(texture, sampleri, (int2)(x, y));

  float4 details;
  float4 residual;

  switch(variant)
  {
    case(DT_FILMIC_RECONSTRUCT_RGB):
    {
      const float grey_texture = fmaxabsf(fmaxabsf(TT_c.x, TT_c.y), TT_c.z);
      const float grey_details = (HF_c.x + HF_c.y + HF_c.z) / 3.f;
      const float grey_HF = beta_comp * (gamma_comp * grey_details + gamma * grey_texture);
      const float grey_residual = beta_comp * (LF_c.x + LF_c.y + LF_c.z) / 3.f;

      details = (gamma_comp * HF_c + gamma * TT_c) * beta + grey_HF;
      residual = (s == scales - 1) ? grey_residual + LF_c * beta : (float4)0.f;
      break;
    }
    case(DT_FILMIC_RECONSTRUCT_RATIOS):
    {
      const float grey_texture = fmaxabsf(fmaxabsf(TT_c.x, TT_c.y), TT_c.z);
      const float grey_details = (HF_c.x + HF_c.y + HF_c.z) / 3.f;
      const float grey_HF = (gamma_comp * grey_details + gamma * grey_texture);

      details = 0.5f * ((gamma_comp * HF_c + gamma * TT_c) + grey_HF);
      residual = (s == scales - 1) ? LF_c : (float4)0.f;
      break;
    }
  }

  const float4 i = read_imagef(reconstructed_read, sampleri, (int2)(x, y));
  const float4 o = i + alpha * (delta * details + residual);
  write_imagef(reconstructed_write, (int2)(x, y), o);
}


kernel void compute_ratios(read_only image2d_t in, write_only image2d_t norms,
                           write_only image2d_t ratios,
                           const dt_iop_filmicrgb_methods_type_t variant,
                           const int width, const int height)
{
  const int x = get_global_id(0);
  const int y = get_global_id(1);
  if(x >= width || y >= height) return;

  const float4 i = read_imagef(in, sampleri, (int2)(x, y));
  const float norm = fmax(pixel_rgb_norm_euclidean(i), NORM_MIN);
  const float4 ratio = i / norm;
  write_imagef(norms, (int2)(x, y), norm);
  write_imagef(ratios, (int2)(x, y), ratio);
}


kernel void restore_ratios(read_only image2d_t ratios, read_only image2d_t norms,
                           write_only image2d_t out,
                           const int width, const int height)
{
  const int x = get_global_id(0);
  const int y = get_global_id(1);
  if(x >= width || y >= height) return;

  const float4 ratio = read_imagef(ratios, sampleri, (int2)(x, y));
  const float norm = read_imagef(norms, sampleri, (int2)(x, y)).x;
  const float4 o = clamp(ratio, 0.f, 1.f) * norm;
  write_imagef(out, (int2)(x, y), o);
}
