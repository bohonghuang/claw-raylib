(defpackage claw-raylib
  (:use #:cl #:alexandria #:cffi))

(in-package #:claw-raylib)

(setf (macro-function 'cffi:defcfun) cobj::+defcfun+)

(cobj.ops:enable-cobject-ops)

(setf cobj:*define-global-cobject* 'global-vars:define-global-var)
