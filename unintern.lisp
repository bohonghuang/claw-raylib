(in-package #:claw-raylib)

(dolist (symbol '(raylib:+lightgray+
                  raylib:+gray+
                  raylib:+darkgray+
                  raylib:+yellow+
                  raylib:+gold+
                  raylib:+orange+
                  raylib:+pink+
                  raylib:+red+
                  raylib:+maroon+
                  raylib:+green+
                  raylib:+lime+
                  raylib:+darkgreen+
                  raylib:+skyblue+
                  raylib:+blue+
                  raylib:+darkblue+
                  raylib:+purple+
                  raylib:+violet+
                  raylib:+darkpurple+
                  raylib:+beige+
                  raylib:+brown+
                  raylib:+darkbrown+
                  raylib:+white+
                  raylib:+black+
                  raylib:+blank+
                  raylib:+magenta+
                  raylib:+raywhite+))
  (unexport symbol :raylib)
  (unintern symbol :raylib))
