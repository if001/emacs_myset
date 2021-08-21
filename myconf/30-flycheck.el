(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  ;; :hook
  ;; (prog-mode . (lambda () (setq flycheck-checker 'jsonlint)))
  :config
  (flycheck-define-checker css-csslint
    "See URL `https://github.com/CSSLint/csslint'."
    :command ("csslint" "--format=checkstyle-xml" "--warnings=import" "--errors=important" source)
    :error-parser flycheck-parse-checkstyle
    :error-filter flycheck-dequalify-error-ids
    :modes css-mode
    )
  ;; (add-to-list 'flycheck-checkers 'jsonlint)
  ;; (flycheck-define-checker jsonlint
  ;;     :command ("jsonlint" source-inplace)
  ;;     :error-patterns
  ;;     ((warning line-start (file-name) ":" line ":" column ": "
  ;;      	      (id (one-or-more (not (any " "))))
  ;;     	      (message (one-or-more not-newline)
  ;;     		       (zero-or-more "\n" (any " ") (one-or-more not-newline)))
  ;;     	      line-end))
  ;;     :modes (js-mode json-mode))
)

(flymake-mode nil)
(remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)
;;; 28-flycheck.el ends here

