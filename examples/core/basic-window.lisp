;;; This file is derived from https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_window.c
;;; originally provided under an unmodified zlib/libpng license:
;;;
;;;   raylib [core] example - Basic window
;;;
;;;   Example complexity rating: [★☆☆☆] 1/4
;;;
;;;   Welcome to raylib!
;;;
;;;   To test examples, just press F6 and execute 'raylib_compile_execute' script
;;;   Note that compiled executable is placed in the same folder as .c file
;;;
;;;   To test the examples on Web, press F6 and execute 'raylib_compile_execute_web' script
;;;   Web version of the program is generated in the same folder as .c file
;;;
;;;   You can find all basic examples on C:\raylib\raylib\examples folder or
;;;   raylib official webpage: www.raylib.com
;;;
;;;   Enjoy using raylib. :)
;;;
;;;   Example originally created with raylib 1.0, last time updated with raylib 1.0
;;;
;;;   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
;;;   BSD-like license that allows static linking with closed source software
;;;
;;;   Copyright (c) 2013-2025 Ramon Santamaria (@raysan5)
;;;
;;; The code below is a Common Lisp translation of the original raylib example.

(in-package #:claw-raylib.examples)

(defun basic-window ()
  (let ((screen-width 800)
        (screen-height 450))
    (raylib:with-window ("raylib [core] example - basic window" (screen-width screen-height))
      (raylib:set-target-fps 60)
      (loop :until (raylib:window-should-close)
            :do (raylib:with-drawing
                    (raylib:clear-background raylib:+raywhite+)
                  (raylib:draw-text "Congrats! You created your first window!" 190 200 20 raylib:+lightgray+))))))
