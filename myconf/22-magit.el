;;; 00-lang.el --- Font settings:

;;; Commentary:

;;; Code:

;; (global-set-key (kbd "C-x g") 'magit-status)

(use-package git-gutter-fringe
  :ensure t
  :custom
  (git-gutter:modified-sign "~")
  (git-gutter:added-sign    "+")
  (git-gutter:deleted-sign  "-")
  :custom-face
  (git-gutter:modified ((t (:background "#f1fa8c"))))
  (git-gutter:added    ((t (:background "#50fa7b"))))
  (git-gutter:deleted  ((t (:background "#ff79c6"))))
  :config
  (global-git-gutter-mode +1)
  :bind
  ("C-x g" . magit-status)
  )
