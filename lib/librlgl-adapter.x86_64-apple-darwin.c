/* Generated by :claw at 2024-11-19T13:36:31.596423Z */

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

typedef Matrix (*_rlGetMatrixViewOffsetStereo_t)(int);
typedef Matrix (*_rlGetMatrixModelview_t)();
typedef void (*_rlSetMatrixModelview_t)(Matrix);
typedef void (*_rlSetMatrixViewOffsetStereo_t)(Matrix,Matrix);
typedef void (*_rlSetMatrixProjection_t)(Matrix);
typedef void (*_rlSetUniformMatrix_t)(int,Matrix);
typedef void (*_rlSetMatrixProjectionStereo_t)(Matrix,Matrix);
typedef rlRenderBatch (*_rlLoadRenderBatch_t)(int,int);
typedef Matrix (*_rlGetMatrixTransform_t)();
typedef Matrix (*_rlGetMatrixProjection_t)();
typedef void (*_rlUnloadRenderBatch_t)(rlRenderBatch);
typedef Matrix (*_rlGetMatrixProjectionStereo_t)(int);

static _rlGetMatrixViewOffsetStereo_t __v_claw__rlGetMatrixViewOffsetStereo;
static _rlGetMatrixModelview_t __v_claw__rlGetMatrixModelview;
static _rlSetMatrixModelview_t __v_claw__rlSetMatrixModelview;
static _rlSetMatrixViewOffsetStereo_t __v_claw__rlSetMatrixViewOffsetStereo;
static _rlSetMatrixProjection_t __v_claw__rlSetMatrixProjection;
static _rlSetUniformMatrix_t __v_claw__rlSetUniformMatrix;
static _rlSetMatrixProjectionStereo_t __v_claw__rlSetMatrixProjectionStereo;
static _rlLoadRenderBatch_t __v_claw__rlLoadRenderBatch;
static _rlGetMatrixTransform_t __v_claw__rlGetMatrixTransform;
static _rlGetMatrixProjection_t __v_claw__rlGetMatrixProjection;
static _rlUnloadRenderBatch_t __v_claw__rlUnloadRenderBatch;
static _rlGetMatrixProjectionStereo_t __v_claw__rlGetMatrixProjectionStereo;

__CLAW_API int __claw_rlgl_loader_902CC49AE25A3145BB68EA4CEC0D8B023FFA53AA() {
  if(___claw_init_wrapper()) {

__v_claw__rlGetMatrixViewOffsetStereo = (_rlGetMatrixViewOffsetStereo_t) claw_get_proc_addr("_rlGetMatrixViewOffsetStereo");
__v_claw__rlGetMatrixModelview = (_rlGetMatrixModelview_t) claw_get_proc_addr("_rlGetMatrixModelview");
__v_claw__rlSetMatrixModelview = (_rlSetMatrixModelview_t) claw_get_proc_addr("_rlSetMatrixModelview");
__v_claw__rlSetMatrixViewOffsetStereo = (_rlSetMatrixViewOffsetStereo_t) claw_get_proc_addr("_rlSetMatrixViewOffsetStereo");
__v_claw__rlSetMatrixProjection = (_rlSetMatrixProjection_t) claw_get_proc_addr("_rlSetMatrixProjection");
__v_claw__rlSetUniformMatrix = (_rlSetUniformMatrix_t) claw_get_proc_addr("_rlSetUniformMatrix");
__v_claw__rlSetMatrixProjectionStereo = (_rlSetMatrixProjectionStereo_t) claw_get_proc_addr("_rlSetMatrixProjectionStereo");
__v_claw__rlLoadRenderBatch = (_rlLoadRenderBatch_t) claw_get_proc_addr("_rlLoadRenderBatch");
__v_claw__rlGetMatrixTransform = (_rlGetMatrixTransform_t) claw_get_proc_addr("_rlGetMatrixTransform");
__v_claw__rlGetMatrixProjection = (_rlGetMatrixProjection_t) claw_get_proc_addr("_rlGetMatrixProjection");
__v_claw__rlUnloadRenderBatch = (_rlUnloadRenderBatch_t) claw_get_proc_addr("_rlUnloadRenderBatch");
__v_claw__rlGetMatrixProjectionStereo = (_rlGetMatrixProjectionStereo_t) claw_get_proc_addr("_rlGetMatrixProjectionStereo");

    ___claw_close_wrapper();
    return 0;
  }
  return 1;
}


__CLAW_API Matrix* __claw__rlGetMatrixViewOffsetStereo(Matrix* __claw_result_, int eye) {
// /usr/include/rlgl.h:801:14
(*__claw_result_) = rlGetMatrixViewOffsetStereo(eye);
return __claw_result_;
}

__CLAW_API Matrix* __claw__rlGetMatrixModelview(Matrix* __claw_result_) {
// /usr/include/rlgl.h:797:14
(*__claw_result_) = rlGetMatrixModelview();
return __claw_result_;
}

__CLAW_API void __claw__rlSetMatrixModelview(Matrix* view) {
// /usr/include/rlgl.h:803:12
rlSetMatrixModelview(*view);
}

__CLAW_API void __claw__rlSetMatrixViewOffsetStereo(Matrix* right, Matrix* left) {
// /usr/include/rlgl.h:805:12
rlSetMatrixViewOffsetStereo(*right, *left);
}

__CLAW_API void __claw__rlSetMatrixProjection(Matrix* proj) {
// /usr/include/rlgl.h:802:12
rlSetMatrixProjection(*proj);
}

__CLAW_API void __claw__rlSetUniformMatrix(int locIndex, Matrix* mat) {
// /usr/include/rlgl.h:775:12
rlSetUniformMatrix(locIndex, *mat);
}

__CLAW_API void __claw__rlSetMatrixProjectionStereo(Matrix* right, Matrix* left) {
// /usr/include/rlgl.h:804:12
rlSetMatrixProjectionStereo(*right, *left);
}

__CLAW_API rlRenderBatch* __claw__rlLoadRenderBatch(rlRenderBatch* __claw_result_, int numBuffers, int bufferElements) {
// /usr/include/rlgl.h:722:21
(*__claw_result_) = rlLoadRenderBatch(numBuffers, bufferElements);
return __claw_result_;
}

__CLAW_API Matrix* __claw__rlGetMatrixTransform(Matrix* __claw_result_) {
// /usr/include/rlgl.h:799:14
(*__claw_result_) = rlGetMatrixTransform();
return __claw_result_;
}

__CLAW_API Matrix* __claw__rlGetMatrixProjection(Matrix* __claw_result_) {
// /usr/include/rlgl.h:798:14
(*__claw_result_) = rlGetMatrixProjection();
return __claw_result_;
}

__CLAW_API void __claw__rlUnloadRenderBatch(rlRenderBatch* batch) {
// /usr/include/rlgl.h:723:12
rlUnloadRenderBatch(*batch);
}

__CLAW_API Matrix* __claw__rlGetMatrixProjectionStereo(Matrix* __claw_result_, int eye) {
// /usr/include/rlgl.h:800:14
(*__claw_result_) = rlGetMatrixProjectionStereo(eye);
return __claw_result_;
}

#if defined(__cplusplus)
}
#endif
