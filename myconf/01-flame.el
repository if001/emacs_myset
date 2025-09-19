;;; 01-frame.el --- Frame settings:

;;; Commentary:

;; Code:
;;時計の表示
(display-time-mode nil)

;;;スタートメッセージを表示しない
(setq inhibit-startup-message t)

;; ;; tool bar を消す.
(tool-bar-mode -1)
(menu-bar-mode -1)

;;起動時のフレームサイズを設定する
(setq initial-frame-alist
      (append (list
	'(width . 150)
        '(height . 50)
        )
	      initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

(custom-set-variables
 '(blink-cursor-mode nil)) ;;カーソルの点滅をやめる


;; スクロールバー非表示
(scroll-bar-mode 0)

;; 起動時に分割しておく
;;(split-window-horizontally)
;;(other-window 1)
;;(split-window-vertically)

;; 対応する括弧を光らせる。
(show-paren-mode 1)

;バックアップファイルを作らない
(setq make-backup-files nil)

;オートセーブファイルを作らない
(setq auto-save-default nil)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;; 画像ファイルを表示する
(auto-image-file-mode t)

;; ガベージコレクションの設定
;; (setq garbage-collection-messages t)
(setq gc-cons-percentage 0.2
      gc-cons-threshold (* 128 1024 1024))
(add-hook 'focus-out-hook #'garbage-collect)
;; GCを減らして軽くする.(10倍)
;; (setq gc-cons-threshold 12800000)
;; (setq gc-cons-threshold (* gc-cons-threshold 50))
;; (setq gc-cons-threshold 402653184 gc-cons-percentage 0.6)

;; 長い行を含むファイルの最適化
(use-package so-long
  :init
  (global-so-long-mode +1))

;; かっこの自動挿入
(electric-pair-mode 1)

;;C-nを押し続けてもページが切り替わることなく一行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t) ;; shell-mode


;; 行番号表示
(global-display-line-numbers-mode 1) ;; グローバル
;; 絶対行番号（デフォルト）
(setq display-line-numbers-type t)
;;(setq display-line-numbers-type 'relative) ;; 相対行番号
;;(setq display-line-numbers-type 'visual) ;; 視覚的な行番号（折り畳みやラップを考慮）

;; 現在行を強調表示
;; hl-line-mode を強化するパッケージ
(use-package lin
  :init
  (setq lin-face 'lin-red)
  (lin-global-mode +1))

;; camelCase単位で移動する
(use-package subword
  :init
  (global-subword-mode +1))


;; カーソルの移動を視覚的に分かりやすくしてくれます。beaconよりもシンプルな実装になっています。
(use-package pulsar
  :config
  (pulsar-global-mode +1)
  ;; (pulsar-pulse t)
)


;; 画面の余白を付けてくれます。カスタマイズ変数を調整することでモードラインも良い感じにしてくれます。
(use-package spacious-padding
  :config
  (setq spacious-padding-widths
        '( :internal-border-width 15
           :header-line-width 4
           :mode-line-width 6
           :tab-width 4
           :right-divider-width 30
           :scroll-bar-width 8))

  ;; Read the doc string of `spacious-padding-subtle-mode-line' as it
  ;; is very flexible and provides several examples.
  (setq spacious-padding-subtle-mode-line
        `( :mode-line-active 'default
           :mode-line-inactive vertical-border))

  (spacious-padding-mode +1))

;; 括弧等の構造を操作するパッケージ
(use-package puni
  :config
  (puni-global-mode +1))


;; 高速で不正確なスクロール
(setq fast-but-imprecise-scrolling t)


;; バッファ上部にパンくずリストを表示してくれます。
(use-package breadcrumb
  :config
  (breadcrumb-mode +1))

;; imenuを一覧表示してくれます。
;; (use-package imenu-list
;;   :bind ( :map my-toggle-map
;;           ("i" . imenu-list-smart-toggle))
;;   :init
;;   (setq imenu-list-position 'left))

;; undoとredoを強化
(use-package undo-fu
  :config
  (with-eval-after-load 'evil
    (setq evil-undo-system 'undo-fu)))

;; undo情報をEmacs終了後も保持してくれるようになります。
(use-package undo-fu-session
  :config
  (undo-fu-session-global-mode +1)
  )

;; indetにハイライトつける
;; (use-package highlight-indent-guides
;;   :ensure nil
;;   :diminish
;;   :hook (prog-mode . highlight-indent-guides-mode)
;;   :custom
;;   (highlight-indent-guides-auto-enabled t)
;;   (highlight-indent-guides-responsive t)
;;   ;; (highlight-indent-guides-method 'character) ;; column
;;   (highlight-indent-guides-method 'bitmap) ;; column   
;;   )


;; 
(setq blink-matching-paren nil)


(message "loaded 01-flame.el")
;;-------------------------------------------------------------------------;;
