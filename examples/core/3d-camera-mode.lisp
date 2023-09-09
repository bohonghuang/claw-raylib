(in-package #:claw-raylib.examples)

(defun 3d-camera-mode ()
  (let ((screen-width 800)
        (screen-height 450))
    (raylib:with-window ("raylib [core] example - 3d camera mode" (screen-width screen-height))
      (let ((camera (raylib:make-camera :position (raylib:make-vector3 :x 0.0 :y 10.0 :z 10.0)
                                        :target (raylib:vector3-zero)
                                        :up (raylib:make-vector3 :x 0.0 :y 1.0 :z 0.0)
                                        :projection (foreign-enum-value 'raylib:camera-projection :perspective)
                                        :fovy 45.0))
            (cube-position (raylib:vector3-zero)))
        (raylib:set-target-fps 60)
        (loop :until (raylib:window-should-close)
              :do (raylib:with-drawing
                    (raylib:clear-background raylib:+raywhite+)
                    (raylib:with-mode-3d camera
                      (raylib:draw-cube cube-position 2.0 2.0 2.0 raylib:+red+)
                      (raylib:draw-cube-wires cube-position 2.0 2.0 2.0 raylib:+maroon+)
                      (raylib:draw-grid 10 1.0))
                    (raylib:draw-text "Welcome to the third dimension!" 10 40 20 raylib:+darkgray+)
                    (raylib:draw-fps 10 10)))))))