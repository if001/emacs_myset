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

(use-package treesit-auto
  :ensure t
  :config
  (setq treesit-auto-install nil) ;; 自動インストール
  (global-treesit-auto-mode))
