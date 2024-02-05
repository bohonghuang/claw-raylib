(in-package #:claw-raylib)

(cobj:define-global-cobject raylib::+lightgray+ (raylib:make-color :r 200 :g 200 :b 200 :a 255))

(export 'raylib::+lightgray+ :raylib)

(cobj:define-global-cobject raylib::+gray+ (raylib:make-color :r 130 :g 130 :b 130 :a 255))

(export 'raylib::+gray+ :raylib)

(cobj:define-global-cobject raylib::+darkgray+ (raylib:make-color :r 80 :g 80 :b 80 :a 255))

(export 'raylib::+darkgray+ :raylib)

(cobj:define-global-cobject raylib::+yellow+ (raylib:make-color :r 253 :g 249 :b 0 :a 255))

(export 'raylib::+yellow+ :raylib)

(cobj:define-global-cobject raylib::+gold+ (raylib:make-color :r 255 :g 203 :b 0 :a 255))

(export 'raylib::+gold+ :raylib)

(cobj:define-global-cobject raylib::+orange+ (raylib:make-color :r 255 :g 161 :b 0 :a 255))

(export 'raylib::+orange+ :raylib)

(cobj:define-global-cobject raylib::+pink+ (raylib:make-color :r 255 :g 109 :b 194 :a 255))

(export 'raylib::+pink+ :raylib)

(cobj:define-global-cobject raylib::+red+ (raylib:make-color :r 230 :g 41 :b 55 :a 255))

(export 'raylib::+red+ :raylib)

(cobj:define-global-cobject raylib::+maroon+ (raylib:make-color :r 190 :g 33 :b 55 :a 255))

(export 'raylib::+maroon+ :raylib)

(cobj:define-global-cobject raylib::+green+ (raylib:make-color :r 0 :g 228 :b 48 :a 255))

(export 'raylib::+green+ :raylib)

(cobj:define-global-cobject raylib::+lime+ (raylib:make-color :r 0 :g 158 :b 47 :a 255))

(export 'raylib::+lime+ :raylib)

(cobj:define-global-cobject raylib::+darkgreen+ (raylib:make-color :r 0 :g 117 :b 44 :a 255))

(export 'raylib::+darkgreen+ :raylib)

(cobj:define-global-cobject raylib::+skyblue+ (raylib:make-color :r 102 :g 191 :b 255 :a 255))

(export 'raylib::+skyblue+ :raylib)

(cobj:define-global-cobject raylib::+blue+ (raylib:make-color :r 0 :g 121 :b 241 :a 255))

(export 'raylib::+blue+ :raylib)

(cobj:define-global-cobject raylib::+darkblue+ (raylib:make-color :r 0 :g 82 :b 172 :a 255))

(export 'raylib::+darkblue+ :raylib)

(cobj:define-global-cobject raylib::+purple+ (raylib:make-color :r 200 :g 122 :b 255 :a 255))

(export 'raylib::+purple+ :raylib)

(cobj:define-global-cobject raylib::+violet+ (raylib:make-color :r 135 :g 60 :b 190 :a 255))

(export 'raylib::+violet+ :raylib)

(cobj:define-global-cobject raylib::+darkpurple+ (raylib:make-color :r 112 :g 31 :b 126 :a 255))

(export 'raylib::+darkpurple+ :raylib)

(cobj:define-global-cobject raylib::+beige+ (raylib:make-color :r 211 :g 176 :b 131 :a 255))

(export 'raylib::+beige+ :raylib)

(cobj:define-global-cobject raylib::+brown+ (raylib:make-color :r 127 :g 106 :b 79 :a 255))

(export 'raylib::+brown+ :raylib)

(cobj:define-global-cobject raylib::+darkbrown+ (raylib:make-color :r 76 :g 63 :b 47 :a 255))

(export 'raylib::+darkbrown+ :raylib)

(cobj:define-global-cobject raylib::+white+ (raylib:make-color :r 255 :g 255 :b 255 :a 255))

(export 'raylib::+white+ :raylib)

(cobj:define-global-cobject raylib::+black+ (raylib:make-color :r 0 :g 0 :b 0 :a 255))

(export 'raylib::+black+ :raylib)

(cobj:define-global-cobject raylib::+blank+ (raylib:make-color :r 0 :g 0 :b 0 :a 0))

(export 'raylib::+blank+ :raylib)

(cobj:define-global-cobject raylib::+magenta+ (raylib:make-color :r 255 :g 0 :b 255 :a 255))

(export 'raylib::+magenta+ :raylib)

(cobj:define-global-cobject raylib::+raywhite+ (raylib:make-color :r 245 :g 245 :b 245 :a 255))

(export 'raylib::+raywhite+ :raylib)

(let ((symbols '(matrix-multiply %matrix-multiply)))
  (import symbols :raylib)
  (export symbols :raylib))
