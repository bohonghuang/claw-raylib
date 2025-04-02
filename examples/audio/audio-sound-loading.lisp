;;; This file is derived from https://github.com/raysan5/raylib/blob/master/examples/audio/audio_sound_loading.c
;;; originally provided under an unmodified zlib/libpng license:
;;;
;;;   raylib [audio] example - Sound loading and playing
;;;
;;;   Example complexity rating: [★☆☆☆] 1/4
;;;
;;;   Example originally created with raylib 1.1, last time updated with raylib 3.5
;;;
;;;   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
;;;   BSD-like license that allows static linking with closed source software
;;;
;;;   Copyright (c) 2014-2025 Ramon Santamaria (@raysan5)
;;;
;;; The code below is a Common Lisp translation of the original raylib example.

(in-package #:claw-raylib.examples)

(defun audio-sound-loading ()
  (let ((screen-width 800)
        (screen-height 450)
	(res-path (uiop:native-namestring (asdf:system-relative-pathname 'claw-raylib  "examples/audio/resources/"))))
    (raylib:with-window ("raylib [audio] example - sound loading and playing" (screen-width screen-height))
      (raylib:set-target-fps 60)
      (raylib:with-audio-device
	(let ((fx-wav (raylib:load-sound (concatenate 'string res-path "sound.wav") ))
	      (fx-ogg (raylib:load-sound (concatenate 'string res-path "target.ogg"))))
	  (loop :until (raylib:window-should-close)
		:do (when (raylib:is-key-pressed #.(foreign-enum-value 'raylib:keyboard-key :space))
		      (raylib:play-sound fx-wav))
		    (when (raylib:is-key-pressed #.(foreign-enum-value 'raylib:keyboard-key :enter))
		      (raylib:play-sound fx-ogg))

		    (raylib:with-drawing
                      (raylib:clear-background raylib:+raywhite+)
		      (raylib:draw-text "Press SPACE to PLAY the WAV sound!" 200 180 20 raylib:+lightgray+)
		      (raylib:draw-text "Press ENTER to PLAY the OGG sound!" 200 220 20 raylib:+lightgray+)))
	  (raylib:unload-sound fx-wav)
	  (raylib:unload-sound fx-ogg))))))

