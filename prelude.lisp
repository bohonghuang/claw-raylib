(defpackage claw-raylib.prelude
  (:use #:cl #:alexandria))

(in-package #:claw-raylib.prelude)

(setf (macro-function 'cffi:defcfun) (macro-function 'cobj::defcobjfun))
