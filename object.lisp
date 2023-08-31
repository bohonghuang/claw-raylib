(cl:in-package #:raylib)

(cobj:define-cobject-class #:raylib)

(cl:in-package #:rlgl)

(cobj:define-cobject-class #:rlgl)

(cl:in-package #:claw-raylib)

(do-symbols (symbol :raylib)
  (when (find-class symbol nil)
    (when-let ((definition (ignore-errors (cobj::cobject-class-definition symbol))))
      (export (cobj::cobject-class-definition-symbols definition) :raylib))))

(do-symbols (symbol :rlgl)
  (when (find-class symbol nil)
    (when-let ((definition (ignore-errors (cobj::cobject-class-definition symbol))))
      (export (cobj::cobject-class-definition-symbols definition) :rlgl))))
