(cl:in-package #:raylib)

(cobj:define-cobject-class #:raylib)

(cl:in-package #:rlgl)

(cobj:define-cobject-class #:rlgl)

(cl:in-package #:raygui)

(cl:do-symbols (symbol '#:raygui)
  (alexandria:when-let ((pos (cl:search (cl:symbol-name '#:make-) (cl:symbol-name symbol))))
    (cl:when (cl:and (cl:zerop pos) (cl:not (cl:fboundp symbol)))
      (alexandria:when-let ((function-symbol (cl:find-symbol (cl:symbol-name symbol) '#:raylib)))
        (cl:setf (cl:fdefinition symbol) (cl:fdefinition function-symbol))))))

(cl:in-package #:claw-raylib)

(do-symbols (symbol :raylib)
  (when (find-class symbol nil)
    (when-let ((definition (ignore-errors (cobj::cobject-class-definition symbol))))
      (export (cobj::cobject-class-definition-symbols definition) :raylib))))

(do-symbols (symbol :rlgl)
  (when (find-class symbol nil)
    (when-let ((definition (ignore-errors (cobj::cobject-class-definition symbol))))
      (export (cobj::cobject-class-definition-symbols definition) :rlgl))))
