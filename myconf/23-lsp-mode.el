(use-package lsp-mode
  :custom
  (lsp-print-io t) ;; debug mode
  (lsp-prefer-flymake 'flymake)
  (lsp-auto-guess-root t)
  (lsp-document-sync-method 'incremental) ;; always send incremental document
  (lsp-response-timeout 5)
  (lsp-enable-snippet nil)
  ;; golangのサーバー設定
  ;; (lsp-go-language-server-flags '("-logfile=~/.go/src/github.com/saibing/bingo/log/"))
  :commands lsp)

;;(setq lsp-print-io t)

(use-package lsp-ui
  :custom
  ;; lsp-ui-doc
  (lsp-ui-doc-enable nil)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  ;; (lsp-ui-doc-position 'top) ;; top, bottom, or at-point
  (lsp-ui-doc-position 'at-point) ;; top, bottom, or at-point
  (lsp-ui-doc-max-width 150)
  (lsp-ui-doc-max-height 30)
  (lsp-ui-doc-use-childframe t)
  (lsp-ui-doc-use-webkit t)
  
  ;; lsp-ui-flycheck
  (lsp-ui-flycheck-enable nil)
  ;;(lsp-ui-flycheck-list-position 'right)

  ;; lsp-ui-peek
  (lsp-ui-peek-enable t)
  (lsp-ui-peek-peek-height 20)
  (lsp-ui-peek-list-width 50)
  (lsp-ui-peek-fontify 'on-demand) ;; never, on-demand, or always
  ;; lsp-ui-imenu
  (lsp-ui-imenu-enable nil)
  (lsp-ui-imenu-kind-position 'top)
  ;; lsp-ui-sideline
  (lsp-ui-sideline-enable nil)
  ;; ;; :preface
  ;; (defun ladicle/toggle-lsp-ui-doc ()
  ;;   (interactive)
  ;;   (if lsp-ui-doc-mode
  ;;       (progn
  ;;         (lsp-ui-doc-mode -1)
  ;;         (lsp-ui-doc--hide-frame))
  ;;     (lsp-ui-doc-mode 1)))
  :commands lsp-ui-mode
  :config
  (require 'lsp-clients)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (eval-after-load "flymake"
    (setq flymake-fringe-indicator-position nil)
    )
  (use-package posframe)
  (use-package flymake-posframe
    :hook (flymake-mode . flymake-posframe-mode)
    ;; :config
    ;; (set-face-attribute 'flymake-posframe-background-face nil :background "#20232a")
    ;; (set-face-attribute 'flymake-posframe-foreground-face nil :foreground "gray65")
    )
  )

(require 'company-lsp)
(push 'company-lsp company-backends)

;;(flymake-mode nil)
