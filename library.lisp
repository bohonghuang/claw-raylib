(defpackage claw-raylib.library
  (:use #:cl #:alexandria))

(in-package #:claw-raylib.library)

(pushnew
 (namestring
  #.(merge-pathnames #P"lib/" (asdf:component-pathname (asdf:find-system '#:claw-raylib))))
 cffi:*foreign-library-directories* :test #'string=)

(cffi:define-foreign-library libraylib
  (:unix "libraylib.so")
  (t (:default "libraylib")))

(cffi:use-foreign-library libraylib)

(cffi:define-foreign-library libraylib-adapter
  (:unix "libraylib-adapter.so")
  (t (:default "libraylib-adapter")))

(cffi:use-foreign-library libraylib-adapter)

(push :raylib *features*)

(cffi:define-foreign-library librlgl-adapter
  (:unix "librlgl-adapter.so")
  (t (:default "librlgl-adapter")))

(cffi:use-foreign-library librlgl-adapter)

(push :rlgl *features*)

(cffi:define-foreign-library libraygui
  (:unix "libraygui.so")
  (t (:default "libraygui")))

(cffi:define-foreign-library libraygui-adapter
  (:unix "libraygui-adapter.so")
  (t (:default "libraygui-adapter")))

(handler-case
    (progn
      (cffi:use-foreign-library libraygui)
      (cffi:use-foreign-library libraygui-adapter)
      (push :raygui *features*))
  (cffi:load-foreign-library-error ()
    (when-let ((package (find-package '#:raygui)))
      (delete-package package))))
