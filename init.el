
;;-------------------------------------------------------------------------;;
;;  -*- coding: utf-8-unix -*-
;;-------------------------------------------------------------------------;;

;; C-x C-e でinit.elの設定反映(ショートカットC-f12)
;; M-x load-file RET ~/.emacs.d/init.el
;; で設定ファイルの再読み込み

;; バイトコンパイル(*.el → *.elc)は
;; M-x byte-compile-file RET


;; package 設定
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
;;-------------------------------------------------------------------------;;


;;-------------------------------------------------------------------------;;
;; load-pathの追加関数
;; emacs-lispのファイルを読み込むパスを設定

;; load-pathで指定したディレクトリのサブディレクトリもload-pathに追加する設定
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; load-pathに追加するフォルダ
(add-to-list 'load-path
	     "~/.emacs.d/elisp/"
	     "~/.emacs.d/elpa/"
	     "~/.emacs.d/site-lisp/"
	     "~/.emacs.d/site-lisp/color-theme")
;;-------------------------------------------------------------------------;;


;;-------------------------------------------------------------------------;;
;; init-loaderの設定
;; 設定ファイルを分割して読み込む
(require 'init-loader)
(init-loader-load "~/.emacs.d/myconf")
;;-------------------------------------------------------------------------;;



