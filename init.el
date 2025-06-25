
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
(profiler-start 'cpu)

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; デフォルトでensure t
(use-package use-package
  :config
  (setq use-package-always-ensure t))


(add-to-list 'load-path (expand-file-name "site-lisp/init-loader/" user-emacs-directory))
(require 'init-loader)
(init-loader-load "~/.emacs.d/myconf")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(beframe cape centaur-tabs consult-eglot corfu dashboard denote
             diff-hl ef-themes eglot-signature-eldoc-talkative
             eglot-tempel eldoc-box embark-consult git-gutter-fringe
             gptel hide-mode-line highlight-indent-guides kind-icon
             lin lsp-mode magit-delta marginalia minions modus-themes
             neotree nerd-icons-completion nerd-icons-dired nyan-mode
             orderless org-modern projectile pulsar python-black
             pyvenv spacious-padding symbol-overlay tempel-collection
             treesit-auto undo-fu undo-fu-session vertico))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Local Variables:
;; indent-tabs-mode: nil
;; End:

(provide 'init)
;;; init.el ends here
