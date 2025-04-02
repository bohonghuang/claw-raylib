;;; This file is derived from the ;;; This file is derived from https://github.com/raysan5/raylib/blob/master/examples/core/core_input_keys.c
;;; originally provided under an unmodified zlib/libpng license:
;;;
;;;   raylib [core] example - Keyboard input
;;;
;;;   Example complexity rating: [★☆☆☆] 1/4
;;;
;;;   Example originally created with raylib 1.0, last time updated with raylib 1.0
;;;
;;;   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
;;;   BSD-like license that allows static linking with closed source software
;;;
;;;   Copyright (c) 2014-2025 Ramon Santamaria (@raysan5)
;;;
;;; The code below is a Common Lisp translation of the original raylib example.

(in-package #:claw-raylib.examples)

(defun keyboard-input ()
  (let* ((screen-width 800)
	 (screen-height 450)
	 (ball-position (raylib:make-vector2 :x (float (/ screen-width 2)) :y  (float (/ screen-height 2)))))
    (raylib:with-window ("raylib [core] example - keyboard input" (screen-width screen-height))
      (raylib:set-target-fps 60)
      (loop :until (raylib:window-should-close)
            :do
	       (when (raylib:is-key-down #.(foreign-enum-value 'raylib:keyboard-key :right))
		 (incf (raylib:vector2-x ball-position) 2.0))
	       (when (raylib:is-key-down #.(foreign-enum-value 'raylib:keyboard-key :left))
		 (incf (raylib:vector2-x ball-position) (- 2.0)))
	       (when (raylib:is-key-down #.(foreign-enum-value 'raylib:keyboard-key :down))
		 (incf (raylib:vector2-y ball-position) 2.0))
	       (when (raylib:is-key-down #.(foreign-enum-value 'raylib:keyboard-key :up))
		 (incf (raylib:vector2-y ball-position) (- 2.0)))
	       (raylib:with-drawing
                 (raylib:clear-background raylib:+raywhite+)
		 (raylib:draw-text "move the ball with arrow keys" 10 10 20 raylib:+darkgray+)
		 (raylib:draw-circle-v  ball-position 50.0 raylib:+maroon+))))))
