;;M-x describe-bindings で現在のキーバインド確認
;;M-x describe-keyで入力したキーのバインドを獲得
;; 連続するキーの例
;; (global-set-key "\C-xc" 'compile)
;; (global-set-key "\C-x\C-a" 'tags-search)
;; kbdというマクロを介することでバックスラッシュ(\)をつける必要がなくなる
;;
;; まず、scratchバッファに書いてC-jで評価して、エラーがでなければ設定ファイルに
;; 書いた方が良い。

; コメントアウト
(define-key global-map "\C-c;" 'comment-region)

; コメント解除
(define-key global-map "\C-c:" 'uncomment-region)

; undo
(define-key global-map "\C-z" 'undo)

;multi-term起動
(define-key global-map [C-f10] 'multi-term)

;;タブ移動
(global-set-key "\M-]" 'tabbar-forward)  ; 次のタブ
(global-set-key "\M-[" 'tabbar-backward) ; 前のタブ


;;ウィンドウ移動(mac)
;; (when (eq system-type 'darwin)
  ;; dired-mode でC-t無効化
;;  (define-key dired-mode-map (kbd "C-t") nil)
  ;; term-mode でC-t無効化
  ;;(define-key term-mode-map (kbd "C-t") nil)
  ;;(define-key term-mode-hook (kbd "C-t") nil)
;;  (global-set-key [(C t)] 'other-window))

(when (eq system-type 'darwin)
  (eval-after-load "dired" '(progn
			      (define-key dired-mode-map (kbd "C-t") 'other-window) ))
  )

;;ウィンドウ移動(linux)
(when (eq system-type 'gnu/linux)
  (define-key global-map [C-up] 'other-window)
  (define-key global-map [C-down] 'other-window)
  (define-key global-map [C-right] 'other-window)
  (define-key global-map [C-left] 'other-window))

;; (define-key global-map (kbd "\C-c <up>") 'windmove-up)
;; (define-key global-map (kbd "\C-c <right>") 'windmove-right)
;; (define-key global-map (kbd "\C-c <down>") 'windmove-down)
;; (define-key global-map (kbd "\C-c <left>") 'windmove-left)

;;ページのトップへ移動
(define-key global-map [M-up] 'beginning-of-buffer)

;;ページのトップへ移動
(define-key global-map [M-down] 'end-of-buffer)

;; 矩形選択
;; 詳しいキーバインド操作：http://dev.ariel-networks.com/articles/emacs/part5/
(cua-mode t)
(setq cua-enable-cua-keys nil)

;;init.el更新
(global-set-key [C-f12] 'eval-buffer)

;; anything起動
(define-key global-map (kbd "C-;") 'anything)

;; C-tでウィンドウが一つしかないときは分割、複数あるときは画面間を移動
;; ターミナル起動するとターミナルのキーバインドとC-tが被って使えない
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)
(put 'upcase-region 'disabled nil)


;; macではバックスラッシュが打てないので
;; ¥の代わりにバックスラッシュを入力する
(define-key global-map [?¥] [?\\])

;; 上側に大きくスクロール
(define-key global-map "\C-o" 'cua-scroll-down)

;; mac のcommandとoptionを入れ替える
(if (string-match "ac171.local" system-name)
   (setq ns-command-modifier (quote meta))
 (setq ns-alternate-modifier (quote super))
 )
(if (string-match "ac171" system-name)
   (setq ns-command-modifier (quote meta))
 (setq ns-alternate-modifier (quote super))
 )
