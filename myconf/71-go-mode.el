;; Goのパスを通す
(add-to-list 'exec-path (expand-file-name "/usr/local/bin/go"))
;; go get で入れたツールのパスを通す
(add-to-list 'exec-path (expand-file-name "/Users/issei/.go/bin"))
(add-to-list 'exec-path (expand-file-name "/Users/issei/prog/go_lang/src/"))


;; gofmt適応
(use-package go-mode
  :commands go-mode
  :init
  (bind-key "C-c i" 'gofmt-before-save)
  :config
  (add-hook 'go-mode-hook #'lsp)
  (add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  ;; (add-hook 'before-save-hook 'lsp-format-buffer)
  )

