;; 最近開いたファイルを参照
(use-package recentf
  :config
  (setq recentf-max-saved-items 100)              ;; consult-bufferに表示する最近使ったファイルの最大表示数
  (setq recentf-exclude '(".recentf" "^/ssh:"))  ;; recentfの履歴に含ませないファイルリスト
  (setq recentf-auto-cleanup 10)

  (setq recentf-auto-save-timer
        (run-with-idle-timer 30 t 'recentf-save-list)) ;; バッファを開いて30秒以上したら履歴に登録
  (recentf-mode 1)
  (global-set-key "\C-x\ \C-r" 'recentf-open-files)
  ;; 起動画面で recentf を開く
  (add-hook 'after-init-hook (lambda()
      (recentf-open-files)
      ))
  )
