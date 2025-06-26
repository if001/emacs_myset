;;; 22-magit

;;; Commentary:

;;; Code:

(use-package magit)

;; ;; magitのdiffを見やすく
;; (use-package magit-delta
;;   :after magit
;;   :hook (magit-mode-hook)
;;   :custom
;;   (magit-delta-delta-args '("--side-by-side" "--line-numbers")) ;; side-by-sideで見れない;;
;;   )

;; (global-set-key (kbd "C-x g") 'magit-status)
(use-package git-gutter-fringe
  :custom-face
  (git-gutter:modified . '((t (:background "#f1fa8c"))))
  (git-gutter:added    . '((t (:background "#50fa7b"))))
  (git-gutter:deleted  . '((t (:background "#ff79c6"))))
  :config
  (global-git-gutter-mode +1)
  (setq git-gutter:modified-sign "~")
  (setq git-gutter:added-sign    "+")
  (setq git-gutter:deleted-sign  "-")
  :bind
  ("C-x g" . magit-status)
  )

;; コミットされていない箇所をウィンドウの左側に強調表示 (magitのgutterと被るかも)
(use-package diff-hl
  :hook ((magit-pre-refresh . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh)
         (dired-mode . diff-hl-dired-mode))
  :init
  (global-diff-hl-mode +1)
  (global-diff-hl-show-hunk-mouse-mode +1)
  (diff-hl-margin-mode +1))
