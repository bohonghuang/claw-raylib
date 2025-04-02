;;; This file is derived from https://github.com/raysan5/raylib/blob/master/examples/core/core_input_mouse.c
;;; originally provided under an unmodified zlib/libpng license:
;;;
;;;   raylib [core] example - Mouse input
;;;
;;;   Example complexity rating: [★☆☆☆] 1/4
;;;
;;;   Example originally created with raylib 1.0, last time updated with raylib 5.5
;;;
;;;   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
;;;   BSD-like license that allows static linking with closed source software
;;;
;;;   Copyright (c) 2014-2025 Ramon Santamaria (@raysan5)
;;;
;;; The code below is a Common Lisp translation of the original raylib example.

(in-package #:claw-raylib.examples)

(defun mouse-input ()
  (let* ((screen-width 800)
	 (screen-height 450)
	 (ball-position (raylib:make-vector2 :x -100.0 :y -100.0))
	 (ball-color raylib:+darkblue+))
    (raylib:with-window ("raylib [core] example - mouse input" (screen-width screen-height))
      (raylib:set-target-fps 60)
      (loop :until (raylib:window-should-close)
            :do
	       (setf ball-position (raylib:get-mouse-position))
	       (cond
		 ((raylib:is-mouse-button-pressed #.(foreign-enum-value 'raylib:mouse-button :left))
		  (setf ball-color raylib:+maroon+))
		 ((raylib:is-mouse-button-pressed #.(foreign-enum-value 'raylib:mouse-button :middle))
		  (setf ball-color raylib:+lime+))
		 ((raylib:is-mouse-button-pressed #.(foreign-enum-value 'raylib:mouse-button :right))
		  (setf ball-color raylib:+darkblue+))
		 ((raylib:is-mouse-button-pressed #.(foreign-enum-value 'raylib:mouse-button :side))
		  (setf ball-color raylib:+purple+))
		 ((raylib:is-mouse-button-pressed #.(foreign-enum-value 'raylib:mouse-button :extra))
		  (setf ball-color raylib:+yellow+))
		 ((raylib:is-mouse-button-pressed #.(foreign-enum-value 'raylib:mouse-button :forward))
		  (setf ball-color raylib:+orange+))
		 ((raylib:is-mouse-button-pressed #.(foreign-enum-value 'raylib:mouse-button :back))
		  (setf ball-color raylib:+beige+)))
	       (raylib:with-drawing
                 (raylib:clear-background raylib:+raywhite+)
		 (raylib:draw-circle-v  ball-position 50.0 ball-color)
		 (raylib:draw-text "move the ball with mouse and click mouse button to change color" 10 10 20 raylib:+darkgray+))))))
