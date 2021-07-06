;;; 31-org.el --- org-mode settings:

;;; Commentary:

;;; Code:
(defvar org-dir "/home/issei/Dropbox/org/")
(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
	(switch-to-buffer buffer)
	(message "%s" file))
    (find-file (concat org-dir file))))



(use-package org
  :ensure t
  :custom
  (org-support-shift-select 'always)
  :config
  (when (file-directory-p org-dir)
    (setq org-directory org-dir)
    ;; (setq org-capture-templates
    ;; 	  '(("n" "Note" entry (file+headline (concatenate 'string  org-dir "/notes.org") "Notes")
    ;; 	     "* %?\nEntered on %U\n %i\n %a")
    ;; 	    ))
    (setq org-capture-templates
	  '(
	    ("n" "Note" entry (file+headline "templates/template.org" "note1") "* %?\nEntered on %U\n %i\n %a")
	    ("b" "Note2" entry (file+headline "templates/template.org" "note2") "* %?\nEntered on %U\n %i\n %a")
	    )
	  )
    )
  :bind
  (
   ("C-c C-9" . (lambda () (interactive) (show-org-buffer "notes.org")))
   ("C-c c" . org-capture)
   )
  )

;;; 31-org.el ends here
