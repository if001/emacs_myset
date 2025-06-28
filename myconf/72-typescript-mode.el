;; TypeScript(tsx含む)の設定

;; (use-package typescript-mode
;;   :ensure nil
;;   :mode 
;;   (("\\.ts\\'" . typescript-mode)
;;    ("\\.tsx\\'" . tsx-ts-mode))
;;   )

(use-package tsx-ts-mode
  :ensure nil
  :mode (("\\.ts[x]?\\'" . tsx-ts-mode)
         ("\\.[m]ts\\'" . tsx-ts-mode)
         ("\\.js[x]?\\'" . tsx-ts-mode)
         ("\\.[mc]js\\'" . tsx-ts-mode)))


(use-package tide
  :hook (tsx-ts-mode . setup-tide-mode)
  :config
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    ;; (company-mode +1)
    )
  (setq company-tooltip-align-annotations t))
