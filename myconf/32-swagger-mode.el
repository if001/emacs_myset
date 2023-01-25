;;; 32-swagger-mode.el --- LSP settings:

;;; Commentary:

;; Code:

(require 'swagger-mode)

;;;

(defun join (sep str-list)
  (cond ((null str-list) "")
	(t (join-str sep str-list ""))))

(defun join-str (sep str-list result)
  (cond ((null str-list) result)
	(t (join-str sep (cdr str-list)
		     (cond ((string= result "") (car str-list))
			   (t (concatenate 'string result sep (car str-list))))))))


(defun swagger-my-preview ()
  (interactive)
  (when (require 'swagger-mode nil t)
    (let* ((swagger-out-preview-path-name
	    (let* ((file-path
		    (let* ((splited (split-string buffer-file-name "/")))
		      (remove (elt (reverse splited) 0) splited)
		      )
		    ))
	      (join "/" file-path)
	      )
	    ))
      (let* ((ret (swagger--compile (buffer-file-name)
                                    swagger-preview-lang
                                    "./"))
             (file_url (concat "file://" swagger-out-preview-path-name "/index.html"))
	     )
	(if (eq ret 0)
            (browse-url file_url))
	)
      )
    )
  )

(defun swagger-open-bwowse ()
  (interactive)
  (when (require 'swagger-mode nil t)
    (browse-url "/Users/ac211/prog/gdci/gdc-api-definition/gdci/index.html")
    )
  )


(add-hook 'yaml-mode-hook 'swagger-mode)
;; (add-hook 'swagger-mode-hook 'set-swagger-preview-path)

;; (setq swagger-out-preview-path get-swagger-preview-path)


;;; 32-swagger-mode.el ends here
