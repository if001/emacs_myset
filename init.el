
;;; init.el --- init:

;;; Commentary:
;; C-x C-e でinit.elの設定反映(ショートカットC-f12)
;; M-x load-file RET ~/.emacs.d/init.el
;; で設定ファイルの再読み込み

;; バイトコンパイル(*.el → *.elc)は
;; M-x byte-compile-file RET

;;-------------------------------------------------------------------------;;
;;  -*- coding: utf-8-unix -*-
;;-------------------------------------------------------------------------;;


;;; Code:
(require 'profiler)
;; (profiler-start 'cpu)

;; デフォルトでensure t
(setq use-package-always-ensure t)
  
;; load api key
(let ((secrets-file (expand-file-name "secrets.el" user-emacs-directory)))
  (when (file-exists-p secrets-file)
    (load-file secrets-file)))

(add-to-list 'load-path (expand-file-name "site-lisp/init-loader/" user-emacs-directory))
(require 'init-loader)
(setq init-loader-byte-compile t)
(init-loader-load "~/.emacs.d/myconf/")


(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
