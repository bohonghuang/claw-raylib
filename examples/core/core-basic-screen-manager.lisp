;;; This file is derived from https://github.com/raysan5/raylib/blob/master/examples/core/core_basic_screen_manager.c
;;; originally provided under an unmodified zlib/libpng license:
;;;
;;;   raylib [core] examples - basic screen manager
;;;
;;;   Example complexity rating: [★☆☆☆] 1/4
;;;
;;;   NOTE: This example illustrates a very simple screen manager based on a states machines
;;;
;;;   Example originally created with raylib 4.0, last time updated with raylib 4.0
;;;
;;;   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
;;;   BSD-like license that allows static linking with closed source software
;;;
;;;   Copyright (c) 2021-2025 Ramon Santamaria (@raysan5)
;;;
;;; The code below is a Common Lisp translation of the original raylib example.

(in-package #:claw-raylib.examples) 

(defun basic-screen-manager ()
  (let ((screen-width 800)
        (screen-height 450)
	(frame-counter 0)
	(current-screen :LOGO))
    (raylib:with-window ("raylib [core] example - basic screen manager" (screen-width screen-height))
      (raylib:set-target-fps 60)
      (loop :until (raylib:window-should-close)
            :do (case current-screen
		  (:LOGO
		   (incf frame-counter)
		   (when (> frame-counter 120)
		     (setf current-screen :TITLE)))
		  (:TITLE
		   (when (or (raylib:is-key-pressed #.(foreign-enum-value 'raylib:keyboard-key :enter))
			     (raylib:is-gesture-detected #.(foreign-enum-value 'raylib:gesture :tap)))
		     (setf current-screen :GAMEPLAY)))
		  (:GAMEPLAY
		   (when (or (raylib:is-key-pressed #.(foreign-enum-value 'raylib:keyboard-key :enter))
			     (raylib:is-gesture-detected #.(foreign-enum-value 'raylib:gesture :tap)))
		     (setf current-screen :ENDING)))
		  (:ENDING
		   (when (or (raylib:is-key-pressed #.(foreign-enum-value 'raylib:keyboard-key :enter))
			     (raylib:is-gesture-detected #.(foreign-enum-value 'raylib:gesture :tap)))
		     (setf current-screen :TITLE))))

		(raylib:with-drawing
		  (raylib:clear-background raylib:+raywhite+)
		  (case current-screen
		    (:LOGO
		     (raylib:draw-text "LOGO SCREEN" 20 20 40 raylib:+lightgray+)
		     (raylib:draw-text "WAIT for 2 seconds" 290 220 20 raylib:+gray+))
		    (:TITLE
		     (raylib:draw-rectangle 0 0 screen-width screen-height raylib:+green+)
		     (raylib:draw-text "TITLE SCREEN" 20 40 40 raylib:+darkgreen+)
		     (raylib:draw-text "PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN"
				       120 220 20 raylib:+darkgreen+ ))
		    (:GAMEPLAY
		     (raylib:draw-rectangle 0 0 screen-width screen-height raylib:+purple+)
		     (raylib:draw-text "GAMEPLAY SCREEN" 20 20 40 raylib:+maroon+)
		     (raylib:draw-text "PRESS ENTER or TAP to JUMP to ENDING SCREEN"
				       130 220 20 raylib:+maroon+))
		    (:ENDING
		     (raylib:draw-rectangle 0 0 screen-width screen-height raylib:+blue+)
		     (raylib:draw-text "ENDING SCREEN" 20 20 40 raylib:+darkblue+)
		     (raylib:draw-text "PRESS ENTER or TAP to RETURN to TITLE SCREEN"
				       120 220 20 raylib:+darkblue+))))))))
