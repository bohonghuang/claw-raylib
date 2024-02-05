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


;; As of Raylib 5.0, the behavior of MatrixMultiply is to multiply the
;; columns of the left operand with the rows of the right operand, which
;; is considered mathematically incorrect and counterintuitive.
;; 
;; Raylib doesn't seem to be changing this behavior in the foreseeable
;; future, so here we swap these two operands to ensure correctness and
;; improve intuitiveness for the API.

(declaim (ftype (function (raylib:matrix raylib:matrix) (values raylib:matrix)) matrix-multiply)
         (inline matrix-multiply))
(defun matrix-multiply (left right)
  (raylib:matrix-multiply right left))

(declaim (ftype (function (foreign-pointer foreign-pointer foreign-pointer) (values foreign-pointer)) %matrix-multiply)
         (inline %matrix-multiply))
(defun %matrix-multiply (destination left right)
  (raylib:%matrix-multiply destination right left))

(let ((symbols '(raylib:matrix-multiply raylib:%matrix-multiply)))
  (unexport symbols :raylib)
  (dolist (symbol symbols)
    (unintern symbol :raylib)))
