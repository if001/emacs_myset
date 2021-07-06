(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  :hook
  (js-mode . (lambda ()
	       (setq flycheck-checker 'jsonlint)
	       (flycheck-mode 1)))
  :config
  (add-hook 'sh-mode-hook 'flycheck-mode)
  ;; (add-to-list 'flycheck-checkers 'jsonlint)
  ;; (flycheck-define-checker jsonlint
  ;;     :command ("jsonlint" source-inplace)
  ;;     :error-patterns
  ;;     ((warning line-start (file-name) ":" line ":" column ": "
  ;;      	      (id (one-or-more (not (any " "))))
  ;;     	      (message (one-or-more not-newline)
  ;;     		       (zero-or-more "\n" (any " ") (one-or-more not-newline)))
  ;;     	      line-end))
  ;;     :modes (js-mode))
)

(flymake-mode nil)
(remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)
;;; 28-flycheck.el ends here

