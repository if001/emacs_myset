(use-package go-ts-mode
  :mode
  (("\\.go$" . go-mode)
   ("/go\\.mod\\'" . go-mod-ts-mode))
  ;; formatはreformatterで行う
  ;; :config
  ;; (setq gofmt-command "goimports")
  ;; (add-hook 'go-mode-hook
  ;;           (lambda ()
  ;;             (add-hook 'before-save-hook #'gofmt-before-save nil t)))
  )
