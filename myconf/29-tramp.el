;; when use tramp, disable projectile
(use-package tramp
  :config
  (setq tramp-default-method "ftp")
  (setq tramp-verbose 6)
  (setq tramp-auto-save-directory "/tmp")
  (defadvice projectile-project-root (around ignore-remote first activate)
  (unless (file-remote-p default-directory) ad-do-it))
  )


