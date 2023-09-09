(in-package #:claw-raylib.examples)

(defun world-screen ()
  (let ((screen-width 800)
        (screen-height 450))
    (raylib:with-window ("raylib [core] example - core world screen" (screen-width screen-height))
      (let* ((camera (raylib:make-camera :position (raylib:make-vector3 :x 0.0 :y 10.0 :z 10.0)
                                         :target (raylib:vector3-zero)
                                         :up (raylib:make-vector3 :x 0.0 :y 1.0 :z 0.0)
                                         :projection (foreign-enum-value 'raylib:camera-projection :perspective)
                                         :fovy 45.0))
             (cube-position (raylib:vector3-zero))
             (cube-text-position (raylib:make-vector3
                                  :x (raylib:vector3-x cube-position)
                                  :y (+ (raylib:vector3-y cube-position) 2.5)
                                  :z (raylib:vector3-z cube-position)))
             (cube-screen-position (raylib:vector2-zero)))
        (raylib:disable-cursor)
        (raylib:set-target-fps 60)
        (loop :until (raylib:window-should-close)
              :do (raylib:update-camera camera #.(foreign-enum-value 'raylib:camera-mode :free))
                  (raylib:%get-world-to-screen (& cube-screen-position) (& cube-text-position) (& camera))
                  (raylib:with-drawing
                    (raylib:clear-background raylib:+raywhite+)
                    (raylib:with-mode-3d camera
                      (raylib:draw-cube cube-position 2.0 2.0 2.0 raylib:+red+)
                      (raylib:draw-cube-wires cube-position 2.0 2.0 2.0 raylib:+maroon+)
                      (raylib:draw-grid 10 1.0))
                    (let ((screen-position-x (floor (raylib:vector2-x cube-screen-position)))
                          (screen-position-y (floor (raylib:vector2-y cube-screen-position))))
                      (declare (type fixnum screen-position-x screen-position-y))
                      (raylib:draw-text "Enemy: 100 / 100"
                                        (- screen-position-x (floor (raylib:measure-text "Enemy: 100/100" 20) 2))
                                        (floor (raylib:vector2-y cube-screen-position)) 20 raylib:+black+);
                      (raylib:draw-text (format nil "Cube position in screen space coordinates: [~D, ~D]"
                                                screen-position-x screen-position-y)
                                        10 10 20 raylib:+lime+)
                      (raylib:draw-text "Text 2d should be always on top of the cube" 10 40 20 raylib:+gray+))))))))
