;;; 31-org.el --- org-mode settings:

;;; Commentary:

;;; Code:
(when (string-match "ac211.local" (system-name))
  (defvar org-dir "/Users/ac211/prog/org/")
  )

(when (string-match "issei-All-Series" (system-name))
  (defvar org-dir "/home/issei/Dropbox/org/")
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


(defun open-default-notes ()
  "Open notes."
  (interactive)
  (show-org-buffer "notes/notes.org")
  )

(defun open-coursera-notes ()
  "Open notes."
  (interactive)
  (show-org-buffer "coursera/coursera.org")
  )

(use-package org
  :ensure t
  :custom
  (org-support-shift-select 'always)
  (org-startup-folded 'content)
  :config
  (when (file-directory-p org-dir)
    (setq org-directory org-dir)
    ;; (setq org-capture-templates
    ;; 	  '(("n" "Note" entry (file+headline (concatenate 'string  org-dir "/notes.org") "Notes")
    ;; 	     "* %?\nEntered on %U\n %i\n %a")
    ;; 	    ))
    (setq org-capture-templates
	  '(
	    ("n" "Note" entry (file+headline "notes/notes.org" "note1") "* %?\nEntered on %U\n %i\n %a")
	    ("c" "Coursera" entry (file+headline "coursera/coursera.org" "coursera") "* %?\nEntered on %U\n %i\n %a")
	    )
	  )
    )
  :bind
  (
   ("C-c C-9" . open-default-notes)
   ("C-c C-0" . open-coursera-notes)
   ("C-c c" . org-capture)
   )
  )

;;; 31-org.el ends here
