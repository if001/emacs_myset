;; Goのパスを通す
;; (add-to-list 'exec-path (expand-file-name "/usr/local/bin/go"))
;; (add-to-list 'exec-path (expand-file-name "/usr/local/bin/go"))
;; (add-to-list 'exec-path (expand-file-name "~/.goenv/versions/1.11.4/bin/go"))

;; go get で入れたツールのパスを通す
;; (add-to-list 'exec-path (expand-file-name "/Users/issei/.go/bin"))
;; (add-to-list 'exec-path (expand-file-name "/Users/issei/prog/go_lang/src/"))
;; (add-to-list 'exec-path (expand-file-name "/Users/ac171/go/bin"))
;; (add-to-list 'exec-path (expand-file-name "/Users/ac171/go"))


;; gofmt適応
(use-package go-mode
  :commands go-mode
  :init
  (bind-key "C-c i" 'gofmt-before-save)
  :config
  (add-hook 'go-mode-hook #'lsp-deferred)
  (add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  ;; (setenv "GO111MODULE" "on")
  ;; (add-hook 'before-save-hook 'lsp-format-buffer)
  )

