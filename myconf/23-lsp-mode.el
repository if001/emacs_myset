;;; 23-lsp-mode.el --- LSP settings:

;;; Commentary:

;; Code:
(use-package lsp-mode
  :ensure t
  :custom
  ;; debug mode
  (lsp-print-io t)
  (lsp-trace nil)
  (lsp-print-performance nil)
  ;; (lsp-prefer-flymake 'flymake)
  (lsp-prefer-flymake nil)
  (lsp-auto-guess-root t)
  (lsp-document-sync-method 'incremental) ;; always send incremental document
  (lsp-response-timeout 20)
  (lsp-enable-snippet nil)
  (lsp-enable-symbol-highlighting nil)
  (lsp-prefer-capf t)
  (lsp-headerline-breadcrumb-enable nil)

  (lsp-signature-activate nil)
  (lsp-signature-render-documentation nil)
  (lsp-signature-doc-lines 1)
  (lsp-eldoc-enable-hover t)
  
  :hook
  (lsp-mode . lsp-ui-mode)
  ;; golangのサーバー設定
  ;; (lsp-go-language-server-flags '("-logfile=~/.go/src/github.com/saibing/bingo/log/"))
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-document-sync-method lsp--sync-incremental) ;; 'inclemental を指定してはいけない
  )

;;(setq lsp-print-io t)

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :custom
  ;; lsp-ui-doc
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'top) ;; top, bottom, or at-point
  ;; (lsp-ui-doc-position 'at-point) ;; top, bottom, or at-point
  (lsp-ui-doc-max-width 150)
  (lsp-ui-doc-max-height 30)
  (lsp-ui-doc-use-childframe t)
  (lsp-ui-doc-use-webkit nil)
  (lsp-ui-doc-delay 0.2)
  
  ;; lsp-ui-flycheck
  (lsp-ui-flycheck-enable t)
  ;;(lsp-ui-flycheck-list-position 'right)

  ;; lsp-ui-sideline
  (lsp-ui-sideline-enable nil)
  ;; (lsp-ui-sideline-ignore-duplicate t)
  ;; (lsp-ui-sideline-show-symbol t)
  ;; (lsp-ui-sideline-show-hover t)
  ;; (lsp-ui-sideline-show-diagnostics nil)
  ;; (lsp-ui-sideline-show-code-actions nil)
  
  ;; lsp-ui-peek
  (lsp-ui-peek-enable t)
  (lsp-ui-peek-peek-height 20)
  (lsp-ui-peek-list-width 50)
  (lsp-ui-peek-fontify 'on-demand) ;; never, on-demand, or always
  
  ;; lsp-ui-imenu
  (lsp-ui-imenu-enable nil)
  (lsp-ui-imenu-kind-position 'top)
  
  :commands lsp-ui-mode
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  ;; (eval-after-load "flymake"
  ;;   (setq flymake-fringe-indicator-position nil)
  ;;   )
  ;; (use-package posframe)
  ;; (use-package flymake-posframe
  ;;   :ensure nil
  ;;   :hook (flymake-mode . flymake-posframe-mode)
  ;;   ;; :config
  ;;   ;; (set-face-attribute 'flymake-posframe-background-face nil :background "#20232a")
  ;;   ;; (set-face-attribute 'flymake-posframe-foreground-face nil :foreground "gray65")
  ;;   )
  )

