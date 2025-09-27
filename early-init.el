;;; early-init.el --- speed ups

;; package.elは使わない（use-package/straight等を使う前提）
(setq package-enable-at-startup nil
      package-quickstart nil)

;; 初期フレームの無駄な再レイアウト抑制
(setq frame-inhibit-implied-resize t
      inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; UI最小化（描画コスト減）
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; 起動中はGCを止める（Doom系の定番）
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024) ; 16MB
                  gc-cons-percentage 0.1)))

;; 起動時だけファイル名ハンドラを無効化（I/O高速化）
(let ((orig file-name-handler-alist))
  (setq file-name-handler-alist nil)
  (add-hook 'emacs-startup-hook
            (lambda () (setq file-name-handler-alist orig))))
