;;; 50-doomtheme.el --- doomtheme-mode settings:

;;; Commentary:

;;; Code:
(use-package doom-themes
  :custom
  (doom-themes-enable-italic t)
  (doom-themes-enable-bold t)
  :custom-face
  (doom-modeline-bar ((t (:background "#6272a4"))))
  :config
  (load-theme 'doom-dracula t)
  (doom-themes-neotree-config)
  (doom-themes-org-config)
  
  ;; tab-lineの設定をここで上書き4
  (set-face-attribute 'tab-line nil ;; background behind tabs
		      :background "#2c2f33"
		      :family "Ricty Diminished"
		      :height 1.0 :box nil)
  (set-face-attribute 'tab-line-tab nil ;; active tab in another window
		      :inherit 'tab-line
		      :background "grey20"
		      :foreground "#DCDCCC"
		      :box nil)
  (set-face-attribute 'tab-line-tab-current nil ;; active tab in current window
		      :background "grey50"
		      :foreground "#DCDCCC"
		      :box nil)
  (set-face-attribute 'tab-line-tab-inactive nil ;; inactive tab
		      :background "grey20"
		      :foreground "#DCDCCC"
		      :box nil)
  (set-face-attribute 'tab-line-highlight nil ;; mouseover
		      :background "white"
		      :foreground 'unspecified)
)
    
;; (require 'doom-themes)
;; :config
;; ;; Global settings (defaults)
;; (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;       doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; ;; may have their own settings.
;; (load-theme 'doom-one t)

;; ;; Enable flashing mode-line on errors
;; (doom-themes-visual-bell-config)

;; ;; Enable custom neotree theme (all-the-icons must be installed!)
;; (doom-themes-neotree-config)
;; ;; or for treemacs users
;; (doom-themes-treemacs-config)

;; ;; Corrects (and improves) org-mode's native fontification.
;; (doom-themes-org-config)

;; 左の行番号の色設定はdoomのを上書きするためここに記述
;; (set-face-attribute 'linum nil
;;             :foreground "#20232a"
;;             :background "gray65"
;;             :height 0.9)
;; (setq linum-format "%4d")  ;;予めマージンを指定

;; -------------------------------------------------------------------
;; doom-modeline
    (use-package doom-modeline
      :custom
      (doom-modeline-buffer-file-name-style 'truncate-with-project)
      (doom-modeline-icon t)
      (doom-modeline-major-mode-icon t)
      (doom-modeline-minor-modes nil)
      (doom-modeline-lsp t)
      (doom-modeline-github t)
      
      :hook
      (after-init . doom-modeline-mode)
      :config
      (line-number-mode 0)
      (column-number-mode 0)
      (doom-modeline-def-modeline 'main
    '(bar workspace-number window-number evil-state god-state ryo-modal xah-fly-keys matches buffer-info remote-host buffer-position parrot selection-info)
    '(misc-info persp-name lsp github debug minor-modes input-method major-mode process vcs checker)))


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
;; (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)

;;; is large file
(defun is-current-file-size-small (size)
  "Wether current buffer size is over SIZE(byte)."
  (< (nth 7 (file-attributes (buffer-file-name))) size)
  )


;; インデントハイライト
(use-package highlight-indent-guides
  :ensure t
  :custom
  (highlight-indent-guides-method 'column)
  ;; (highlight-indent-guides-method 'character)
  (highlight-indent-guides-responsive t)
  :config
  (defun toggle-indent ()
    (interactive)
    (if (is-current-file-size-small 10000)
    	 (highlight-indent-guides-mode)
      (message "file too large!!!!!")
      )
    )
  :bind
  ("\C-h" . toggle-indent)
  )


;; ;;-------------------------------------------------------------------------;;
;; (use-package hiwin
;;   :config;; 非アクティブウィンドウの背景色を設定
;;   (hiwin-activate)                           ;; hiwin-modeを有効化
;;   (set-face-background 'hiwin-face "#20232a") ;; 非アクティブウィンドウの背景色を設定
;;   )
;; ;;-------------------------------------------------------------------------;;
