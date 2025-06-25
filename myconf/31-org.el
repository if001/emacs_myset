;;; 31-org.el --- Org settings:

;;; Commentary:

;; Code:
(use-package org
  :init
  (setq org-return-follows-link t  ; Returnキーでリンク先を開く
        org-mouse-1-follows-link t ; マウスクリックでリンク先を開く
        )
  ;; TODOキーワード設定
  (setq org-todo-keywords
	'((sequence "TODO(t)" "DOIN(i)" "WAIT(w)" "|" "DONE(d)")))
  (setq org-todo-keyword-faces
	'(
	  ("WAIT"  . (:foreground "CadetBlue3"      :weight bold))
	  ("TODO"  . (:foreground "LightGoldenrod3" :weight bold))
	  ))
  ;; DONEステータス時の見出しの色を変えない
  (setq org-fontify-done-headline nil)
  )

;; アンダースコアを入力しても下付き文字にならないようにする
(setq org-use-sub-superscripts '{}
      org-export-with-sub-superscripts nil)


;; org-indent-mode
;; インデント機能を有効にしています。
(use-package org-indent
  :ensure nil
  :hook (org-mode . org-indent-mode))


;; org用のシンプルなメモ取りツール
(use-package denote
  :init
  (with-eval-after-load 'org
    (setq denote-directory org-directory))

  :config
  (with-eval-after-load 'meow
    (meow-leader-define-key
     '("d" . denote-open-or-create)))

  ;; (add-hook 'find-file-hook #'denote-link-buttonize-buffer)
  (add-hook 'dired-mode-hook #'denote-dired-mode-in-directories)
  (add-hook 'context-menu-functions #'denote-context-menu)

  (denote-rename-buffer-mode +1))

;; org-mode用のtheme
(use-package org-modern
  :config
  
  (setopt
   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t

   ;; Agenda styling
   org-agenda-tags-column 0
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "◀── now ─────────────────────────────────────────────────")

  ;; Ellipsis styling
  (setopt org-ellipsis "…")
  (set-face-attribute 'org-ellipsis nil :inherit 'default :box nil)

  (global-org-modern-mode))

(message "load 31-org.el")
