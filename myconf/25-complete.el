;;; 25-complete.el --- Complete settings:

;;; Commentary:
;; companyからcorfuへ乗り換え

;;; Code:


;;; Corfu: インライン補完UI

;; 参考: https://qiita.com/nobuyuki86/items/7c65456ad07b555dd67d
(use-package corfu
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode) ;; 補完候補の隣に説明が表示されるようになります。
  ;; (corfu-history-mode)
  :custom ((corfu-auto t)
	   (corfu-cycle t)
	   
	   ;; popup-mode
	   (corfu-popupinfo-mode t)
	   (corfu-popupinfo-delay 0.5)
	   (corfu-popupinfo-at-point t)

	   ;; corfu-echo
	   (corfu-echo-delay 0.05)
           (corfu-auto-delay 0)
           (corfu-auto-prefix 1)

	   ;; corfuの設定
           (corfu-on-exact-match nil)
           (tab-always-indent 'complete)
	   (corfu-auto-completion-delay 0.1) ; Auto-completion delay
	   (corfu-quit-at-boundary t) ; Quit completion at word boundary
	   (corfu-separator ?\s) ; Separator for candidates
	   (corfu-popupinfo-delay 0.5) ; Delay for popup info
	   (corfu-scroll-margin 3) ; Scroll margin
	   (corfu-min-width 10) ; Minimum width of completion window
	   (corfu-max-height 15) ; Maximum height of completion window	   
	   )
  :config
  ;; ミニバッファー上でverticoによる補完が行われない場合、corfuの補完が出るようにします。
  ;; https://github.com/minad/corfu#completing-in-the-minibuffer
  (defun corfu-enable-always-in-minibuffer ()
    "Enable Corfu in the minibuffer if Vertico/Mct are not active."
    (unless (or (bound-and-true-p mct--active)
                (bound-and-true-p vertico--input))
      ;; (setq-local corfu-auto nil) ;; Enable/disable auto completion
      (setq-local corfu-echo-delay nil ;; Disable automatic echo and popup
                  corfu-popupinfo-delay nil)
      (corfu-mode 1)))
  (add-hook 'minibuffer-setup-hook #'corfu-enable-always-in-minibuffer 1)
  )

  ;; lsp-modeでcorfuが起動するように設定する
  ;;(with-eval-after-load 'lsp-mode
  ;;  (setq lsp-completion-provider :none)))
  ;;)


;; 補完
;; (use-package tabnine
;;   :hook (kill-emacs . tabnine-kill-process)
;;   :bind ( :map tabnine-completion-map
;;           ("TAB" . nil)
;;           ("<tab>" . nil))
;;   :config
;;   (setq tabnine-inline-completion-mode t) ; Enable inline completion
;;   :init
;;   (global-tabnine-mode +1))


;;; Cape: corfuの強化、他の補完系との連携を行う
;; https://qiita.com/nobuyuki86/items/7c65456ad07b555dd67d
;; (use-package cape
;;   :hook (((prog-mode
;;            text-mode
;;            conf-mode
;;            eglot-managed-mode
;;            lsp-completion-mode) . my/set-super-capf))
;;   :config
;;   (setq cape-dabbrev-check-other-buffers nil)

;;   (defun my/set-super-capf (&optional arg)
;;     (setq-local completion-at-point-functions
;;                 (list (cape-capf-noninterruptible
;;                        (cape-capf-buster
;;                         (cape-capf-properties
;;                          (cape-capf-super
;;                           (if arg
;;                               arg
;;                             (car completion-at-point-functions))
;;                           #'tempel-complete
;;                           #'tabnine-completion-at-point
;;                           #'cape-dabbrev
;;                           #'cape-file)
;;                          :sort t
;;                          :exclusive 'no))))))

;;   (add-to-list 'completion-at-point-functions #'tempel-complete)
;;   (add-to-list 'completion-at-point-functions #'tabnine-completion-at-point)
;;   (add-to-list 'completion-at-point-functions #'cape-file t)
;;   (add-to-list 'completion-at-point-functions #'cape-tex t)
;;   (add-to-list 'completion-at-point-functions #'cape-dabbrev t)
;;   (add-to-list 'completion-at-point-functions #'cape-keyword t))
;; ---- ;;
;; https://qiita.com/nobuyuki86/items/122e85b470b361ded0b4#cape
(use-package cape
  :config
  (advice-add 'eglot-completion-at-point :around #'cape-wrap-buster)
  (advice-add 'eglot-completion-at-point :around #'cape-wrap-nonexclusive)
  (advice-add 'lsp-completion-at-point :around #'cape-wrap-buster)
  (advice-add 'lsp-completion-at-point :around #'cape-wrap-nonexclusive)
  (advice-add 'lsp-completion-at-point :around #'cape-wrap-noninterruptible)

  (add-hook 'completion-at-point-functions #'tempel-complete)
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)
  ;; (with-eval-after-load 'tabnine
  ;;   (advice-add 'tabnine-completion-at-point #'cape-wrap-buster)
  ;;   (add-hook 'completion-at-point-functions #'tabnine-completion-at-point))
  )

;; dabbrevのサイズを制限
(setq dabbrev-friend-buffer-function (lambda (other-buffer)
                                       (< (buffer-size other-buffer) (* 1024 1024))))

;; TABで補完を表示する
(setq tab-always-indent 'complete)


;;; Kind-icon: 補完候補にアイコン表示
(use-package kind-icon
  :init
  ;; (add-hook 'corfu-mode-hook 'kind-icon-mode)
  :custom (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
  :config
  ;; アイコンのサイズや位置を調整
  (setq kind-icon-default-size 16) ;; アイコンサイズ（ピクセル）
  ;; (setq kind-icon-offset-x -2) ;; X軸オフセット
  ;; (setq kind-icon-offset-y 2) ;; Y軸オフセット
  (setq kind-icon-default-face 'corfu-default)
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)
  )


;; スニペットのパッケージ
(use-package tempel
  :bind (("M-+" . tempel-complete) ;; Alternative tempel-expand
         ("M-*" . tempel-insert))
  )

(use-package tempel-collection
  :after tempel)


;;; Vertico, Consult, Orderless, Marginalia, Embark との連携
;; Vertico と Corfu は異なる補完UIなので、通常はどちらか一方のみ有効にします。
;; ミニバッファ補完は Vertico, カーソル位置補完は Corfu という使い分けが一般的です。

;; (global-corfu-mode) が有効になっている場合、
;; ミニバッファでの補完も Corfu が担当するようになります。
;; もしミニバッファ補完を Vertico に任せたい場合は、`global-corfu-mode` を無効にし、
;; 必要に応じて特定のモードで `corfu-mode` を有効にするか、
  ;; `minibuffer-setup-hook` などで Vertico を有効にしてください


(message "loaded 25-complete.el")
