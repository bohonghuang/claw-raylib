;;; This file is derived from https://github.com/raysan5/raylib/blob/master/examples/core/core_vr_simulator.c
;;; originally provided under an unmodified zlib/libpng license:
;;;
;;;   raylib [core] example - VR Simulator (Oculus Rift CV1 parameters)
;;;
;;;   Example complexity rating: [★★★☆] 3/4
;;;
;;;   Example originally created with raylib 2.5, last time updated with raylib 4.0
;;;
;;;   Example licensed under an unmodified zlib/libpng license, which is an OSI-certified,
;;;   BSD-like license that allows static linking with closed source software
;;;
;;;   Copyright (c) 2017-2025 Ramon Santamaria (@raysan5)
;;;
;;; The code below is a Common Lisp translation of the original raylib example.

(in-package #:claw-raylib.examples)

(defun vr-simulator ()
  (let ((screen-width 800)
        (screen-height 450))
    (raylib:with-window ("raylib [core] example - vr simulator" (screen-width screen-height))
      (let* ((device (raylib:make-vr-device-info
		      :h-resolution 2160
		      :v-resolution 1200
		      :h-screen-size 0.133793
		      :v-screen-size 0.0669
		      :eye-to-screen-distance 0.041
		      :lens-separation-distance 0.07
		      :interpupillary-distance 0.07
		      :lens-distortion-values (cffi-object:make-carray 4 :element-type 'single-float :initial-contents '(1.0 0.22 0.24 0.0))
		      :chroma-ab-correction (cffi-object:make-carray 4 :element-type 'single-float :initial-contents '(0.996 -0.004 1.014 0.0))))
	     (config (raylib:load-vr-stereo-config device))
	     (distortion (raylib:load-shader (null-pointer) (uiop:native-namestring (asdf:system-relative-pathname 'claw-raylib "examples/core/resources/distortion330.fs")))))

	(raylib:set-shader-value distortion (raylib:get-shader-location distortion "leftLensCenter")
				 (raylib:vr-stereo-config-left-lens-center config) #.(foreign-enum-value 'raylib:shader-uniform-data-type :vec2))
	(raylib:set-shader-value distortion (raylib:get-shader-location distortion "rightLensCenter")
				 (raylib:vr-stereo-config-right-lens-center config) #.(foreign-enum-value 'raylib:shader-uniform-data-type :vec2))
	(raylib:set-shader-value distortion (raylib:get-shader-location distortion "leftScreenCenter")
				 (raylib:vr-stereo-config-left-screen-center config) #.(foreign-enum-value 'raylib:shader-uniform-data-type :vec2))
	(raylib:set-shader-value distortion (raylib:get-shader-location distortion "rightScreenCenter")
				 (raylib:vr-stereo-config-right-screen-center config) #.(foreign-enum-value 'raylib:shader-uniform-data-type :vec2))

	(raylib:set-shader-value distortion (raylib:get-shader-location distortion "scale")
				 (raylib:vr-stereo-config-scale config) #.(foreign-enum-value 'raylib:shader-uniform-data-type :vec2))
	(raylib:set-shader-value distortion (raylib:get-shader-location distortion "scaleIn")
				 (raylib:vr-stereo-config-scale-in config) #.(foreign-enum-value 'raylib:shader-uniform-data-type :vec2))
	(raylib:set-shader-value distortion (raylib:get-shader-location distortion "deviceWarpParam")
				 (raylib:vr-device-info-lens-distortion-values device) #.(foreign-enum-value 'raylib:shader-uniform-data-type :vec4))
	(raylib:set-shader-value distortion (raylib:get-shader-location distortion "chromaAbParam")
				 (raylib:vr-device-info-chroma-ab-correction device) #.(foreign-enum-value 'raylib:shader-uniform-data-type :vec4))

	(let* ((target (raylib:load-render-texture (raylib:vr-device-info-h-resolution device)
						   (raylib:vr-device-info-v-resolution device)))
	       (source-rec (raylib:make-rectangle :x 0.0
						  :y 0.0
						  :width (float (raylib:texture-width (raylib:render-texture-texture target)))
						  :height (- (float (raylib:texture-height (raylib:render-texture-texture target))))))
	       (dest-rec (raylib:make-rectangle :x 0.0
						:y 0.0
						:width (float (raylib:get-screen-width))
						:height (float (raylib:get-screen-height))))
	       (camera (raylib:make-camera :position (raylib:make-vector3 :x 5.0 :y 2.0 :z 5.0)
					   :target (raylib:make-vector3 :x 0.0 :y 2.0 :z 0.0)
					   :up (raylib:make-vector3 :x 0.0 :y 1.0 :z 0.0)
					   :fovy 60.0
					   :projection #.(foreign-enum-value 'raylib:camera-projection :perspective)))
	       (cube-position (raylib:make-vector3 :x 0.0 :y 0.0 :z 0.0)))
	  
	  (raylib:set-target-fps 60)
	  (loop :until (raylib:window-should-close)
		:do
		   (raylib:update-camera camera #.(foreign-enum-value 'raylib:camera-mode :first-person))
		   (raylib:with-texture-mode target
		     (raylib:clear-background raylib:+raywhite+)
		     (raylib:begin-vr-stereo-mode config)
		     (raylib:with-mode-3d camera
		       (raylib:draw-cube cube-position 2.0 2.0 2.0 raylib:+red+)
		       (raylib:draw-cube-wires cube-position 2.0 2.0 2.0 raylib:+maroon+)
		       (raylib:draw-grid 40 1.0))
		     (raylib:end-vr-stereo-mode))

		   (raylib:with-drawing
                     (raylib:clear-background raylib:+raywhite+)
		     (raylib:begin-shader-mode distortion)
		     (raylib:draw-texture-pro (raylib:render-texture-texture target)
					      source-rec
					      dest-rec
					      (raylib:make-vector2 :x 0.0 :y 0.0)
					      0.0
					      raylib:+white+)
		     (raylib:end-shader-mode)
		     (raylib:draw-fps 10 10)))

	  (raylib:unload-render-texture target))
	(raylib:unload-vr-stereo-config config)
	(raylib:unload-shader distortion)))))
