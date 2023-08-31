;;;; game/engine/ffi/utils.lisp

;;;; Copyright (C) 2022-2023 Bohong Huang
;;;;
;;;; This program is part of the Pokémon: Eonian Emerald project.
;;;;
;;;; This program is free software: you can redistribute it and/or modify
;;;; it under the terms of the GNU Affero General Public License as published by
;;;; the Free Software Foundation, either version 3 of the License, or
;;;; (at your option) any later version.
;;;;
;;;; This program is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;; GNU Affero General Public License for more details.
;;;;
;;;; You should have received a copy of the GNU Affero General Public License
;;;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

(in-package #:claw-raylib)

(defmacro define-conversion-into-foreign-memory (lambda-list &body body)
  (let ((unquoted (mapcar (lambda (x)
                            (etypecase x
                              (symbol x)
                              (list (car x))))
                          (list (first lambda-list) (third lambda-list)))))
    (labels ((walk-and-quote (form)
               (typecase form
                 (list (cond
                         ((eql (first form) 'quote) `(quote ,form))
                         ((eql form body) `(list 'progn . ,(mapcar #'walk-and-quote form)))
                         (t `(list . ,(mapcar #'walk-and-quote form)))))
                 (t (if (member form unquoted) form `(quote ,form))))))
      `(progn
         (eval-when (:compile-toplevel :load-toplevel :execute)
           (defmethod expand-into-foreign-memory (,(caar lambda-list) . ,(cdr lambda-list))
             ,(walk-and-quote body)))
         (defmethod translate-into-foreign-memory ,lambda-list
           ,@body)))))

(defmacro define-conversion-from-foreign (lambda-list &body body)
  (let ((unquoted (let ((arg1 (first lambda-list)))
                    (etypecase arg1
                      (symbol arg1)
                      (list arg1)))))
    (labels ((walk-and-quote (form)
               (typecase form
                 (list (cond
                         ((eql (first form) 'quote) `(quote ,form))
                         ((eql form body) `(list 'progn . ,(mapcar #'walk-and-quote form)))
                         (t `(list . ,(mapcar #'walk-and-quote form)))))
                 (t (if (eql form unquoted) form `(quote ,form))))))
      `(progn
         (eval-when (:compile-toplevel :load-toplevel :execute)
           (defmethod expand-from-foreign ,lambda-list
             ,(walk-and-quote body)))
         (defmethod translate-from-foreign ,lambda-list
           ,@body)))))
