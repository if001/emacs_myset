;;; 03-tab.el --- Tab settings:

;;; Commentary:

;;; Code:

(tab-bar-mode -1) ;; centaur-tabsを使うのでoff

;; エラーがあったときだけログバッファを表示
(if (not (equal (init-loader-error-log) ""))
    (init-loader-show-log))

(use-package centaur-tabs
  :ensure t
  :init
  (centaur-tabs-mode t) ;; グローバルにCentaur Tabsを有効にする
  :config
  (centaur-tabs-mode t)
  (defun centaur-tabs-hide-tab (x)
  "Do no to show buffer X in tabs."
  (let ((name (format "%s" x)))
    (or
     ;; Current window is not dedicated window.
     (window-dedicated-p (selected-window))

     ;; Buffer name not match below blacklist.
     (string-prefix-p "*Flycheck" name)
     (string-prefix-p "*Flymake log*" name)
     (string-prefix-p "*Warnings*" name)
     (string-prefix-p "*Messages*" name)
     (string-prefix-p "*lsp" name)
     (string-prefix-p "*pylsp*" name)
     (string-prefix-p "*pylsp::stderr*" name)

     ;; Is not magit buffer.
     (and (string-prefix-p "magit" name)
	  (not (file-name-extension name)))
     )))
  :custom
  ;; (centaur-tabs-style "wave")

  ;; icons
  (centaur-tabs-set-icons t)
  (centaur-tabs-plain-icons t)

  ;; To display an underline over the selected tab:
  (centaur-tabs-set-bar 'under)
  (x-underline-at-descent-line t)

  (centaur-tabs-set-close-button nil)

  ;; Customize the modified marker
  (centaur-tabs-set-modified-marker t)
  (centaur-tabs-modified-marker "*")
  :bind
  ("M-[" . centaur-tabs-backward)
  ("M-]" . centaur-tabs-forward)
  )



;; --- モードライン ---
(use-package nyan-mode
  :straight (nyan-mode :type git :host nil :repo "https://github.com/TeMPOraL/nyan-mode.git" :tag "v1.1.3")
  :init
  (setq nyan-bar-length 24)
  (nyan-mode +1))

;;; デフォルトのモードラインでは各言語のメジャーモードやマイナーモードが全て表示されますが、こちらのパッケージを導入することで、マイナーモードがハンバーガーメニューで表示され、マウスクリックで表示されるようになります。
(use-package minions
  :init
  (minions-mode +1))
