;;; 03-tab.el --- Tab settings:

;;; Commentary:
;; 一旦自動インストールはoff, shなどはbashとしてinstallしなければならないが自動でshをinstallしようとする
;; 対応言語は以下を確認
;; https://github.com/emacs-tree-sitter/tree-sitter-langs/tree/master/repos

;;; Code:


(use-package treesit
  :ensure nil
  :config
  (setq treesit-font-lock-level 4))

(use-package tree-sitter
  :hook (
	 (typescript-ts-mode . tree-sitter-hl-mode)
         (tsx-ts-mode . tree-sitter-hl-mode)
	 )
  :config
  (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :after tree-sitter
  :config
  (tree-sitter-require 'tsx)
  (add-to-list 'tree-sitter-major-mode-language-alist '(tsx-ts-mode . tsx))
  )


(use-package treesit-auto
  :ensure t
  :config
  (setq treesit-auto-install nil) ;; 自動インストール
  (global-treesit-auto-mode))
