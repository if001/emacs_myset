;; doom-theme
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; or for treemacs users
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; 左の行番号の色設定はdoomのを上書きするためここに記述
;; (set-face-attribute 'linum nil
;;             :foreground "#20232a"
;;             :background "gray65"
;;             :height 0.9)
;; (setq linum-format "%4d")  ;;予めマージンを指定

;; -------------------------------------------------------------------
;; doom-modeline
(use-package doom-modeline)
(doom-modeline-mode 1)

;; How tall the mode-line should be (only respected in GUI Emacs).
(setq doom-modeline-height 25)

;; How wide the mode-line bar should be (only respected in GUI Emacs).
(setq doom-modeline-bar-width 3)

;; Determines the style used by `doom-modeline-buffer-file-name'.
;;
;; Given ~/Projects/FOSS/emacs/lisp/comint.el
;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
;;   truncate-with-project => emacs/l/comint.el
;;   truncate-except-project => ~/P/F/emacs/l/comint.el
;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
;;   truncate-all => ~/P/F/e/l/comint.el
;;   relative-from-project => emacs/lisp/comint.el
;;   relative-to-project => lisp/comint.el
;;   file-name => comint.el
;;   buffer-name => comint.el<2> (uniquify buffer name)
;;
;; If you are expereicing the laggy issue, especially while editing remote files
;; with tramp, please try `file-name' style.
;; Please refer to https://github.com/bbatsov/projectile/issues/657.
(setq doom-modeline-buffer-file-name-style 'truncate-upto-project)

;; What executable of Python will be used (if nil nothing will be showed).
(setq doom-modeline-python-executable "python")

;; Whether show `all-the-icons' or not (if nil nothing will be showed).
(setq doom-modeline-icon t)

;; Whether show the icon for major mode. It respects `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)

;; Display color icons for `major-mode'. It respects `all-the-icons-color-icons'.
(setq doom-modeline-major-mode-color-icon nil)

;; Whether display minor modes or not. Non-nil to display in mode-line.
(setq doom-modeline-minor-modes nil)

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count t)

;; If non-nil, only display one number for checker information if applicable.
(setq doom-modeline-checker-simple-format t)

;; Whether display perspective name or not. Non-nil to display in mode-line.
(setq doom-modeline-persp-name t)

;; Whether display `lsp' state or not. Non-nil to display in mode-line.
(setq doom-modeline-lsp t)

;; Whether display github notifications or not. Requires `ghub` package.
(setq doom-modeline-github t)

;; The interval of checking github.
(setq doom-modeline-github-interval (* 30 60))

;; Whether display environment version or not.
(setq doom-modeline-env-version t)

;; Whether display mu4e notifications or not. Requires `mu4e-alert' package.
(setq doom-modeline-mu4e t)


;; tabの設定
(set-face-attribute 'tabbar-default nil
		    :background "#2c2f33"
		    ;; :background "grey20"
		    ;:family "Ricty Diminished"
		    :height 1.0
		    :box nil)
(set-face-attribute 'tabbar-selected nil
		    :background "grey50"
		    :foreground "#DCDCCC"
		    :box nil)
(set-face-attribute 'tabbar-unselected nil
		    ;; :background "grey20"
		    :background "#2c2f33"
		    :foreground "#DCDCCC"
		    :box nil)
(set-face-attribute 'tabbar-separator nil
		    ;; :background "grey20"
		    :background "#2c2f33"
		    :box nil)
(set-face-attribute 'tabbar-button nil
		    :box nil)
(set-face-attribute 'header-line nil
		    :background "#2c2f33"
		    ;; :background "grey20"
		    :box nil)


;; インデントハイライト
(use-package highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;; (setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-method 'column)

(setq highlight-indent-guides-auto-enabled t)
(setq highlight-indent-guides-responsive t)
(global-set-key "\C-h" 'highlight-indent-guides-mode)


;;-------------------------------------------------------------------------;;
;; 非アクティブウィンドウの背景色を設定
(hiwin-activate)                           ;; hiwin-modeを有効化
(set-face-background 'hiwin-face "#20232a") ;; 非アクティブウィンドウの背景色を設定
;;-------------------------------------------------------------------------;;
