(in-package #:claw-raylib.examples)

(defcstruct cint
  (value :int))

(defcstruct cbool
  (value :bool))

(defcstruct cfloat
  (value :float))

(cobj:define-cobject-class (:struct cint))

(cobj:define-cobject-class (:struct cbool))

(cobj:define-cobject-class (:struct cfloat))

(defun controls-test-suite ()
  (let ((screen-width 960)
        (screen-height 560))
    (raylib:with-window ("raygui - controls test suite" (screen-width screen-height))
      (raylib:set-exit-key 0)
      (let ((drop-down-box-000-active (make-cint :value 0))
            (drop-down-000-edit-mode (make-cbool :value nil))
            (drop-down-box-001-active (make-cint :value 0))
            (drop-down-001-edit-mode (make-cbool :value nil))
            (spinner-001-value (make-cint :value 0))
            (spinner-edit-mode (make-cbool :value nil))
            (value-box-002-value (make-cint :value 0))
            (value-box-edit-mode (make-cbool :value nil))
            (text-box-text (cobj:make-carray 64 :element-type 'character :initial-contents "Text box"))
            (text-box-edit-mode (make-cbool :value nil))
            (text-box-multi-text (cobj:make-carray 1024 :element-type 'character :initial-contents (format nil "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.~%~%Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.~%~%Thisisastringlongerthanexpectedwithoutspacestotestcharbreaksforthosecases,checkingifworkingasexpected.~%~%Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")))
            (text-box-multi-edit-mode (make-cbool :value nil))
            (list-view-scroll-index (make-cint :value 0))
            (list-view-active (make-cint :value -1))
            (list-view-ex-scroll-index (make-cint :value 0))
            (list-view-ex-active (make-cint :value 2))
            (list-view-ex-focus (make-cint :value -1))
            (list-view-ex-list (cobj:make-carray 8 :element-type 'string :initial-contents '("This" "is" "a" "list view" "with" "disable" "elements" "amazing!")))
            (multi-text-box-text (cobj:make-carray 256 :element-type 'character :initial-contents "Multi text box"))
            (multi-text-box-edit-mode (make-cbool :value nil))
            (color-picker-value (raylib:copy-color raylib:+red+))
            (slider-value (make-cfloat :value 50.0))
            (slider-bar-value (make-cfloat :value 60.0))
            (progress-value (make-cfloat :value 0.1))
            (force-squared-checked (make-cbool :value nil))
            (alpha-value (make-cfloat :value 0.5))
            (visual-style-active (make-cint :value 0))
            (prev-visual-style-active (make-cint :value 0))
            (toggle-group-active (make-cint :value 0))
            (toggle-slider-active (make-cint :value 0))
            (view-scroll (raylib:vector2-zero))
            (exit-window (make-cbool :value nil))
            (show-message-box (make-cbool :value nil))
            (text-input (cobj:make-carray 256 :element-type 'character :initial-element #\Null))
            (text-input-file-name (cobj:make-carray 256 :element-type 'character :initial-element #\Null))
            (show-text-input-box (make-cbool :value nil))
            (alpha (make-cfloat :value 1.0))
            (secret-view-active (cobj:pointer-cobject (null-pointer) 'cbool)))
        (declare (ignore multi-text-box-text multi-text-box-edit-mode))
        (raylib:set-target-fps 60)
        (raygui:set-font (raylib:get-font-default))
        (let ((background-color (raylib:make-color))
              (rectangle (raylib:make-rectangle))
              (rectangle-2 (raylib:make-rectangle))
              (vector2 (raylib:make-vector2))
              (faded-raywhite (raylib:fade raylib:+raywhite+ 0.8)))
          (macrolet ((raylib:make-rectangle (&key (x 0.0) (y 0.0) (width 0.0) (height 0.0))
                       `(progn
                          (setf (raylib:rectangle-x rectangle) ,x
                                (raylib:rectangle-y rectangle) ,y
                                (raylib:rectangle-width rectangle) ,width
                                (raylib:rectangle-height rectangle) ,height)
                          rectangle))
                     (raylib:make-vector2 (&key (x 0.0) (y 0.0))
                       `(progn
                          (setf (raylib:vector2-x vector2) ,x
                                (raylib:vector2-y vector2) ,y)
                          vector2)))
            (loop :until (cbool-value exit-window)
                  :do (setf (cbool-value exit-window) (raylib:window-should-close))
                      (when (raylib:is-key-pressed #.(foreign-enum-value 'raylib:keyboard-key :escape))
                        (setf (cbool-value show-message-box) (not (cbool-value show-message-box))))
                      (when (and (raylib:is-key-down #.(foreign-enum-value 'raylib:keyboard-key :left-control))
                                 (raylib:is-key-pressed #.(foreign-enum-value 'raylib:keyboard-key :s)))
                        (setf (cbool-value show-message-box) t))
                      (raylib:with-dropped-files dropped-files
                        (when (and (plusp (raylib:file-path-list-count dropped-files))
                                   (raylib:is-file-extension (cobj:cref (raylib:file-path-list-paths dropped-files) 0) ".rgs"))
                          (raygui:load-style (cobj:cref (raylib:file-path-list-paths dropped-files) 0))))
                      (maxf (cfloat-value alpha) 0.0)
                      (when (raylib:is-key-pressed #.(foreign-enum-value 'raylib:keyboard-key :space))
                        (setf (cfloat-value alpha) 1.0))
                      (setf (cfloat-value progress-value) (clamp (cfloat-value progress-value) 0.0 1.0))
                      (unless (eq (cint-value visual-style-active) (cint-value prev-visual-style-active))
                        (raygui:load-style-default)
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :label)
                         #.(foreign-enum-value 'raygui:control-property :text-alignment)
                         #.(foreign-enum-value 'raygui:text-alignment :left))
                        (setf (cint-value prev-visual-style-active) (cint-value visual-style-active)))
                      (raylib:with-drawing
                        (raylib:%get-color
                         (& background-color)
                         (mod
                          (raygui:get-style
                           #.(foreign-enum-value 'raygui:control :default)
                           #.(foreign-enum-value 'raygui:default-property :background-color))
                          #xFFFFFFFF))
                        (raylib:clear-background background-color)
                        (when (or (cbool-value drop-down-000-edit-mode)
                                  (cbool-value drop-down-001-edit-mode))
                          (raygui:lock))
                        (raygui:check-box
                         (raylib:make-rectangle :x 25.0 :y 108.0 :width 15.0 :height 15.0)
                         "FORCE CHECK!" force-squared-checked)
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :textbox)
                         #.(foreign-enum-value 'raygui:control-property :text-alignment)
                         #.(foreign-enum-value 'raygui:text-alignment :center))
                        (when (plusp (raygui:spinner (raylib:make-rectangle :x 25.0 :y 135.0 :width 125.0 :height 30.0)
                                                     (null-pointer) spinner-001-value 0 100 (cbool-value spinner-edit-mode)))
                          (setf (cbool-value spinner-edit-mode) (not (cbool-value spinner-edit-mode))))
                        (when (plusp (raygui:value-box (raylib:make-rectangle :x 25.0 :y 175.0 :width 125.0 :height 30.0)
                                                       (null-pointer) value-box-002-value 0 100 (cbool-value value-box-edit-mode)))
                          (setf (cbool-value value-box-edit-mode) (not (cbool-value value-box-edit-mode))))
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :textbox)
                         #.(foreign-enum-value 'raygui:control-property :text-alignment)
                         #.(foreign-enum-value 'raygui:text-alignment :left))
                        (when (plusp (raygui:text-box (raylib:make-rectangle :x 25.0 :y 215.0 :width 125.0 :height 30.0)
                                                      (& text-box-text) 64 (cbool-value text-box-edit-mode)))
                          (setf (cbool-value text-box-edit-mode) (not (cbool-value text-box-edit-mode))))
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :button)
                         #.(foreign-enum-value 'raygui:control-property :text-alignment)
                         #.(foreign-enum-value 'raygui:text-alignment :center))
                        (when (plusp (raygui:button
                                      (raylib:make-rectangle :x 25.0 :y 255.0 :width 125.0 :height 30.0)
                                      (raygui:icon-text #.(foreign-enum-value 'raygui:icon-name :file-save) "Save File")))
                          (setf (cbool-value show-text-input-box) t))
                        (raygui:group-box (raylib:make-rectangle :x 25.0 :y 310.0 :width 125.0 :height 150.0) "STATES")
                        (raygui:set-state #.(foreign-enum-value 'raygui:state :normal))
                        (when (plusp (raygui:button (raylib:make-rectangle :x 30.0 :y 320.0 :width 115.0 :height 30.0) "NORMAL")))
                        (raygui:set-state #.(foreign-enum-value 'raygui:state :focused))
                        (when (plusp (raygui:button (raylib:make-rectangle :x 30.0 :y 355.0 :width 115.0 :height 30.0) "FOCUSED")))
                        (raygui:set-state #.(foreign-enum-value 'raygui:state :pressed))
                        (when (plusp (raygui:button (raylib:make-rectangle :x 30.0 :y 390.0 :width 115.0 :height 30.0) "#15#PRESSED")))
                        (raygui:set-state #.(foreign-enum-value 'raygui:state :disabled))
                        (when (plusp (raygui:button (raylib:make-rectangle :x 30.0 :y 425.0 :width 115.0 :height 30.0) "DISABLE")))
                        (raygui:set-state #.(foreign-enum-value 'raygui:state :normal))
                        (raygui:combo-box
                         (raylib:make-rectangle :x 25.0 :y 480.0 :width 125.0 :height 30.0)
                         "default;Jungle;Lavanda;Dark;Bluish;Cyber;Terminal"
                         visual-style-active)
                        (raygui:unlock)
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :dropdownbox)
                         #.(foreign-enum-value 'raygui:control-property :text-padding)
                         4)
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :dropdownbox)
                         #.(foreign-enum-value 'raygui:control-property :text-alignment)
                         #.(foreign-enum-value 'raygui:text-alignment :left))
                        (when (plusp (raygui:dropdown-box
                                      (raylib:make-rectangle :x 25.0 :y 65.0 :width 125.0 :height 30.0)
                                      "#01#ONE;#02#TWO;#03#THREE;#04#FOUR"
                                      drop-down-box-001-active (cbool-value drop-down-001-edit-mode)))
                          (setf (cbool-value drop-down-001-edit-mode) (not (cbool-value drop-down-001-edit-mode))))
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :dropdownbox)
                         #.(foreign-enum-value 'raygui:control-property :text-alignment)
                         #.(foreign-enum-value 'raygui:text-alignment :center))
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :dropdownbox)
                         #.(foreign-enum-value 'raygui:control-property :text-padding)
                         0)
                        (when (plusp (raygui:dropdown-box
                                      (raylib:make-rectangle :x 25.0 :y 25.0 :width 125.0 :height 30.0)
                                      "ONE;TWO;THREE"
                                      drop-down-box-000-active (cbool-value drop-down-000-edit-mode)))
                          (setf (cbool-value drop-down-000-edit-mode) (not (cbool-value drop-down-000-edit-mode))))
                        (raygui:list-view
                         (raylib:make-rectangle :x 165.0 :y 25.0 :width 140.0 :height 124.0)
                         "Charmander;Bulbasaur;#18#Squirtel;Pikachu;Eevee;Pidgey"
                         list-view-scroll-index list-view-active)
                        (raygui:list-view-ex
                         (raylib:make-rectangle :x 165.0 :y 162.0 :width 140.0 :height 184.0)
                         list-view-ex-list (cobj:clength list-view-ex-list)
                         list-view-ex-scroll-index list-view-ex-active list-view-ex-focus)
                        (raygui:toggle-group
                         (raylib:make-rectangle :x 165.0 :y 360.0 :width 140.0 :height 24.0)
                         (format nil "#1#ONE~%#3#TWO~%#8#THREE~%#23#")
                         toggle-group-active)
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :slider)
                         #.(foreign-enum-value 'raygui:slider-property :padding)
                         2)
                        (raygui:toggle-slider
                         (raylib:make-rectangle :x 165.0 :y 480.0 :width 140.0 :height 30.0)
                         "ON;OFF" toggle-slider-active)
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :slider)
                         #.(foreign-enum-value 'raygui:slider-property :padding)
                         0)
                        (raygui:panel (raylib:make-rectangle :x 320.0 :y 25.0 :width 225.0 :height 140.0) "Panel Info")
                        (raygui:color-picker (raylib:make-rectangle :x 320.0 :y 185.0 :width 196.0 :height 192.0) (null-pointer) color-picker-value)
                        (raygui:slider (raylib:make-rectangle :x 355.0 :y 400.0 :width 165.0 :height 20.0) "TEST" (format nil "~,2F" (cfloat-value slider-value)) slider-value -50.0 100.0)
                        (raygui:slider-bar (raylib:make-rectangle :x 320.0 :y 430.0 :width 200.0 :height 20.0) (null-pointer) (format nil "~D" (floor (cfloat-value slider-bar-value))) slider-bar-value 0.0 100.0)
                        (raygui:progress-bar (raylib:make-rectangle :x 320.0 :y 460.0 :width 200.0 :height 20.0) (null-pointer) (format nil "~D%" (floor (* (cfloat-value progress-value) 100.0))) progress-value 0.0 1.0)
                        (raygui:enable)
                        (let ((view (raylib:make-rectangle)))
                          (raygui:scroll-panel
                           (raylib:copy-rectangle (raylib:make-rectangle :x 560.0 :y 25.0 :width 102.0 :height 354.0) rectangle-2)
                           (null-pointer) (raylib:make-rectangle :x 560.0 :y 25.0 :width 300.0 :height 1200.0) view-scroll view))
                        (let ((mouse-cell (raylib:make-vector2)))
                          (raygui:grid
                           (raylib:make-rectangle :x 560.0 :y (+ 25.0 180.0 195.0)
                                                  :width 100.0 :height 120.0)
                           (null-pointer) 20.0 3 mouse-cell))
                        (raygui:color-bar-alpha (raylib:make-rectangle :x 320.0 :y 490.0 :width 200.0 :height 30.0) (null-pointer) alpha-value)
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :default)
                         #.(foreign-enum-value 'raygui:default-property :text-alignment-vertical)
                         #.(foreign-enum-value 'raygui:text-alignment-vertical :top))
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :default)
                         #.(foreign-enum-value 'raygui:default-property :text-wrap-mode)
                         #.(foreign-enum-value 'raygui:text-wrap-mode :word))
                        (when (plusp (raygui:text-box (raylib:make-rectangle :x 678.0 :y 25.0 :width 258.0 :height 492.0) (& text-box-multi-text) 1024 (cbool-value text-box-multi-edit-mode)))
                          (setf (cbool-value text-box-multi-edit-mode) (not (cbool-value text-box-multi-edit-mode))))
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :default)
                         #.(foreign-enum-value 'raygui:default-property :text-wrap-mode)
                         #.(foreign-enum-value 'raygui:text-wrap-mode :none))
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :default)
                         #.(foreign-enum-value 'raygui:default-property :text-alignment-vertical)
                         #.(foreign-enum-value 'raygui:text-alignment-vertical :middle))
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :default)
                         #.(foreign-enum-value 'raygui:control-property :text-alignment)
                         #.(foreign-enum-value 'raygui:text-alignment :left))
                        (raygui:status-bar
                         (raylib:make-rectangle :x 0.0 :y (- (coerce (raylib:get-screen-height) 'single-float) 20.0)
                                                :width (coerce (raylib:get-screen-width) 'single-float)
                                                :height 20.0)
                         "This is a status bar")
                        (raygui:set-style
                         #.(foreign-enum-value 'raygui:control :default)
                         #.(foreign-enum-value 'raygui:control-property :text-alignment)
                         #.(foreign-enum-value 'raygui:text-alignment :center))
                        (when (cbool-value show-message-box)
                          (raylib:draw-rectangle 0 0 (raylib:get-screen-width) (raylib:get-screen-height) faded-raywhite)
                          (case (raygui:message-box
                                 (raylib:make-rectangle :x (coerce (- (floor (raylib:get-screen-width) 2) 125) 'single-float)
                                                        :y (coerce (- (floor (raylib:get-screen-height) 2) 50) 'single-float)
                                                        :width 250.0 :height 100.0)
                                 (raygui:icon-text #.(foreign-enum-value 'raygui:icon-name :exit) "Close Window")
                                 "Do you really want to exit?" "Yes;No")
                            ((0 2) (setf (cbool-value show-message-box) nil))
                            (1 (setf (cbool-value exit-window) t))))
                        (when (cbool-value show-text-input-box)
                          (raylib:draw-rectangle 0 0 (raylib:get-screen-width) (raylib:get-screen-height) faded-raywhite)
                          (let ((result (raygui:text-input-box
                                         (raylib:make-rectangle :x (coerce (- (floor (raylib:get-screen-width) 2) 120) 'single-float)
                                                                :y (coerce (- (floor (raylib:get-screen-height) 2) 60) 'single-float)
                                                                :width 240.0 :height 140.0)
                                         (raygui:icon-text #.(foreign-enum-value 'raygui:icon-name :file-save) "Save file as...")
                                         "Introduce output file name:"
                                         "Ok;Cancel" (& text-input) 255 secret-view-active)))
                            (case result
                              (1 (setf (cobj:ccoerce text-input-file-name 'string) (cobj:ccoerce text-input 'string))))
                            (case result
                              ((0 1 2)
                               (setf (cbool-value show-text-input-box) nil)
                               (setf (cobj:ccoerce text-input 'string) "")))))))))))))
