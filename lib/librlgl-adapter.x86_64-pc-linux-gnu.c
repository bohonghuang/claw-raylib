/* Generated by :claw at 2023-11-19T11:30:10.773282Z */

#include <stddef.h>
#if defined(__cplusplus)
#include <new>
#endif



#include "rlgl.h"


#if !defined(__CLAW_API)
#  if defined(_WIN32)
#    define __CLAW_API __declspec(dllexport)
#  elif defined(__GNUC__)
#    define __CLAW_API __attribute__((visibility("default")))
#  else
#    define __CLAW_API
#  endif
#endif

#ifdef _WIN32
#  include <windows.h>
static HMODULE ___claw_module;

static int ___claw_init_wrapper() {
  ___claw_module = GetModuleHandle(NULL);
  return ___claw_module != NULL;
}

static void ___claw_close_wrapper(void) {
}
#else
#  include <dlfcn.h>
static void* ___claw_module;

static int ___claw_init_wrapper() {
  ___claw_module = dlopen(NULL, RTLD_NOW | RTLD_GLOBAL);
  return ___claw_module != NULL;
}

static void ___claw_close_wrapper(void) {
}
#endif

static void* claw_get_proc_addr(const char *name) {
  if(___claw_module == NULL) {
    return NULL;
  }

#ifdef _WIN32
  return (void*) GetProcAddress(___claw_module, name);
#else
  return dlsym(___claw_module, name);
#endif
}

#if defined(__cplusplus)
extern "C" {
#endif

typedef rlRenderBatch (*rlLoadRenderBatch_t)(int,int);
typedef void (*rlUnloadRenderBatch_t)(rlRenderBatch);
typedef Matrix (*rlGetMatrixProjectionStereo_t)(int);
typedef Matrix (*rlGetMatrixViewOffsetStereo_t)(int);
typedef void (*rlSetMatrixProjectionStereo_t)(Matrix,Matrix);
typedef void (*rlSetUniformMatrix_t)(int,Matrix);
typedef Matrix (*cE3AE40FE40rlGetMatrixTransform_t)();
typedef Matrix (*cE3AE40FE40rlGetMatrixModelview_t)();
typedef void (*rlSetMatrixProjection_t)(Matrix);
typedef Matrix (*cE3AE40FE40rlGetMatrixProjection_t)();
typedef void (*rlSetMatrixModelview_t)(Matrix);
typedef void (*rlSetMatrixViewOffsetStereo_t)(Matrix,Matrix);

static rlLoadRenderBatch_t __v_claw_rlLoadRenderBatch;
static rlUnloadRenderBatch_t __v_claw_rlUnloadRenderBatch;
static rlGetMatrixProjectionStereo_t __v_claw_rlGetMatrixProjectionStereo;
static rlGetMatrixViewOffsetStereo_t __v_claw_rlGetMatrixViewOffsetStereo;
static rlSetMatrixProjectionStereo_t __v_claw_rlSetMatrixProjectionStereo;
static rlSetUniformMatrix_t __v_claw_rlSetUniformMatrix;
static cE3AE40FE40rlGetMatrixTransform_t __v_claw_cE3AE40FE40rlGetMatrixTransform;
static cE3AE40FE40rlGetMatrixModelview_t __v_claw_cE3AE40FE40rlGetMatrixModelview;
static rlSetMatrixProjection_t __v_claw_rlSetMatrixProjection;
static cE3AE40FE40rlGetMatrixProjection_t __v_claw_cE3AE40FE40rlGetMatrixProjection;
static rlSetMatrixModelview_t __v_claw_rlSetMatrixModelview;
static rlSetMatrixViewOffsetStereo_t __v_claw_rlSetMatrixViewOffsetStereo;

__CLAW_API int __claw_rlgl_loader_902CC49AE25A3145BB68EA4CEC0D8B023FFA53AA() {
  if(___claw_init_wrapper()) {

__v_claw_rlLoadRenderBatch = (rlLoadRenderBatch_t) claw_get_proc_addr("rlLoadRenderBatch");
__v_claw_rlUnloadRenderBatch = (rlUnloadRenderBatch_t) claw_get_proc_addr("rlUnloadRenderBatch");
__v_claw_rlGetMatrixProjectionStereo = (rlGetMatrixProjectionStereo_t) claw_get_proc_addr("rlGetMatrixProjectionStereo");
__v_claw_rlGetMatrixViewOffsetStereo = (rlGetMatrixViewOffsetStereo_t) claw_get_proc_addr("rlGetMatrixViewOffsetStereo");
__v_claw_rlSetMatrixProjectionStereo = (rlSetMatrixProjectionStereo_t) claw_get_proc_addr("rlSetMatrixProjectionStereo");
__v_claw_rlSetUniformMatrix = (rlSetUniformMatrix_t) claw_get_proc_addr("rlSetUniformMatrix");
__v_claw_cE3AE40FE40rlGetMatrixTransform = (cE3AE40FE40rlGetMatrixTransform_t) claw_get_proc_addr("cE3AE40FE40rlGetMatrixTransform");
__v_claw_cE3AE40FE40rlGetMatrixModelview = (cE3AE40FE40rlGetMatrixModelview_t) claw_get_proc_addr("cE3AE40FE40rlGetMatrixModelview");
__v_claw_rlSetMatrixProjection = (rlSetMatrixProjection_t) claw_get_proc_addr("rlSetMatrixProjection");
__v_claw_cE3AE40FE40rlGetMatrixProjection = (cE3AE40FE40rlGetMatrixProjection_t) claw_get_proc_addr("cE3AE40FE40rlGetMatrixProjection");
__v_claw_rlSetMatrixModelview = (rlSetMatrixModelview_t) claw_get_proc_addr("rlSetMatrixModelview");
__v_claw_rlSetMatrixViewOffsetStereo = (rlSetMatrixViewOffsetStereo_t) claw_get_proc_addr("rlSetMatrixViewOffsetStereo");

    ___claw_close_wrapper();
    return 0;
  }
  return 1;
}


__CLAW_API rlRenderBatch* __claw_rlLoadRenderBatch(rlRenderBatch* __claw_result_, int numBuffers, int bufferElements) {
// /usr/include/rlgl.h:674:21
(*__claw_result_) = rlLoadRenderBatch(numBuffers, bufferElements);
return __claw_result_;
}

__CLAW_API void __claw_rlUnloadRenderBatch(rlRenderBatch* batch) {
// /usr/include/rlgl.h:675:12
rlUnloadRenderBatch(*batch);
}

__CLAW_API Matrix* __claw_rlGetMatrixProjectionStereo(Matrix* __claw_result_, int eye) {
// /usr/include/rlgl.h:751:14
(*__claw_result_) = rlGetMatrixProjectionStereo(eye);
return __claw_result_;
}

__CLAW_API Matrix* __claw_rlGetMatrixViewOffsetStereo(Matrix* __claw_result_, int eye) {
// /usr/include/rlgl.h:752:14
(*__claw_result_) = rlGetMatrixViewOffsetStereo(eye);
return __claw_result_;
}

__CLAW_API void __claw_rlSetMatrixProjectionStereo(Matrix* right, Matrix* left) {
// /usr/include/rlgl.h:755:12
rlSetMatrixProjectionStereo(*right, *left);
}

__CLAW_API void __claw_rlSetUniformMatrix(int locIndex, Matrix* mat) {
// /usr/include/rlgl.h:727:12
rlSetUniformMatrix(locIndex, *mat);
}

__CLAW_API Matrix* __claw_cE3AE40FE40rlGetMatrixTransform(Matrix* __claw_result_) {
// /usr/include/rlgl.h:750:14
(*__claw_result_) = rlGetMatrixTransform();
return __claw_result_;
}

__CLAW_API Matrix* __claw_cE3AE40FE40rlGetMatrixModelview(Matrix* __claw_result_) {
// /usr/include/rlgl.h:748:14
(*__claw_result_) = rlGetMatrixModelview();
return __claw_result_;
}

__CLAW_API void __claw_rlSetMatrixProjection(Matrix* proj) {
// /usr/include/rlgl.h:753:12
rlSetMatrixProjection(*proj);
}

__CLAW_API Matrix* __claw_cE3AE40FE40rlGetMatrixProjection(Matrix* __claw_result_) {
// /usr/include/rlgl.h:749:14
(*__claw_result_) = rlGetMatrixProjection();
return __claw_result_;
}

__CLAW_API void __claw_rlSetMatrixModelview(Matrix* view) {
// /usr/include/rlgl.h:754:12
rlSetMatrixModelview(*view);
}

__CLAW_API void __claw_rlSetMatrixViewOffsetStereo(Matrix* right, Matrix* left) {
// /usr/include/rlgl.h:756:12
rlSetMatrixViewOffsetStereo(*right, *left);
}

#if defined(__cplusplus)
}
#endif
