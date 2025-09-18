;;; 09-tramp.el --- tramp setting
;;; Commentary:
;;
;;; Code:

;; ssh先でのlspのpathを通す
(with-eval-after-load 'tramp
  (add-to-list 'tramp-remote-path "/home/issei.fujimoto/go/bin")
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path))

(message "loaded 09-tramp.el")
;;; 09-tramp.el ends here
