;; ivy設定
(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-height 10) ;; minibufferのサイズを拡大！（重要）
(setq ivy-extra-directories nil)
(setq ivy-re-builders-alist
      '((t . ivy--regex-plus)))

;;-------------------------------------------------------------------------;;
;; counsel設定
(global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file) ;; find-fileもcounsel任せ！
;; (defvar counsel-find-file-ignore-regexp (regexp-opt '("./" "../")))
;;-------------------------------------------------------------------------;;

;;-------------------------------------------------------------------------;;
;; サーチ
(global-set-key "\C-s" 'swiper)
(defvar swiper-include-line-number-in-search t) ;; line-numberでも検索可能
;;-------------------------------------------------------------------------;;
