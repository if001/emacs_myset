

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

;; use-packageで自動インストール
(setq use-package-always-ensure t)
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
 '(company-lsp-async t)
 '(company-lsp-cache-candidates t)
 '(company-lsp-enable-recompletion nil)
 '(git-gutter:added-sign "+")
 '(git-gutter:deleted-sign "-")
 '(git-gutter:modified-sign "~")
 '(inhibit-startup-screen t)
 '(lsp-auto-guess-root t)
 '(lsp-document-sync-method (quote incremental))
 '(lsp-enable-snippet nil)
 '(lsp-log-io t)
 '(lsp-prefer-flymake (quote flymake))
 '(lsp-print-io t)
 '(lsp-print-performance nil)
 '(lsp-response-timeout 20)
 '(lsp-trace nil t)
 '(lsp-ui-doc-delay 0.2 t)
 '(lsp-ui-doc-enable t t)
 '(lsp-ui-doc-header t t)
 '(lsp-ui-doc-include-signature t t)
 '(lsp-ui-doc-max-height 30 t)
 '(lsp-ui-doc-max-width 150 t)
 '(lsp-ui-doc-position (quote top) t)
 '(lsp-ui-doc-use-childframe t t)
 '(lsp-ui-doc-use-webkit t t)
 '(lsp-ui-flycheck-enable nil t)
 '(lsp-ui-imenu-enable nil t)
 '(lsp-ui-imenu-kind-position (quote top) t)
 '(lsp-ui-peek-enable t t)
 '(lsp-ui-peek-fontify (quote on-demand) t)
 '(lsp-ui-peek-list-width 50 t)
 '(lsp-ui-peek-peek-height 20 t)
 '(lsp-ui-sideline-enable nil t)
 '(neo-theme (quote nerd2) t)
 '(package-selected-packages
   (quote
    (doom-themes use-package treepy spinner recentf-ext pos-tip popup pkg-info magit-popup hiwin graphql fringe-helper f company-box bind-key)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:added ((t (:background "#50fa7b"))))
 '(git-gutter:deleted ((t (:background "#ff79c6"))))
 '(git-gutter:modified ((t (:background "#f1fa8c"))))
 '(linum ((t (:inherit (shadow default) :background "#20232a" :foreground "gray65" :strike-through nil :underline nil :slant normal :weight normal)))))
