(defsystem claw-raylib
  :version "1.0.0"
  :author "Bohong Huang <1281299809@qq.com>"
  :maintainer "Bohong Huang <1281299809@qq.com>"
  :license "Apache-2.0"
  :homepage "https://github.com/bohonghuang/claw-raylib"
  :bug-tracker "https://github.com/bohonghuang/claw-raylib/issues"
  :source-control (:git "https://github.com/bohonghuang/claw-raylib.git")
  :depends-on (#:alexandria #:global-vars
               #:cffi #:cffi-ops #:cffi-object #:cffi-object.ops
               #:claw-raylib.defcfun
               #:claw-raylib.library
               #:claw-raylib.raylib
               #:claw-raylib.raygui
               #:claw-raylib.rlgl)
  :components ((:file "package")
               (:file "object" :depends-on ("package"))
               (:file "macros" :depends-on ("package"))
               (:file "unexport" :depends-on ("package"))
               (:file "reexport" :depends-on ("package" "unexport"))))

(defsystem claw-raylib/gen
  :depends-on (#:alexandria #:cffi #:claw)
  :pathname "./"
  :components ((:file "claw")))

(defsystem claw-raylib/examples
  :depends-on (#:alexandria #:claw-raylib #:cffi-ops #:cffi-object #:cffi-object.ops)
  :pathname "./examples/"
  :components ((:file "package")
               (:module "core"
                :components ((:file "2d-camera")
                             (:file "3d-camera-mode")
                             (:file "3d-picking")
                             (:file "basic-window")
                             (:file "world-screen")))
               (:module "raygui"
                :components ((:file "controls-test-suite")))))
