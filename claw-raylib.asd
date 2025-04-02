(defsystem claw-raylib
  :version "1.0.0"
  :author "Bohong Huang <bohonghuang@qq.com>"
  :maintainer "Bohong Huang <bohonghuang@qq.com>"
  :license "Apache-2.0"
  :homepage "https://github.com/bohonghuang/claw-raylib"
  :bug-tracker "https://github.com/bohonghuang/claw-raylib/issues"
  :source-control (:git "https://github.com/bohonghuang/claw-raylib.git")
  :depends-on (#:asdf #:alexandria #:global-vars
               #:cffi #:cffi-ops #:cffi-object #:cffi-object.ops
               #:claw-raylib.prelude
               #:claw-raylib.library)
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
                             (:file "world-screen")
			     (:file "core-basic-screen-manager")
			     (:file "core-input-gamepad")
			     (:file "core-input-keys")
			     (:file "core-input-mouse")
			     (:file "core-vr-simulator")))
	       (:module "audio"
		:components ((:file "audio-sound-loading")))
               (:module "raygui"
                :components ((:file "controls-test-suite")))))
