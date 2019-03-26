

;;-------------------------------------------------------------------------;;
;;  -*- coding: utf-8-unix -*-
;;-------------------------------------------------------------------------;;

;; C-x C-e でinit.elの設定反映(ショートカットC-f12)
;; M-x load-file RET ~/.emacs.d/init.el
;; で設定ファイルの再読み込み

;; バイトコンパイル(*.el → *.elc)は
;; M-x byte-compile-file RET



;;-------------------------------------------------------------------------;;
;; load-pathの追加関数
;; emacs-lispのファイルを読み込むパスを設定

;; load-pathで指定したディレクトリのサブディレクトリもload-pathに追加する設定

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; load-pathに追加するフォルダ
;; .emacs.dからの相対パスで記述
(add-to-load-path "elpa/"
		  "site-lisp/")
;;-------------------------------------------------------------------------;;


;;-------------------------------------------------------------------------;;
;; init-loaderの設定
;; 設定ファイルを分割して読み込む
(require 'init-loader)
(init-loader-load "~/.emacs.d/myconf")
;; 0 - 環境周りの設定
;; 1 - 環境周りの設定
;; 2 - マイナーモードなど
;; 3 - マイナーモードなど
;; 4 - マイナーモードなど
;; 5 - theme
;; 6 - theme
;; 7 - 言語
;; 8 - 言語
;; 9 - 言語
;;-------------------------------------------------------------------------;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(company-dabbrev-code-other-buffers (quote all))
 '(company-dabbrev-other-buffers (quote all))
 '(git-gutter:added-sign "+")
 '(git-gutter:deleted-sign "-")
 '(git-gutter:modified-sign "~")
 '(inhibit-startup-screen t)
 '(lsp-auto-guess-root t)
 '(lsp-document-sync-method (quote incremental))
 '(lsp-go-language-server-flags
   (quote
    ("-logfile=~/.go/src/github.com/saibing/bingo/log/")) t)
 '(lsp-prefer-flymake (quote flymake))
 '(lsp-print-io t)
 '(lsp-response-timeout 5)
 '(lsp-ui-doc-enable t)
 '(lsp-ui-doc-header t)
 '(lsp-ui-doc-include-signature t)
 '(lsp-ui-doc-max-height 30)
 '(lsp-ui-doc-max-width 150)
 '(lsp-ui-doc-position (quote top))
 '(lsp-ui-doc-use-childframe t)
 '(lsp-ui-doc-use-webkit t t)
 '(lsp-ui-flycheck-enable nil t)
 '(lsp-ui-imenu-enable nil)
 '(lsp-ui-imenu-kind-position (quote top))
 '(lsp-ui-peek-enable t)
 '(lsp-ui-peek-fontify (quote on-demand))
 '(lsp-ui-peek-list-width 50)
 '(lsp-ui-peek-peek-height 20)
 '(lsp-ui-sideline-enable nil)
 '(neo-theme (quote nerd2) t)
 '(package-selected-packages
   (quote
    (hiwin posframe git-gutter-fringe git-gutter magit py-autopep8 counsel-projectile projectile hide-mode-line neotree yaml-mode go-eldoc company-go go-mode company-box counsel company-quickhelp ivy recentf-ext python-mode flycheck lsp-ui company-lsp lsp-mode doom-modeline doom-themes tabbar use-package)))
 '(show-paren-mode t))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(linum ((t (:inherit (shadow default) :background "#20232a" :foreground "gray65" :strike-through nil :underline nil :slant normal :weight normal)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:added ((t (:background "#50fa7b"))))
 '(git-gutter:deleted ((t (:background "#ff79c6"))))
 '(git-gutter:modified ((t (:background "#f1fa8c"))))
 '(linum ((t (:inherit (shadow default) :background "#20232a" :foreground "gray65" :strike-through nil :underline nil :slant normal :weight normal)))))
