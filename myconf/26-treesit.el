;; (use-package treesit
;;   :config
;;   (setq treesit-font-lock-level 4))

(use-package treesit-auto
  :ensure t
  :config
  (setq treesit-auto-install t)
  (global-treesit-auto-mode))
