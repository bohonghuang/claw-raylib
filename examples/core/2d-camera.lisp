(in-package #:claw-raylib.examples)

(defconstant +2d-camera-max-buildings+ 100)

(defun 2d-camera ()
  (let ((screen-width 800)
        (screen-height 450))
    (raylib:with-window ("raylib [core] example - 2d camera" (screen-width screen-height))
      (let ((player (raylib:make-rectangle :x 400.0 :y 280.0 :width 40.0 :height 40.0))
            (buildings (make-array +2d-camera-max-buildings+))
            (build-colors (make-array +2d-camera-max-buildings+)))
        (loop :for i :below +2d-camera-max-buildings+
              :for width :of-type single-float := (coerce (raylib:get-random-value 50 200) 'single-float)
              :for height :of-type single-float := (coerce (raylib:get-random-value 100 800) 'single-float)
              :do (setf (aref buildings i) (raylib:make-rectangle :x (- spacing 6000.0)
                                                                  :y (- screen-height 130.0 height)
                                                                  :width width
                                                                  :height height)
                        (aref build-colors i) (raylib:make-color :r (raylib:get-random-value 200 240)
                                                                 :g (raylib:get-random-value 200 240)
                                                                 :b (raylib:get-random-value 200 240)
                                                                 :a 255))
              :sum width :into spacing :of-type single-float)
        (let* ((camera (raylib:make-camera-2d
                        :target (raylib:make-vector2
                                 :x (+ (raylib:rectangle-x player) 20.0)
                                 :y (+ (raylib:rectangle-y player) 20.0))
                        :offset (raylib:make-vector2
                                 :x (/ screen-width 2.0)
                                 :y (/ screen-height 2.0))
                        :rotation 0.0
                        :zoom 1.0))
               (camera-target (raylib:camera-2d-target camera))
               (faded-sky-blue (raylib:fade raylib:+skyblue+ 0.5)))
          (raylib:set-target-fps 60)
          (loop :until (raylib:window-should-close)
                :do (cond
                      ((raylib:is-key-down #.(foreign-enum-value 'raylib:keyboard-key :right))
                       (incf (raylib:rectangle-x player) 2.0))
                      ((raylib:is-key-down #.(foreign-enum-value 'raylib:keyboard-key :left))
                       (decf (raylib:rectangle-x player) 2.0)))
                    (setf (raylib:vector2-x camera-target) (+ (raylib:rectangle-x player) 20.0)
                          (raylib:vector2-y camera-target) (+ (raylib:rectangle-y player) 20.0))
                    (cond
                      ((raylib:is-key-down #.(foreign-enum-value 'raylib:keyboard-key :a))
                       (incf (raylib:camera-2d-rotation camera) 1.0))
                      ((raylib:is-key-down #.(foreign-enum-value 'raylib:keyboard-key :s))
                       (decf (raylib:camera-2d-rotation camera) 1.0)))
                    (setf (raylib:camera-2d-rotation camera) (clamp (raylib:camera-2d-rotation camera) -40.0 40.0))
                    (incf (raylib:camera-2d-zoom camera) (* (raylib:get-mouse-wheel-move) 0.05))
                    (setf (raylib:camera-2d-zoom camera) (clamp (raylib:camera-2d-zoom camera) 0.1 3.0))
                    (when (raylib:is-key-pressed #.(foreign-enum-value 'raylib:keyboard-key :r))
                      (setf (raylib:camera-2d-zoom camera) 1.0
                            (raylib:camera-2d-rotation camera) 0.0))
                    (raylib:with-drawing
                      (raylib:clear-background raylib:+raywhite+)
                      (raylib:with-mode-2d camera
                        (raylib:draw-rectangle -6000 320 13000 8000 raylib:+darkgray+)
                        (loop :for building :across buildings
                              :for build-color :across build-colors
                              :do (raylib:draw-rectangle-rec building build-color))
                        (raylib:draw-rectangle-rec player raylib:+red+)
                        (raylib:draw-line (floor (raylib:vector2-x camera-target)) (* screen-height -10)
                                          (floor (raylib:vector2-x camera-target)) (* screen-height 10) raylib:+green+)
                        (raylib:draw-line (* screen-width -10) (floor (raylib:vector2-y camera-target))
                                          (* screen-width 10) (floor (raylib:vector2-y camera-target)) raylib:+green+))
                      (raylib:draw-text "SCREEN AREA" 640 10 20 raylib:+red+)
                      (raylib:draw-rectangle 0 0 screen-width 5 raylib:+red+)
                      (raylib:draw-rectangle 0 5 5 (- screen-height 10) raylib:+red+)
                      (raylib:draw-rectangle (- screen-width 5) 5 5 (- screen-height 10) raylib:+red+)
                      (raylib:draw-rectangle 0 (- screen-height 5) screen-width 5 raylib:+red+)
                      (raylib:draw-rectangle 10 10 250 113 faded-sky-blue)
                      (raylib:draw-rectangle-lines 10 10 250 113 raylib:+blue+)
                      (raylib:draw-text "Free 2d camera controls:"  20  20  10  raylib:+black+)
                      (raylib:draw-text "- Right/Left to move Offset"  40  40  10  raylib:+darkgray+)
                      (raylib:draw-text "- Mouse Wheel to Zoom in-out"  40  60  10  raylib:+darkgray+)
                      (raylib:draw-text "- A / S to Rotate"  40  80  10  raylib:+darkgray+)
                      (raylib:draw-text "- R to reset Zoom and Rotation"  40  100  10  raylib:+darkgray+))))))))
