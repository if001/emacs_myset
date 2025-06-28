


;;; 23-lsp-mode.el --- LSP settings:

;;; Commentary:
;; 以下でtreesitをインストールしておく
;; M-x treesit-install-language-grammar RET python RET
;; Code:


(use-package eglot
  :bind ( :map eglot-mode-map
          ("C-c r" . eglot-rename)
          ("C-c o" . eglot-code-action-organize-imports)
          ("C-c a" . eglot-code-actions)
          ("C-c h" . eldoc)
          ("<f6>" . xref-find-definitions))
  :init
  (setq eglot-events-buffer-config '(:size 0  :format short)
        eglot-ignored-server-capabilities '(:documentHighlightProvider)
        eglot-stay-out-of '(flymake)
        eglot-send-changes-idle-time 1.0)
  (defun my/add-directory-to-exec-path-recursively (dir)
    "Recursively add directories and their subdirectories to `exec-path`."
    (add-to-list 'exec-path dir)
    (dolist (entry (directory-files dir t "^[^.]" t))
      (when (file-directory-p entry)
        (my/add-directory-to-exec-path-recursively entry))))
  (defun my/load-lsp-exec-path ()
    (interactive)
    (my/add-directory-to-exec-path-recursively "~/.emacs.d/.cache/"))
  (my/load-lsp-exec-path)
  :hook
  (python-ts-mode . eglot-ensure)
  :config
  ;; language serverを追加する場合はここに追加していく
  (add-to-list 'eglot-server-programs '(python-ts-mode . ("pylsp"))) ;;python用
  )

;; スニペットパッケージのtempelとeglotと統合するパッケージです。
(use-package eglot-tempel
  :after (eglot tempel)
  :hook (eglot--managed-mode . eglot-tempel-mode))

;; consultとeglotを統合するパッケージです。シンボルの検索が行えるようになります。
(use-package consult-eglot
  :after eglot
  :bind ( :map eglot-mode-map
          ("C-c s" . consult-eglot-symbols)))


;; json用???
(use-package jsonrpc
  :config
  (setq jsonrpc-default-request-timeout 3000)
  (fset #'jsonrpc--log-event #'ignore))


;; eglotの拡張
(use-package eglot-x
  :load-path "site-lisp/eglot-x/"
  :after eglot
  :config
  (eglot-x-setup))

;; ミニバッファのeldocをposframeで表示してくれます。
(use-package eldoc-box
  :init
  :hook (eglot--managed-mode . eldoc-box-hover-at-point-mode) ;;Display the documentation of the symbol at point in a temporary childframe
  :config
  (set-face-attribute 'eldoc-box-border nil :background "white") 
  )

;; eldocの情報を追加します。
(use-package eglot-signature-eldoc-talkative
  :after eldoc-box
  :config
  (advice-add #'eglot-signature-eldoc-function
              :override #'eglot-signature-eldoc-talkative))


;; emacs-lsp-booster ;; M-x eglot-booster
(use-package eglot-booster
  :ensure nil
  :after eglot
  :config	(eglot-booster-mode))


;;; lsp-mode: Language Serverのインストール・管理にのみ使用
;;; lsp-install-serverコマンドを使う
(use-package lsp-mode
  ;; :hook (((typescript-ts-mode
  ;;          tsx-ts-mode
  ;;          html-ts-mode
  ;;          css-ts-mode
  ;;          json-ts-mode) . lsp))
  :init
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-keymap-prefix "M-l")
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-enable-file-watchers nil
        lsp-enable-folding nil
        lsp-enable-symbol-highlighting nil
        lsp-enable-text-document-color nil
        lsp-enable-indentation nil
        lsp-enable-on-type-formatting nil
        lsp-auto-execute-action nil
        lsp-before-save-edits nil)
  ;; Language Serverを追加する場合はここに追加する
  ;; lsp-mode が pylsp を認識するための設定
  ;; lsp-install-server で pylsp をインストールする際に使用される
  (setq lsp-pylsp-executable "pylsp")
  
  :commands (lsp-install-server) ;; lsp-install-server コマンドをロード時に利用可能にする
  )


;; emacsの組み込み関数を利用してシンボルをハイライトしてくれます。
(use-package symbol-overlay
  :hook (prog-mode . symbol-overlay-mode))


;; tempelとlsp-modeを統合するパッケージです。
;; (use-package lsp-snippet
;;   :vc ( :fetcher github :repo "svaante/lsp-snippet")
;;   :config
;;   (when (featurep 'lsp)
;;     (lsp-snippet-tempel-lsp-mode-init)))
(message "loaded 23-lsp-mode.el")
