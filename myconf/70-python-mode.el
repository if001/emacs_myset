(use-package python-mode
  :config
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'python-mode-hook #'lsp)
  (flymake-mode) ;; <- This line makes the trick of disabling flymake in python mode!
  (use-package py-autopep8
    :hook
    (python-mode . py-autopep8-enable-on-save)
    )  
  ;; (use-package flycheck-mode
  ;;   :after python-mode
  ;;   :hook
  ;;   (python-mode-hook . 'flycheck-mode)
  ;;   )
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

(defun py-help-at-point nil) ;; helpが別bufferで出てきて邪魔なので消す
