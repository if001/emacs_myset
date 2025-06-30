;; flymake

(use-package flymake
  :hook (prog-mode . flymake-mode)
  :config
  (setq flymake-no-changes-timeout 0.5))
