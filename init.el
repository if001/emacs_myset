
;;-------------------------------------------------------------------------;;
;;  -*- coding: utf-8-unix -*-
;;-------------------------------------------------------------------------;;

;; C-x C-e でinit.elの設定反映(ショートカットC-f12)
;; M-x load-file RET ~/.emacs.d/init.el
;; で設定ファイルの再読み込み

;; バイトコンパイル(*.el → *.elc)は
;; M-x byte-compile-file RET



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
;; .emacs.dからの相対パスで記述
(add-to-load-path "elpa/"
		  "site-lisp/")
;;-------------------------------------------------------------------------;;


;;-------------------------------------------------------------------------;;
;; init-loaderの設定
;; 設定ファイルを分割して読み込む
(require 'init-loader)
(init-loader-load "~/.emacs.d/myconf")
;;-------------------------------------------------------------------------;;



;;-------------------------------------------------------------------------;;
;; package 設定
(require 'package)

;; HTTPS 系のリポジトリ
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)

;; HTTP 系のリポジトリ
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)

;; marmalade　は HTTP アクセスすると証明書エラーでフリーズするので注意
;; (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)
;;-------------------------------------------------------------------------;;
