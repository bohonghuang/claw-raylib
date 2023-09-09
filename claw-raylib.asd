(defsystem claw-raylib
  :version "1.0.0"
  :author "Bohong Huang <1281299809@qq.com>"
  :maintainer "Bohong Huang <1281299809@qq.com>"
  :license "mit"
  :homepage "https://github.com/bohonghuang/claw-raylib"
  :bug-tracker "https://github.com/bohonghuang/claw-raylib/issues"
  :source-control (:git "https://github.com/bohonghuang/claw-raylib.git")
  :pathname "./"
  :depends-on (#:alexandria #:cffi #:cffi-ops #:cffi-object #:cffi-object.ops
                            #:claw-raylib.defcfun
                            #:claw-raylib.raylib
                            #:claw-raylib.raygui
                            #:claw-raylib.rlgl)
  :components ((:file "package")
               (:file "object" :depends-on ("package"))
               (:file "macros" :depends-on ("package"))
               (:file "unintern" :depends-on ("package"))
               (:file "constants" :depends-on ("package" "unintern"))
               (:file "library" :depends-on ("package"))))

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
                             (:file "world-screen")))))
