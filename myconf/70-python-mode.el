
;;; 70-python.el --- Python settings:

;;; Commentary:
;; flymakeのcheckように入れておく pip install --upgrade pyflakes
;; ruffは一旦スキップ
;; pip install ruff
;; ruffでformateやlintを利用する。以下は不要
;; Code:


;; python-mode の設定
;; use-packageを使うとeglotが多重起動される
;; Tree-sitterを使ったpython-ts-modeを明示的に使用
;; (setq major-mode-remap-alist
;;       (assq-delete-all 'python-mode major-mode-remap-alist))
(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)))
;; .pyファイルをpython-mode（→ python-ts-mode）にマッピング
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-ts-mode))
;; (add-hook 'python-ts-mode-hook #'eglot-ensure)

;; tree-sitter grammarのインストール（初回のみ）
(when (treesit-available-p)
  (unless (treesit-language-available-p 'python)
    (treesit-install-language-grammar 'python)))

(setq indent-tabs-mode nil)
(setq indent-level 4)
(setq python-indent 4)

;; ruffでのformatはreformmerに任せる
;; (use-package flymake-ruff
;;   :ensure t
;;   :hook (python-mode . flymake-ruff-load))
;; (use-package ruff-format
;;   :ensure t
;;   :config
;;   (add-hook 'python-mode-hook 'ruff-format-on-save-mode)
;;   )

;; (use-package python-ts-mode
;;   :defer t
;;   :ensure nil
;;   :mode "\\.py\\'"
;;   :hook
;;   (python-ts-mode . eglot-ensure-safe)
;;   :config
;;   ;;(treesit-install-language-grammar 'python) ;; Python用のTree-sitter文法をインストール
;;   (setq indent-tabs-mode nil)
;;   (setq indent-level 4)
;;   (setq python-indent 4)
;;   )

;; 汎用的なTree-sitterの設定（必要に応じて）
;; (use-package treesit
;;   :config
;;   ;; Treesitが自動で文法をインストールするように設定することも可能ですが、
;;   ;; 上記のように明示的に treesit-install-language-grammar を実行する方が確実です。
;;   ;; (setq treesit-auto-install t)
;;   )

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
