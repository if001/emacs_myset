
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
  
;; load api key
(let ((secrets-file (expand-file-name "secrets.el" user-emacs-directory)))
  (when (file-exists-p secrets-file)
    (load-file secrets-file)))

;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; オプションなしで自動的にuse-packageをstraight.elにフォールバックする
(setq straight-use-package-by-default t)
;; install use-package
(straight-use-package 'use-package)
(require 'use-package)

;; デフォルトでensure t
;; (setq use-package-always-ensure t)

(add-to-list 'load-path (expand-file-name "site-lisp/init-loader/" user-emacs-directory))
(require 'init-loader)
;; (setq init-loader-byte-compile t)
(init-loader-load "~/.emacs.d/myconf/")

(provide 'init)
;;; init.el ends here
