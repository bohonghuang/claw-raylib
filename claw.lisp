(claw:defwrapper
    (:raylib
     (:headers "raylib.h" "raymath.h" "rcamera.h")
     (:targets ((:and :x86-64 :linux) "x86_64-pc-linux-gnu")
               ((:and :x86 :linux) "i686-pc-linux-gnu")
               ((:and :arm64 :linux) "aarch64-linux-gnu")
               ((:and :x86-64 :windows) "x86_64-pc-windows-gnu")
               ((:and :x86 :windows) "i686-pc-windows-gnu")
               ((:and :x86-64 :darwin) "x86_64-apple-darwin")
               ((:and :x86 :darwin) "i686-apple-darwin")
               ((:and :arm64 :darwin) "aarch64-apple-darwin"))
     (:persistent #:claw-raylib.raylib
      :asd-path #.(merge-pathnames "claw-raylib.raylib.asd"
                                   (asdf:component-pathname (asdf:find-system '#:claw-raylib)))
      :bindings-path #.(merge-pathnames "raylib/" (asdf:component-pathname (asdf:find-system '#:claw-raylib))))
     (:include-definitions ".*")
     (:exclude-definitions "gamma" "gammaf" "gammal"
                           "lgamma" "lgammaf" "lgammal"
                           "lgamma_r" "lgammaf_r" "lgammal_r"
                           "drem" "dremf" "dreml"
                           "y0" "y0f" "y0l"
                           "y1" "y1f" "y1l"
                           "yn" "ynf" "ynl"
                           "j0" "j0f" "j0l"
                           "j1" "j1f" "j1l"
                           "jn" "jnf" "jnl"
                           "scalb" "scalbf" "scalbl"
                           "significand" "significandf" "significandl"
                           "finite" "finitef" "finitel"
                           "isinf" "isinff" "isinfl"
                           "isnan" "isnanf" "isnanl"
                           "_t$" "^__(?!claw)"
                           ;; See https://gitlab.com/embeddable-common-lisp/ecl/-/issues/753
                           "^frexp$" "^frexpf$" "^modf$" "^modff$" "^nan$" "^nanf$" "^remquo$" "^remquof$"))
  :in-package :raylib
  :trim-enum-prefix t
  :recognize-bitfields t
  :recognize-strings t
  :recognize-arrays t
  :with-adapter (:dynamic :path #.(merge-pathnames "lib/libraylib-adapter.c" (asdf:component-pathname (asdf:find-system '#:claw-raylib))))
  :symbolicate-names (:in-pipeline
                      (:by-replacing "(Vector[2-4])([A-Z])" "\\1-\\2")
                      (:by-replacing "([a-z])([2-4]D)$" "\\1-\\2")
                      (:by-replacing "ImageFormat" "IMAGE-REFORMAT")
                      (:by-replacing "ImageMipmaps" "IMAGE-COMPUTE-MIPMAPS")))

(claw:defwrapper
    (:rlgl
     (:headers "rlgl.h")
     (:targets ((:and :x86-64 :linux) "x86_64-pc-linux-gnu")
               ((:and :x86 :linux) "i686-pc-linux-gnu")
               ((:and :arm64 :linux) "aarch64-linux-gnu")
               ((:and :x86-64 :windows) "x86_64-pc-windows-gnu")
               ((:and :x86 :windows) "i686-pc-windows-gnu")
               ((:and :x86-64 :darwin) "x86_64-apple-darwin")
               ((:and :x86 :darwin) "i686-apple-darwin")
               ((:and :arm64 :darwin) "aarch64-apple-darwin"))
     (:persistent #:claw-raylib.rlgl
      :asd-path #.(merge-pathnames "claw-raylib.rlgl.asd"
                                   (asdf:component-pathname (asdf:find-system '#:claw-raylib)))
      :bindings-path #.(merge-pathnames "rlgl/" (asdf:component-pathname (asdf:find-system '#:claw-raylib))))
     (:include-definitions ".*")
     (:exclude-definitions "_t$" "^__(?!claw)"))
  :in-package :rlgl
  :trim-enum-prefix t
  :recognize-bitfields t
  :recognize-strings t
  :recognize-arrays t
  :with-adapter (:dynamic :path #.(merge-pathnames "lib/librlgl-adapter.c" (asdf:component-pathname (asdf:find-system '#:claw-raylib))))
  :symbolicate-names (:in-pipeline (:by-removing-prefixes "rl" "RL_")))

(claw:defwrapper
    (:raygui
     (:headers "raygui.h")
     (:defines "RAYGUI_IMPLEMENTATION" 1)
     (:targets ((:and :x86-64 :linux) "x86_64-pc-linux-gnu")
               ((:and :x86 :linux) "i686-pc-linux-gnu")
               ((:and :arm64 :linux) "aarch64-linux-gnu")
               ((:and :x86-64 :windows) "x86_64-pc-windows-gnu")
               ((:and :x86 :windows) "i686-pc-windows-gnu")
               ((:and :x86-64 :darwin) "x86_64-apple-darwin")
               ((:and :x86 :darwin) "i686-apple-darwin")
               ((:and :arm64 :darwin) "aarch64-apple-darwin"))
     (:persistent #:claw-raylib.raygui
      :asd-path #.(merge-pathnames "claw-raylib.raygui.asd"
                                   (asdf:component-pathname (asdf:find-system '#:claw-raylib)))
      :bindings-path #.(merge-pathnames "raygui/" (asdf:component-pathname (asdf:find-system '#:claw-raylib))))
     (:include-definitions "^Gui.*")
     (:exclude-definitions "_t$" "^__(?!claw)"))
  :in-package :raygui
  :trim-enum-prefix t
  :recognize-bitfields t
  :recognize-strings t
  :recognize-arrays t
  :with-adapter (:dynamic :path #.(merge-pathnames "lib/libraygui-adapter.c" (asdf:component-pathname (asdf:find-system '#:claw-raylib))))
  :symbolicate-names (:in-pipeline (:by-removing-prefixes "Gui")))

;; Delete the generated adapters and run:
;;
;; (ql:quickload :claw-raylib/gen)
;; (pushnew :claw-regen-adapter *features*)
;; (cffi:load-foreign-library #P"/path/to/libresect.so")
;; (claw:load-wrapper :raylib)
;; (claw:load-wrapper :raygui)
;; (claw:load-wrapper :rlgl)
