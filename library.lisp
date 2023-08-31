(in-package #:claw-raylib)

(pushnew
 (namestring
  (merge-pathnames #P"lib/" (asdf:component-pathname (asdf:find-system '#:claw-raylib))))
 cffi:*foreign-library-directories* :test #'string=)

(cffi:define-foreign-library libraylib
  (:unix "libraylib.so")
  (t (:default "libraylib")))

(cffi:use-foreign-library libraylib)

(cffi:define-foreign-library libraygui
  (:unix "libraygui.so")
  (t (:default "libraygui")))

(cffi:use-foreign-library libraygui)

(cffi:define-foreign-library libraylib-adapter
  (:unix "libraylib-adapter.so")
  (t (:default "libraylib-adapter")))

(cffi:use-foreign-library libraylib-adapter)

(cffi:define-foreign-library libraygui-adapter
  (:unix "libraygui-adapter.so")
  (t (:default "libraygui-adapter")))

(cffi:use-foreign-library libraygui-adapter)

(cffi:define-foreign-library librlgl-adapter
  (:unix "librlgl-adapter.so")
  (t (:default "librlgl-adapter")))

(cffi:use-foreign-library librlgl-adapter)
