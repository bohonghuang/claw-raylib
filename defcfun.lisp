(defpackage claw-raylib.defcfun
  (:use #:cl #:alexandria))

(in-package #:claw-raylib.defcfun)

(setf (macro-function 'cffi:defcfun) (macro-function 'cobj::defcobjfun))
