/*
    This file is part of darktable,
    Copyright (C) 2010-2021 darktable developers.

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

/*
   Dual demosaicing has been implemented by Ingo Weyrich <heckflosse67@gmx.de> for
   rawtherapee under GNU General Public License Version 3
   and has been modified to work for darktable by Hanno Schwalm (hanno@schwalm-bremen.de).
   Also the code for dt_masks_blur_9x9 has been taken from rawtherapee capturesharpening,
   implemented also by Ingo Weyrich.
*/

static float slider2contrast(float slider)
{
  return 0.005f * powf(slider, 1.1f);
}
static void dual_demosaic(dt_dev_pixelpipe_iop_t *piece, float *const restrict rgb_data, const float *const restrict raw_data,
                          dt_iop_roi_t *const roi_out, const dt_iop_roi_t *const roi_in, const uint32_t filters, const uint8_t (*const xtrans)[6],
                          const gboolean dual_mask, float dual_threshold)
{
  const int width = roi_in->width;
  const int height = roi_in->height;
  if((width < 16) || (height < 16)) return;

  // If the threshold is zero and we don't want to see the blend mask we don't do anything
  if(dual_threshold <= 0.0f) return;

  float *blend = dt_alloc_align_float((size_t) width * height);
  float *tmp = dt_alloc_align_float((size_t) width * height);
  float *vng_image = dt_alloc_align_float((size_t) 4 * width * height);
  if(!blend || !tmp || !vng_image)
  {
    if(tmp) dt_free_align(tmp);
    if(blend) dt_free_align(blend);
    if(vng_image) dt_free_align(vng_image);
    dt_control_log(_("[dual demosaic] can't allocate internal buffers"));
    return;
  }
  const gboolean info = ((darktable.unmuted & (DT_DEBUG_DEMOSAIC | DT_DEBUG_PERF)) && (piece->pipe->type == DT_DEV_PIXELPIPE_FULL));

  vng_interpolate(vng_image, raw_data, roi_out, roi_in, filters, xtrans, FALSE);
  color_smoothing(vng_image, roi_out, 2);

  dt_times_t start_blend = { 0 }, end_blend = { 0 };
  if(info) dt_get_times(&start_blend);

  const float contrastf = slider2contrast(dual_threshold);

  dt_masks_calc_rawdetail_mask(rgb_data, blend, tmp, width, height, piece->pipe->dsc.temperature.coeffs);
  dt_masks_calc_detail_mask(blend, blend, tmp, width, height, contrastf, TRUE);

  if(dual_mask)
  {
    piece->pipe->mask_display = DT_DEV_PIXELPIPE_DISPLAY_PASSTHRU;
#ifdef _OPENMP
  #pragma omp parallel for simd default(none) \
  dt_omp_firstprivate(blend, rgb_data, vng_image, width, height) \
  schedule(simd:static) aligned(blend, vng_image, rgb_data : 64)
#endif
    for(int idx = 0; idx < width * height; idx++)
    {
      for(int c = 0; c < 4; c++)
        rgb_data[idx * 4 + c] = blend[idx];
    }
  }
  else
  {
#ifdef _OPENMP
  #pragma omp parallel for simd default(none) \
  dt_omp_firstprivate(blend, rgb_data, vng_image, width, height) \
  schedule(simd:static) aligned(blend, vng_image, rgb_data : 64)
#endif
    for(int idx = 0; idx < width * height; idx++)
    {
      const int oidx = 4 * idx;
      for(int c = 0; c < 4; c++)
        rgb_data[oidx + c] = intp(blend[idx], rgb_data[oidx + c], vng_image[oidx + c]);
    }
  }
  if(info)
  {
    dt_get_times(&end_blend);
    fprintf(stderr," [demosaic] CPU dual blending %.4f secs (%.4f CPU)\n", end_blend.clock - start_blend.clock, end_blend.user - start_blend.user);
  }
  dt_free_align(tmp);
  dt_free_align(blend);
  dt_free_align(vng_image);
}

#ifdef HAVE_OPENCL
gboolean dual_demosaic_cl(struct dt_iop_module_t *self, dt_dev_pixelpipe_iop_t *piece, cl_mem detail, cl_mem blend, cl_mem high_image, cl_mem low_image, cl_mem out, const int width, const int height, const int showmask)
{
  const int devid = piece->pipe->devid;
  dt_iop_demosaic_data_t *data = (dt_iop_demosaic_data_t *)piece->data;
  dt_iop_demosaic_global_data_t *gd = (dt_iop_demosaic_global_data_t *)self->global_data;

  const float contrastf = slider2contrast(data->dual_thrs);
  if(showmask)
    piece->pipe->mask_display = DT_DEV_PIXELPIPE_DISPLAY_PASSTHRU;

  {
    size_t sizes[3] = { ROUNDUPWD(width), ROUNDUPHT(height), 1 };
    const dt_aligned_pixel_t wb = { piece->pipe->dsc.temperature.coeffs[0], piece->pipe->dsc.temperature.coeffs[1],
                                    piece->pipe->dsc.temperature.coeffs[2] };
    const int kernel = darktable.opencl->blendop->kernel_calc_Y0_mask;
    dt_opencl_set_kernel_arg(devid, kernel, 0, sizeof(cl_mem), &detail);
    dt_opencl_set_kernel_arg(devid, kernel, 1, sizeof(cl_mem), &high_image);
    dt_opencl_set_kernel_arg(devid, kernel, 2, sizeof(int), &width);
    dt_opencl_set_kernel_arg(devid, kernel, 3, sizeof(int), &height);
    dt_opencl_set_kernel_arg(devid, kernel, 4, sizeof(float), &wb[0]);
    dt_opencl_set_kernel_arg(devid, kernel, 5, sizeof(float), &wb[1]);
    dt_opencl_set_kernel_arg(devid, kernel, 6, sizeof(float), &wb[2]);
    const int err = dt_opencl_enqueue_kernel_2d(devid, kernel, sizes);
    if(err != CL_SUCCESS) return FALSE;
  }

  {
    size_t sizes[3] = { ROUNDUPWD(width), ROUNDUPHT(height), 1 };
    const int kernel = darktable.opencl->blendop->kernel_calc_scharr_mask;
    dt_opencl_set_kernel_arg(devid, kernel, 0, sizeof(cl_mem), &detail);
    dt_opencl_set_kernel_arg(devid, kernel, 1, sizeof(cl_mem), &blend);
    dt_opencl_set_kernel_arg(devid, kernel, 2, sizeof(int), &width);
    dt_opencl_set_kernel_arg(devid, kernel, 3, sizeof(int), &height);
    const int err = dt_opencl_enqueue_kernel_2d(devid, kernel, sizes);
    if(err != CL_SUCCESS) return FALSE;
  }

  {
    const int flag = 1;
    size_t sizes[3] = { ROUNDUPWD(width), ROUNDUPHT(height), 1 };
    const int kernel = darktable.opencl->blendop->kernel_calc_blend;
    dt_opencl_set_kernel_arg(devid, kernel, 0, sizeof(cl_mem), &blend);
    dt_opencl_set_kernel_arg(devid, kernel, 1, sizeof(cl_mem), &detail);
    dt_opencl_set_kernel_arg(devid, kernel, 2, sizeof(int), &width);
    dt_opencl_set_kernel_arg(devid, kernel, 3, sizeof(int), &height);
    dt_opencl_set_kernel_arg(devid, kernel, 4, sizeof(float), &contrastf);
    dt_opencl_set_kernel_arg(devid, kernel, 5, sizeof(int), &flag);
    const int err = dt_opencl_enqueue_kernel_2d(devid, kernel, sizes);
    if(err != CL_SUCCESS) return FALSE;
  }

  {
    float blurmat[13];
    dt_masks_blur_9x9_coeff(blurmat, 2.0f);
    cl_mem dev_blurmat = NULL;
    dev_blurmat = dt_opencl_copy_host_to_device_constant(devid, sizeof(float) * 13, blurmat);
    if(dev_blurmat != NULL)
    {
      size_t sizes[3] = { ROUNDUPWD(width), ROUNDUPHT(height), 1 };
      const int clkernel = darktable.opencl->blendop->kernel_mask_blur;
      dt_opencl_set_kernel_arg(devid, clkernel, 0, sizeof(cl_mem), &detail);
      dt_opencl_set_kernel_arg(devid, clkernel, 1, sizeof(cl_mem), &blend);
      dt_opencl_set_kernel_arg(devid, clkernel, 2, sizeof(int), &width);
      dt_opencl_set_kernel_arg(devid, clkernel, 3, sizeof(int), &height);
      dt_opencl_set_kernel_arg(devid, clkernel, 4, sizeof(cl_mem), (void *) &dev_blurmat);
      const int err = dt_opencl_enqueue_kernel_2d(devid, clkernel, sizes);
      dt_opencl_release_mem_object(dev_blurmat);
      if(err != CL_SUCCESS) return FALSE;
    }
    else
    {
      dt_opencl_release_mem_object(dev_blurmat);
      return FALSE;
    }
  }

  {
    size_t sizes[3] = { ROUNDUPWD(width), ROUNDUPHT(height), 1 };
    dt_opencl_set_kernel_arg(devid, gd->kernel_write_blended_dual, 0, sizeof(cl_mem), &high_image);
    dt_opencl_set_kernel_arg(devid, gd->kernel_write_blended_dual, 1, sizeof(cl_mem), &low_image);
    dt_opencl_set_kernel_arg(devid, gd->kernel_write_blended_dual, 2, sizeof(cl_mem), &out);
    dt_opencl_set_kernel_arg(devid, gd->kernel_write_blended_dual, 3, sizeof(int), &width);
    dt_opencl_set_kernel_arg(devid, gd->kernel_write_blended_dual, 4, sizeof(int), &height);
    dt_opencl_set_kernel_arg(devid, gd->kernel_write_blended_dual, 5, sizeof(cl_mem), &blend);
    dt_opencl_set_kernel_arg(devid, gd->kernel_write_blended_dual, 6, sizeof(int), &showmask);
    const int err = dt_opencl_enqueue_kernel_2d(devid, gd->kernel_write_blended_dual, sizes);
    if(err != CL_SUCCESS) return FALSE;
  }

  return TRUE;
}
#endif

