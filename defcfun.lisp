(defpackage claw-raylib.defcfun
  (:use #:cl #:alexandria))

(in-package #:claw-raylib.defcfun)

(defun cffi-object-type-p (type)
  (and (typep (setf type (cffi::ensure-parsed-base-type type)) 'cffi::foreign-pointer-type)
       (typep (setf type (cffi::ensure-parsed-base-type (cffi::pointer-type type))) 'cffi::foreign-struct-type)
       (cffi::name type)))

(defmacro defcobjfun (name result &rest args)
  (destructuring-bind (name symbol) name
    (let* ((should-define-wrapper-p (not (member '&rest args)))
           (internal-symbol (if should-define-wrapper-p (intern (format nil "%~A" symbol) (symbol-package symbol)) symbol))
           (return-object-p (string= (symbol-name (caar args)) (string '#:%%claw-result-))))
      `(progn
         (declaim (inline ,internal-symbol))
         (%defcfun (,name ,internal-symbol) ,result . ,args)
         (export ',internal-symbol ',(symbol-package internal-symbol))
         ,(when should-define-wrapper-p
            (if return-object-p
                (let* ((object-type (when return-object-p (cffi-object-type-p (cadar args))))
                       (object-constructor (when return-object-p (intern (format nil "~A~A" '#:make- object-type) (symbol-package object-type)))))
                  `(progn
                     (declaim (ftype function ,object-constructor)
                              (notinline ,object-constructor))
                     (defun ,symbol ,(mapcar #'car (cdr args))
                       (let ((,(caar args) (,object-constructor)))
                         (progn
                           (,internal-symbol . ,(loop :for (name type) :in args :collect (if (cffi-object-type-p type) `(cobj:cobject-pointer ,name) name)))
                           ,(caar args))))))
                `(defun ,symbol ,(mapcar #'car args)
                   (,internal-symbol . ,(loop :for (name type) :in args :collect (if (cffi-object-type-p type) `(cobj:cobject-pointer ,name) name))))))))))

(shiftf (macro-function '%defcfun) (macro-function 'cffi:defcfun) (macro-function 'defcobjfun))
