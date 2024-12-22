(defsystem claw-raylib.library
  :version "1.0.0"
  :author "Bohong Huang <1281299809@qq.com>"
  :maintainer "Bohong Huang <1281299809@qq.com>"
  :license "Apache-2.0"
  :homepage "https://github.com/bohonghuang/claw-raylib"
  :bug-tracker "https://github.com/bohonghuang/claw-raylib/issues"
  :source-control (:git "https://github.com/bohonghuang/claw-raylib.git")
  :depends-on (#:alexandria #:cffi #:claw-raylib.raylib #:claw-raylib.raygui #:claw-raylib.rlgl)
  :components ((:file "library")))
