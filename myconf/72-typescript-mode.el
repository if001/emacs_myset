
;; TypeScript(tsx含む)の設定

;; (use-package typescript-mode
;;   :ensure nil
;;   :mode 
;;   (("\\.ts\\'" . typescript-mode)
;;    ("\\.tsx\\'" . tsx-ts-mode))
;;   )

(use-package typescript-ts-mode
  :after (tree-sitter tree-sitter-langs) ; 依存関係を明示
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode))
  :init
  ;; typescript-mode からツリーシッターモードへ置き換え
  (add-to-list 'major-mode-remap-alist
               '(typescript-mode . typescript-ts-mode))
  :config
  (add-hook 'tsx-ts-mode-hook #'tree-sitter-hl-mode) ; Tree-sitterハイライトを有効化
  ;; (add-hook 'tsx-ts-mode-hook #'tide-setup)
  ;; (add-hook 'tsx-ts-mode-hook #'flycheck-mode)       ; Flycheckを有効化
  ;; (add-hook 'tsx-ts-mode-hook #'prettier-js-mode)    ; Prettier-jsを有効化
  ;; (use-package pfuture
  ;;   :ensure nil
  ;;   :load-path "site-lisp/pfuture/"
  ;;   )  
  ;; (use-package flymake-jsts
  ;;   :after pfuture
  ;;   :ensure nil
  ;;   :load-path "site-lisp/flymake-jsts/"
  ;;   )
  )


;; lspと衝突するため無効化
;; (use-package tide
;;   :hook ((typescript-ts-mode . tide-setup)
;;          (tsx-ts-mode        . tide-setup))
;;   :after (typescript-ts-mode)
;;   :config
;;   (defun setup-tide-mode ()
;;     (interactive)
;;     (tide-setup)    
;;     (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;     (eldoc-mode +1)
;;     (tide-hl-identifier-mode +1)
;;     ;; (flycheck-mode +1)
;;     ;; (company-mode +1)
;;     )
;;   (setq company-tooltip-align-annotations t)
;;   )


;; ----------------------------------- ;;
;; (use-package treesit-fold
;;   :ensure nil
;;   :load-path "site-lisp/treesit-fold/"
;;   )
;; (use-package css-in-js-mode
;;   :ensure nil
;;   :load-path "site-lisp/tree-sitter-css-in-js/"
;;   )
;; (use-package tsx-mode
;;   :after (treesit-fold css-in-js-mode)
;;   :ensure nil
;;   :load-path "site-lisp/tsx-mode.el/"
;;   :mode ("\\.tsx\\'" . tsx-mode)
;;   :defer t
;;   :custom
;;   (tsx-mode-enable-css-in-js t)
;;   ;;:hook (tsx-mode . flycheck-mode)
;;   :hook (tsx-mode . flymake-mode)
;;   )
;; (use-package flymake-eslint
;;   :ensure nil
;;   :load-path "site-lisp/flymake-eslint/"
;;   )

(message "loaded 72-typescript-mode")
