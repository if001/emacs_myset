(use-package python-mode
  :config
  ;; (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'python-mode-hook #'lsp)
 
  (use-package py-autopep8
    :hook
    (python-mode . py-autopep8-enable-on-save)
    :config
    (add-hook 'before-save-hook 'py-autopep8-before-save)
    )  
  )

; ;; --------------------------------------------------------------
;; googleの教えに従ったインデント幅
(add-hook 'python-mode-hook
	  '(lambda()
	     (setq indent-tabs-mode nil)
	     (setq indent-level 4)
	     (setq python-indent 4)))
;; ;; --------------------------------------------------------------

;; (setq global-auto-complete-mode -1)  ;;acを起動させない
;; (global-auto-complete-mode -1)  ;;acを起動させない
;; (setq auto-complete-mode -1) ;;acを起動させない
;; (auto-complete-mode -1) ;;acを起動させない
;; (setq auto-complete -1) ;;acを起動させない
;; (auto-complete -1) ;;acを起動させない

