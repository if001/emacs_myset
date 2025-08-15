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


;; キーバインドを可視化してくれます。
(use-package which-key
  :config
  (which-key-mode +1))


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


;;reload
;; use-packageの場合、M-x eval-defunを使う
(global-set-key [f12] 'eval-buffer)
 
;; (if (string-match "darwin" (system-type))
;;        (setq ns-command-modifier (quote meta))
;;  (setq ns-alternate-modifier (quote super))
;; )

;; undo
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z") 'undo)


;; macのpinchを無効化
(global-set-key (kbd "<pinch>") 'ignore)
(global-set-key (kbd "<C-wheel-up>") 'ignore)
(global-set-key (kbd "<C-wheel-down>") 'ignore)


;; WSLではC-\で日英を切り替え!!!
;; C-\ runs the command toggle-input-method

;; wsl用 C-SPCで日英切り替える
;; 切り替わらない場合、terminalでfcitxを起動する
(global-unset-key (kbd "C-\\"))
(defun start-fcitx ()
  (interactive)
  (start-process "start-fcitx" nil "fcitx"))
(defun toggle-ime ()
  "外部IMEのON/OFFを切り替えるコマンドをEmacsから呼び出す。"
  (interactive)
  ;; 以下はfcitx5の場合の例（wslなど）
  (start-process "fcitx-toggle" nil "fcitx-remote" "-t"))
(global-set-key (kbd "C-\\") 'toggle-ime)

(message "loaded 04-keybind.el")
