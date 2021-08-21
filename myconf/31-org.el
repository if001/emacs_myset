;;; 31-org.el --- org-mode settings:

;;; Commentary:

;;; Code:
(cond
 ((string-match "ac211.local" (system-name))
  (defvar org-dir "/Users/ac211/prog/org/")
  )
 ((string-match "issei-All-Series" (system-name))
  (defvar org-dir "/home/issei/Dropbox/org/")
  )
 (nil (defvar org-dir "~/org/"))
 )


;; dirの存在チェックのためdirとfileをわけてるけど、いい感じにしたい
(defvar default-dir "notes/")
(defvar default-note "notes.org")
(defvar default-note-path (concat default-dir default-note))
(defvar default-note-full-path (concat org-dir default-note-path))

(defvar coursera-dir "coursera/")
(defvar coursera-note "coursera.org")
(defvar coursera-note-path (concat coursera-dir coursera-note))
(defvar coursera-note-full-path (concat org-dir coursera-note-path))

(defvar blog-memo-dir "blog-memo/")
(defvar blog-memo-note "blog-memo.org")
(defvar blog-memo-note-path (concat coursera-dir coursera-note))
(defvar blog-memo-note-full-path (concat org-dir coursera-note-path))

(defvar movie-dir "movie/")
(defvar movie-note "memo.org")
(defvar movie-note-path (concat movie-dir movie-note))
(defvar movie-note-full-path (concat org-dir movie-note-path))


(defun init-dir (file-path)
  "If not exist FILE-PATH, then create."
  (let ((dir (concat org-dir file-path)))
    (when (not (file-exists-p dir))
      (message "init create: %s" dir)
      (mkdir dir)
      )
    )
  )



(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
	(switch-to-buffer buffer)
	(message "org: %s" (concat org-dir file))
	)
    (find-file (concat org-dir file))))

(use-package org
  :ensure t
  :init
  (init-dir default-dir)
  (init-dir coursera-dir)
  :custom
  (org-support-shift-select 'always)
  (org-startup-folded 'content)
  :config
  (use-package org-preview-html
    :bind
    ("M-p" . org-preview-html/preview)
    )
  (when (file-directory-p org-dir)
    (setq org-directory org-dir)
    (setq org-capture-templates
	  '(
	    ("n" "Note" entry (file+headline default-note-full-path "note") "* %?\nEntered on %U\n %i\n %a")
	    ("c" "Coursera" entry (file+headline coursera-note-full-path "coursera") "* %?\nEntered on %U\n %i\n %a")
	    ("b" "Blog-memo" entry (file+headline coursera-note-full-path "blog-memo") "* %?\nEntered on %U\n %i\n %a")
	    ("m" "Movie-memo" entry (file+headline movie-note-full-path "movie") "* %?\nEntered on %U\n %i\n %a")
	    )
	  )
    )
  :bind
  (
   ("C-c C-9" . (lambda() (interactive) (show-org-buffer default-note-path)))
   ("C-c C-0" . (lambda() (interactive) (show-org-buffer coursera-note-path)))
   ("C-c C-8" . (lambda() (interactive) (show-org-buffer blog-memo-note-path)))
   ("C-c C-7" . (lambda() (interactive) (show-org-buffer movie-note-path)))
   ("C-c c" . org-capture)
   ("M-." . org-open-at-point)
   )
  )

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode))

;;; 31-org.el ends here
