;;; 05-env.el --- Env settings:

;;; Commentary:

;; Code:


;; emacsclient コマンドで高速にファイルが開けます。
(use-package server
  :config
  (unless (server-running-p)
    (server-start)))

;; パフォーマンスの向上
(setq process-adaptive-read-buffering t)

;; 閉じ括弧を入力しても点滅させない
(setq blink-matching-paren nil)

;; vcのバックエンドをGitのみに変更
(setq vc-handled-backends '(Git))

;; ファイル検索を2回行わないようにする
(setq auto-mode-case-fold nil)

;; 双方向の並び替えを抑制する
(setq-default bidi-display-reordering 'left-to-right)

;; 長い行の双方向スキャン
(setq bidi-inhibit-bpa t)

;; フォーカスされていないウィンドウのカーソルを削除
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

;; 高速なスクロール
(setq fast-but-imprecise-scrolling t)

;; ドメインにpingを送信しない
(setq ffap-machine-p-known 'reject)

;; UIの更新頻度を下げる
(setq idle-update-delay 1.0)

;; 不要なフォント表示化を抑制
(setq redisplay-skip-fontification-on-input t)

;; 各OSの最適化
(when IS-WINDOWS
  (setq w32-use-native-image-API t))

(unless IS-MAC
  (setq command-line-ns-option-alist nil))

(unless IS-LINUX
  (setq command-line-x-option-alist nil))


;; キーバインドを可視化してくれます。
(use-package which-key
  :config
  (which-key-mode +1))
