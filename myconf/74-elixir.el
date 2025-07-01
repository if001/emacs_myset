;;; 74-elixir.el --- Elixir settings:

;;; Commentary:
;; 以下からzipをダウンロードして
;; https://github.com/elixir-lsp/elixir-ls/releases/tag/v0.28.0

;;; Code:


;; Elixirモードの基本設定
(use-package elixir-mode
  :hook (
         (elixir-mode . subword-mode)
	 )
  :config
  ;; フォーマッターの自動適用
  (setq elixir-format-arguments '("--check-formatted"))
  (setq elixir-format-use-mix t)
  )

;; LiveViewなどで使用される .heex ファイル用
(use-package heex-ts-mode
  :mode "\\.heex\\'"
  )

;; ;; mix format でフォーマットするための補助パッケージ
;; (use-package mix-format
;;   :after elixir-mode
;;   :hook (elixir-mode . mix-format-on-save-mode))

(message "74-elixir.el loaded")
;;; 00-lang.el ends here
