
;;; 70-python.el --- Python settings:

;;; Commentary:

;; Code:

;; python-mode の設定
(use-package python-mode
  :defer t
  :ensure nil
  :hook
  (python-mode . python-ts-mode)
  (python-ts-mode . eglot-ensure)
  :config
  (treesit-install-language-grammar 'python) ;; Python用のTree-sitter文法をインストール
  (setq indent-tabs-mode nil)
  (setq indent-level 4)
  (setq python-indent 4)
  )

;; 汎用的なTree-sitterの設定（必要に応じて）
;; (use-package treesit
;;   :config
;;   ;; Treesitが自動で文法をインストールするように設定することも可能ですが、
;;   ;; 上記のように明示的に treesit-install-language-grammar を実行する方が確実です。
;;   ;; (setq treesit-auto-install t)
;;   )

(use-package pyvenv
  :defer t)


;; (use-package py-autopep8
;;   :hook
;;   (python-ts-mode . py-autopep8-enable-on-save)
;;   )

;; 整形
(use-package python-black
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim))

(message "loaded 70-python-mode")
;; ----- end ----


;; (use-package python-mode
;;   :hook
;;   (python-mode . eglot-ensure)
;;   ;; (python-mode . 'python-ts-mode)

;;   ;; (use-package py-autopep8
;;   ;;   :hook
;;   ;;   (python-mode . py-autopep8-enable-on-save)
;;   ;;   )
;;   )

;; (use-package python-ts-mode
;;   :mode ("\\.py$" . python-ts-mode))

;; (use-package python-ts-mode
;;   :mode ("\\.py\\'" . python-ts-mode)
;;   :hook (python-ts-mode . eglot-ensure) ;; python-ts-mode で Eglot を有効化
;;   :config
;;   ;; python-ts-mode の追加設定があればここに記述
;;   (setq python-ts-mode-indent-offset 4)
;;   )





;; (use-package python-mode
;;   :bind (
;; 	 ("C-<DEL>" . backward-kill-word)
;;    )
;;   :config
;;   (add-hook 'python-mode-hook 'flycheck-mode)
;;   (add-hook 'python-mode-hook #'lsp)
;;   (flymake-mode) ;; <- This line makes the trick of disabling flymake in python mode!
;;   (use-package lsp-jedi
;;     :ensure t
;;     :config
;;     (with-eval-after-load "lsp-mode"
;;       (add-to-list 'lsp-disabled-clients 'pyls)
;;       (add-to-list 'lsp-enabled-clients 'jedi)))
;;   (use-package py-autopep8
;;     :hook
;;     (python-mode . py-autopep8-enable-on-save)
;;     )
;;   ;; (use-package flycheck-mode
;;   ;;   :after python-mode
;;   ;;   :hook
;;   ;;   (python-mode-hook . 'flycheck-mode)
;;   ;;   )
;;   )

;; (use-package lsp-python-ms
;;   :ensure t
;;   :init (setq lsp-python-ms-auto-install-server t)
;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-python-ms)
;;                          (lsp)))
  ;; :config
  ;; (with-eval-after-load "lsp-mode"
  ;;   (add-to-list 'lsp-disabled-clients 'pyls)
  ;;   (add-to-list 'lsp-disabled-clients 'jedi))
;; )

;; ;; googleの教えに従ったインデント幅
;; (add-hook 'python-mode-hook
;; 	  '(lambda()
;; 	     (setq indent-tabs-mode nil)
;; 	     (setq indent-level 4)
;; 	     (setq python-indent 4)))
