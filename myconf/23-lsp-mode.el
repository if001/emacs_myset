

;;; 23-lsp-mode.el --- LSP settings:

;;; Commentary:
;; 以下でtreesitをインストールしておく
;; M-x treesit-install-language-grammar RET python RET
;;
;; eglotではflymakeが推奨
;; Code:


(defvar my/project-root-file-patterns
  '((elixir-mode . ("mix.exs"))
    (python-mode . ("pyproject.toml" "setup.py"))
    (python-ts-mode . ("pyproject.toml" "setup.py"))
    (js-mode     . ("package.json"))
    (typescript-mode . ("package.json" "tsconfig.json"))
    (rust-mode   . ("Cargo.toml"))
    (go-mode     . ("go.mod"))
    (c-mode      . ("Makefile" "CMakeLists.txt"))
    (c++-mode    . ("Makefile" "CMakeLists.txt")))
  )
(defun my/project-root-by-major-mode (dir)
  "現在の major-mode に応じてプロジェクトルートを判定する。対応するルートファイルがなければ `.git` を fallback として使用。"
  (let* ((mode (with-current-buffer (or (window-buffer) (current-buffer))
                 major-mode))
         (patterns (or (alist-get mode my/project-root-file-patterns)
                       '(".git")))
         (root (cl-some (lambda (file)
                          (locate-dominating-file dir file))
                        patterns)))
    (when root
      (cons 'transient root))))
(with-eval-after-load 'project
  (add-to-list 'project-find-functions #'my/project-root-by-major-mode))



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
        ;; eglot-stay-out-of '(flymake) ;; flymakeをoffにする設定
        eglot-send-changes-idle-time 1.0)
  ;; (defun my/add-directory-to-exec-path-recursively (dir)
  ;;   "Recursively add directories and their subdirectories to `exec-path`."
  ;;   (add-to-list 'exec-path dir)
  ;;   (dolist (entry (directory-files dir t "^[^.]" t))
  ;;     (when (file-directory-p entry)
  ;;       (my/add-directory-to-exec-path-recursively entry))))
  ;; (defun my/load-lsp-exec-path ()
  ;;   (interactive)
  ;;   (my/add-directory-to-exec-path-recursively "~/.emacs.d/.cache/"))
  ;; (my/load-lsp-exec-path)
  :hook (
	 ;; 言語の追加はここ. 言語のモードに対してeglotの起動をhook
	 ;; (python-ts-mode . eglot-ensure)
	 ;; (typescript-ts-mode . eglot-ensure)
         ;; (tsx-ts-mode        . eglot-ensure)
	 ;; (tsx-mode        . eglot-ensure)
	 ;; (elixir-mode        . eglot-ensure)
	 ;; (heex-ts-mode . eglot-ensure) ;; elixir用
	 )
  :config
  (setq-default flymake-no-changes-timeout 0.3) ;; flymake
  ;; language serverを追加する場合はここに追加していく
  (add-to-list 'eglot-server-programs '(python-ts-mode . ("pylsp" "-v"))) ;;python用
  (add-to-list 'eglot-server-programs '(python-mode . ("pylsp" "-v"))) ;;python用
  (add-to-list 'eglot-server-programs
               '(tsx-ts-mode . ("typescript-language-server" "--stdio" "--log-level" "4"))) ;; tsx-ts-mode
  (add-to-list 'eglot-server-programs
               `(elixir-mode . (,(expand-file-name
                                  (concat user-emacs-directory
                                          ".cache/lsp/elixir-ls-v0.28.0/language_server.sh"))))) ;; elixir
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
  :ensure nil
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
  :load-path "site-lisp/eglot-booster/"
  :after eglot
  :config (eglot-booster-mode))


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
