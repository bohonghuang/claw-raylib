(defpackage claw-raylib
  (:use #:cl #:alexandria #:cffi)
  (:export
   #:define-conversion-into-foreign-memory
   #:define-conversion-from-foreign))

(in-package #:claw-raylib)

(when (macro-function 'claw-raylib.defcfun::%defcfun)
  (setf (macro-function 'cffi:defcfun) (macro-function 'claw-raylib.defcfun::%defcfun))
  (fmakunbound 'claw-raylib.defcfun::%defcfun))

(cobj.ops:enable-cobject-ops)
