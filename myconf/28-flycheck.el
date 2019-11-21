(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  )

(flymake-mode nil)
(remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)
;;; 28-flycheck.el ends here

