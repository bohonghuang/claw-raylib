;;; This file is derived from https://github.com/raysan5/raylib/blob/master/examples/core/core_input_gamepad.c
;;; originally provided under an unmodified zlib/libpng license:
;;;
;;;   raylib [core] example - Gamepad input
;;;
;;;   Example complexity rating: [★☆☆☆] 1/4
;;;
;;;   NOTE: This example requires a Gamepad connected to the system
;;;         raylib is configured to work with the following gamepads:
;;;                - Xbox 360 Controller (Xbox 360, Xbox One)
;;;                - PLAYSTATION(R)3 Controller
;;;         Check raylib.h for buttons configuration
;;;
;;;   Example originally created with raylib 1.1, last time updated with raylib 4.2
;;;
;;;   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
;;;   BSD-like license that allows static linking with closed source software
;;;
;;;   Copyright (c) 2013-2025 Ramon Santamaria (@raysan5)
;;;
;;; The code below is a Common Lisp translation of the original raylib example.

(in-package #:claw-raylib.examples)

(defun core-input-gamepad ()
  (let ((xbox-alias-1 "xbox")
	(xbox-alias-2 "x-box")
	(ps-alias "playstation")
	(screen-width 800)
        (screen-height 450)
	(left-stick-deadzone-x 0.1)
	(left-stick-deadzone-y 0.1)
	(right-stick-deadzone-x 0.1)
	(right-stick-deadzone-y 0.1)
	(left-trigger-deadzone -0.9)
	(right-trigger-deadzone -0.9)
	(gamepad 0))
    (raylib:with-window ("raylib [core] example - gamepad input" (screen-width screen-height))
      (raylib:set-target-fps 60)
      (raylib:set-config-flags #.(foreign-enum-value 'raylib:config-flags :msaa-4x-hint))
      (let ((tex-ps3-pad (raylib:load-texture
			  (uiop:native-namestring (asdf:system-relative-pathname 'claw-raylib "examples/core/resources/ps3.png"))))
	    (tex-xbox-pad (raylib:load-texture
			   (uiop:native-namestring (asdf:system-relative-pathname 'claw-raylib "examples/core/resources/xbox.png")))))
	(loop :until (raylib:window-should-close)
              :do (raylib:with-drawing
                      (raylib:clear-background raylib:+raywhite+)
		    (when (and (raylib:is-key-down #.(foreign-enum-value 'raylib:keyboard-key :left))
			       (> gamepad 0))
		      (decf gamepad))
		    (when (raylib:is-key-down #.(foreign-enum-value 'raylib:keyboard-key :right))
		      (incf gamepad))

		    (if (raylib:is-gamepad-available gamepad)
			(progn
			  (raylib:draw-text (format nil "GP~d: ~s" gamepad (raylib:get-gamepad-name gamepad)) 10 10 10 raylib:+black+)
			  (let ((left-stick-x (raylib:get-gamepad-axis-movement gamepad #.(foreign-enum-value 'raylib:gamepad-axis :left-x)))
				(left-stick-y (raylib:get-gamepad-axis-movement gamepad #.(foreign-enum-value 'raylib:gamepad-axis :left-y)))
				(right-stick-x (raylib:get-gamepad-axis-movement gamepad #.(foreign-enum-value 'raylib:gamepad-axis :right-x)))
				(right-stick-y (raylib:get-gamepad-axis-movement gamepad #.(foreign-enum-value 'raylib:gamepad-axis :right-y)))
				(left-trigger (raylib:get-gamepad-axis-movement gamepad #.(foreign-enum-value 'raylib:gamepad-axis :left-trigger)))
				(right-trigger (raylib:get-gamepad-axis-movement gamepad #.(foreign-enum-value 'raylib:gamepad-axis :right-trigger)))
				(left-gamepad-color raylib:+black+)
				(right-gamepad-color raylib:+black+))
			    (raylib:draw-texture tex-xbox-pad 0 0 raylib:+darkgray+)
			    (when (and (> left-stick-x (- left-stick-deadzone-x)) (< left-stick-x left-stick-deadzone-x))
			      (setf left-stick-x 0.0))
			    (when (and (> left-stick-y (- left-stick-deadzone-y)) (< left-stick-y left-stick-deadzone-y))
			      (setf left-stick-y 0.0))
			    (when (and (> right-stick-x (- right-stick-deadzone-x)) (< right-stick-x right-stick-deadzone-x))
			      (setf right-stick-x 0.0))
			    (when (and (> right-stick-y (- right-stick-deadzone-y)) (< right-stick-y right-stick-deadzone-y))
			      (setf right-stick-y 0.0))
			    (when (< left-trigger left-trigger-deadzone) (setf left-trigger -1.0))
			    (when (< right-trigger right-trigger-deadzone) (setf right-trigger -1.0))

			    (cond
			      ((or (> (raylib:text-find-index (raylib:text-to-lower (raylib:get-gamepad-name gamepad)) xbox-alias-1) -1)
			           (> (raylib:text-find-index (raylib:text-to-lower (raylib:get-gamepad-name gamepad)) xbox-alias-2) -1))
			       (raylib:draw-texture tex-xbox-pad 0 0 raylib:+darkgray+)

			       ;; ;; Draw buttons: xbox home
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :middle))
				 (raylib:draw-circle 394 89 19.0 raylib:+red+))
			      
			       ;;  Draw buttons: basic
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :middle-right))
				 (raylib:draw-circle 436 150 9.0 raylib:+red+))
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :middle-left))
				 (raylib:draw-circle 352 150 9.0 raylib:+red+))
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :right-face-left))
				 (raylib:draw-circle 501 151 15.0 raylib:+blue+))
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :right-face-down))
				 (raylib:draw-circle 536 187 15.0 raylib:+lime+))
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :right-face-right))
				 (raylib:draw-circle 572 151 15.0 raylib:+maroon+))
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :right-face-up))
				 (raylib:draw-circle 536 115 15.0 raylib:+gold+))

			       ;; Draw buttons: d-pad
			       (raylib:draw-rectangle 317 202 19 71 raylib:+black+)
			       (raylib:draw-rectangle 293 228 69 19 raylib:+black+)
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :left-face-up))
				 (raylib:draw-rectangle 317 202 19 26 raylib:+red+))
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :left-face-down))
				 (raylib:draw-rectangle 317 (+ 202 45) 19 26 raylib:+red+))
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :left-face-left))
				 (raylib:draw-rectangle 292 228 25 19 raylib:+red+))
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :left-face-right))
				 (raylib:draw-rectangle (+ 292 44) 228 26 19 raylib:+red+))

			       ;; Draw buttons: left-right back
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :left-trigger-1)) (raylib:draw-circle 259 61 20.0 raylib:+red+))
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :right-trigger-1)) (raylib:draw-circle 536 61 20.0 raylib:+red+))

			       ;; ;; Draw axis: left joystick
			      
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :left-thumb))
			         (setf left-gamepad-color raylib:+red+))
			       (raylib:draw-circle 259 152 39.0 raylib:+black+)
			       (raylib:draw-circle 259 152 34.0 raylib:+lightgray+)
			       (raylib:draw-circle (floor (+  259  (* left-stick-x 20)))
				       (floor (+ 152 (* left-stick-y 20))) 25.0 left-gamepad-color)
			      
			       ;; Draw axis: right joystick
			       (when (raylib:is-gamepad-button-down gamepad #.(foreign-enum-value 'raylib:gamepad-button :right-thumb))
			         (setf right-gamepad-color raylib:+red+))
			       (raylib:draw-circle 461 237 38.0 raylib:+black+)
			       (raylib:draw-circle 461 237 33.0 raylib:+lightgray+)
			       (raylib:draw-circle (floor (+ 461 (* right-stick-x 20)))
				       (floor (+ 237 (* right-stick-y 20))) 25.0 right-gamepad-color)

			       ;; Draw axis: left-right triggers
			       (raylib:draw-rectangle 170 30 15 70 raylib:+gray+)
			       (raylib:draw-rectangle 604 30 15 70 raylib:+gray+)
			       (raylib:draw-rectangle 170 30 15 (floor (* (/ (+ 1 left-trigger) 2) 70)) raylib:+red+)
			       (raylib:draw-rectangle 604 30 15 (floor (* (/ (+ 1 right-trigger) 2) 70)) raylib:+red+)
			       )
			      ((> (raylib:text-find-index (raylib:text-to-lower (raylib:get-gamepad-name gamepad)) ps-alias) -1)
			       (raylib:draw-texture tex-ps3-pad 0 0 raylib:+darkgray+)
			       ;; TODO
			       )
			      (t
			       (raylib:draw-rectangle-rounded (raylib:make-rectangle :x 175.0 :y 110.0 :width 460.0 :height 220.0) 0.3 16 raylib:+darkgray+)
			       ;; TODO
			       ))
			    
			    (raylib:draw-text (format nil "DETECTED AXIS (~d):" (raylib:get-gamepad-axis-count gamepad)) 10 50 10 raylib:+maroon+)
			    (dotimes (i (raylib:get-gamepad-axis-count 0))
				 (raylib:draw-text (format nil "AXIS ~d: ~,2f" i (raylib:get-gamepad-axis-movement gamepad i)) 20 (+ 70 (* 20 i)) 10 raylib:+darkgray+))
			    
			    (if (not (equal (raylib:get-gamepad-button-pressed) #.(foreign-enum-value 'raylib:gamepad-button :unknown)))
				   (raylib:draw-text (format nil "DETECT BUTTON: ~a" (raylib:get-gamepad-button-pressed)) 10 430 10 raylib:+red+)
				   (raylib:draw-text "DETECTED BUTTON: NONE" 10 430 10 raylib:+gray+))
			    )))))
	(raylib:unload-texture tex-ps3-pad)
	(raylib:unload-texture tex-xbox-pad)))))
