;; expand region
;; 定期的に更新があるのでgitをみとくとよい
;; https://github.com/magnars/expand-region.el

(add-to-list 'load-path "~/.emacs.d/site-lisp/expand-region.el")
(require 'expand-region)
; (use-package expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-M-@") 'er/contract-region) ;; リージョンを狭める

;; transient-mark-modeが nilでは動作しませんので注意
(transient-mark-mode t)
