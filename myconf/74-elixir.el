;;; 74-elixir.el --- Elixir settings:

;;; Commentary:
;; 以下からzipをダウンロードして
;; https://github.com/elixir-lsp/elixir-ls/releases/tag/v0.28.0

;;; Code:


;; Elixirモードの基本設定
(use-package elixir-mode
  :hook ((elixir-mode . eglot-ensure)
         (elixir-mode . subword-mode))
  :config
  ;; Elixir LS のパスを指定（パスは環境に応じて調整）
  (add-to-list 'eglot-server-programs
               '(elixir-mode . (expand-file-name (concat user-emacs-directory "/.cache/lsp/elixir-ls-v0.28.0/language_server.sh"))))

  ;; フォーマッターの自動適用
  (setq elixir-format-arguments '("--check-formatted"))
  (setq elixir-format-use-mix t)
  )

;; LiveViewなどで使用される .heex ファイル用
(use-package heex-ts-mode
  :mode "\\.heex\\'"
  :hook (heex-ts-mode . eglot-ensure))

;; ;; mix format でフォーマットするための補助パッケージ
;; (use-package mix-format
;;   :after elixir-mode
;;   :hook (elixir-mode . mix-format-on-save-mode))

(message "74-elixir.el loaded")
;;; 00-lang.el ends here
