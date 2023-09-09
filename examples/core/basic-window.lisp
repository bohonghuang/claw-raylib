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
