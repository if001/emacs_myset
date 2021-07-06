(use-package company
  :ensure t
  :config
  ;;キーバインド
  (global-set-key [\C-tab] 'company-mode)
  (global-company-mode t) ; 全バッファで有効にする
  (custom-set-variables
   '(company-dabbrev-other-buffers 'all)
   '(company-dabbrev-code-other-buffers 'all)
   )
  (setq company-idle-delay 0) ; デフォルトは0.5
  (setq company-minimum-prefix-length 2) ; デフォルトは4
  (setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る

  ;; 各種メジャーモードでも C-M-iで company-modeの補完を使う
  (define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-h") nil)
  )

;; (require 'company-quickhelp)
;; (company-quickhelp-mode t)





;; ;; 色設定
;; (set-face-attribute 'company-tooltip nil
;;                     :foreground "black" :background "lightgrey")
;; (set-face-attribute 'company-tooltip-common nil
;;                     :foreground "black" :background "lightgrey")
;; (set-face-attribute 'company-tooltip-common-selection nil
;;                     :foreground "white" :background "steelblue")
;; (set-face-attribute 'company-tooltip-selection nil
;;                     :foreground "black" :background "steelblue")
;; (set-face-attribute 'company-preview-common nil
;;                     :background nil :foreground "lightgrey" :underline t)
;; (set-face-attribute 'company-scrollbar-fg nil
;;                     :background "orange")
;; (set-face-attribute 'company-scrollbar-bg nil
;;                     :background "gray40")




;; ;; タブの動きよきにはからえ
;; (defun company--insert-candidate2 (candidate)
;;   (when (> (length candidate) 0)
;;     (setq candidate (substring-no-properties candidate))
;;     (if (eq (company-call-backend 'ignore-case) 'keep-prefix)
;;         (insert (company-strip-prefix candidate))
;;       (if (equal company-prefix candidate)
;;           (company-select-next)
;;           (delete-region (- (point) (length company-prefix)) (point))
;;         (insert candidate))
;;       )))

;; (defun company-complete-common2 ()
;;   (interactive)
;;   (when (company-manual-begin)
;;     (if (and (not (cdr company-candidates))
;;              (equal company-common (car company-candidates)))
;;         (company-complete-selection)
;;       (company--insert-candidate2 company-common))))

;; (define-key company-active-map [tab] 'company-complete-common2)
;; (define-key company-active-map [backtab] 'company-select-previous) ; おまけ
