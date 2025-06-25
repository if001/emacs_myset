;;M-x describe-bindings で現在のキーバインド確認
;;M-x describe-keyで入力したキーのバインドを獲得
;; 連続するキーの例
;; (global-set-key "\C-xc" 'compile)
;; (global-set-key "\C-x\C-a" 'tags-search)
;; kbdというマクロを介することでバックスラッシュ(\)をつける必要がなくなる
;;
;; まず、scratchバッファに書いてC-jで評価して、エラーがでなければ設定ファイルに
;; 書いた方が良い。

;; bind-keyに置き換えたい
;; http://emacs.rubikitch.com/bind-key/

;; window移動
(global-set-key (kbd "C-t") 'other-window)

; コメントアウト
;; (define-key global-map "\C-c;" 'comment-region)
(define-key global-map (kbd "C-;") 'comment-region)

; コメント解除 (:はkbdつけない)
(define-key global-map "\C-c:" 'uncomment-region)

(setq cua-enable-cua-keys nil)  ; CUAキーバインドを無効化
;; 上側に大きくスクロール
;; (define-key global-map "\C-o" 'cua-scroll-down)
(define-key global-map "\C-o" 'scroll-down)

;; mac のcommandとoptionを入れ替える
(if (string-match "ac171.local" (system-name))
   (setq ns-command-modifier (quote meta))
 (setq ns-alternate-modifier (quote super))
 )
(if (string-match "ac171" (system-name))
   (setq ns-command-modifier (quote meta))
 (setq ns-alternate-modifier (quote super))
 )
(if (string-match "AC164-3.local" (system-name))
       (setq ns-command-modifier (quote meta))
 (setq ns-alternate-modifier (quote super))
 )
(if (string-match "ac211.local" (system-name))
       (setq ns-command-modifier (quote meta))
 (setq ns-alternate-modifier (quote super))
) 
(if (string-match "ifmac.local" (system-name))
       (setq ns-command-modifier (quote meta))
 (setq ns-alternate-modifier (quote super))
 )


;; (if (string-match "darwin" (system-type))
;;        (setq ns-command-modifier (quote meta))
;;  (setq ns-alternate-modifier (quote super))
;; )

(message "loaded 04-keybind.el")
