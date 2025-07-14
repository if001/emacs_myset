;;; 03-tab.el --- Tab settings:

;;; Commentary:
;; 一旦自動インストールはoff, shなどはbashとしてinstallしなければならないが自動でshをinstallしようとする
;; 対応言語は以下を確認
;; https://github.com/emacs-tree-sitter/tree-sitter-langs/tree/master/repos

;;; Code:

(use-package treesit
  :ensure nil
  :config
  (setq treesit-font-lock-level 4)
  )


(use-package tree-sitter
  :hook ((tsx-ts-mode . tree-sitter-mode)
         (tree-sitter-after-on . tree-sitter-hl-mode))
  :config
  (add-to-list 'tree-sitter-major-mode-language-alist
               '(tsx-ts-mode . tsx))
  )

(use-package tree-sitter-langs
  :after tree-sitter)

(use-package treesit-auto
  :config
  ;; (setq treesit-auto-install 'prompt) ;; 自動インストール
  (setq treesit-auto-install nil)
  (global-treesit-auto-mode)
  (treesit-auto-add-to-auto-mode-alist '(typescript tsx))
  )


;; (setq treesit-language-source-alist
;;       '((javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "v0.23.1"))))

(setq treesit-language-source-alist
      '((json "https://github.com/tree-sitter/tree-sitter-json")
	(markdown "https://github.com/ikatyang/tree-sitter-markdown")
	(make "https://github.com/alemuller/tree-sitter-make")
	(yaml . ("https://github.com/ikatyang/tree-sitter-yaml" "v0.5.0"))
	(toml "https://github.com/tree-sitter/tree-sitter-toml")
	(bash "https://github.com/tree-sitter/tree-sitter-bash")
	(html . ("https://github.com/tree-sitter/tree-sitter-html" "v0.20.1"))
	(javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "v0.23.1"))
	(css . ("https://github.com/tree-sitter/tree-sitter-css" "v0.20.0"))
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
        (python "https://github.com/tree-sitter/tree-sitter-python")
	(elixir . ("https://github.com/elixir-lang/tree-sitter-elixir" "v0.3.4"))
	(heex . ("https://github.com/phoenixframework/tree-sitter-heex" "v0.8.0"))
        ))

;; (provide "26-treesit.el")
;;; 26-treesit.el ends here
