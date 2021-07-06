(use-package rust-mode
  :config
  (add-hook 'rust-mode-hook 'flycheck-mode)
  (add-hook 'rust-mode-hook #'lsp)
  )
