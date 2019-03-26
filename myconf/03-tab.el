(use-package tabbar)(
tabbar-mode 1)

;; タブ上でマウスホイールを使わない
(tabbar-mwheel-mode nil)

;; グループを使わない
(setq tabbar-buffer-groups-function nil)

;; 左側のボタンを消す
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; ウインドウからはみ出たタブを省略して表示
;(setq tabbar-auto-scroll-flag nil)

; エラーがあったときだけログバッファを表示
(if (not (equal (init-loader-error-log) ""))
    (init-loader-show-log))

;; タブ同士の間隔
(setq tabbar-separator '(1.2))

;; 色設定
;; (set-face-attribute 'tabbar-default nil
;; 		    :background "grey20"
;; 		    ;:family "Ricty Diminished"
;; 		    :height 1.0
;; 		    :box nil)
;; (set-face-attribute 'tabbar-selected nil
;; 		    :background "grey50"
;; 		    :foreground "#DCDCCC"
;; 		    :box nil)
;; (set-face-attribute 'tabbar-unselected nil
;; 		    :background "grey20"
;; 		    :foreground "#DCDCCC"
;; 		    :box nil)
;; (set-face-attribute 'tabbar-separator nil
;; 		    :background "grey20"
;; 		    :box nil)
;; (set-face-attribute 'tabbar-button nil
;; 		    :box nil)
;; (set-face-attribute 'header-line nil
;; 		    :background "grey20"
;; 		    :box nil)


(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; Always include the current buffer.
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
		     ((equal "*scratch*" (buffer-name b)) b) ; *scratch*バッファは表示する
		     ((char-equal ?* (aref (buffer-name b) 0)) nil) ; それ以外の * で始まるバッファは表示しない
                     ((buffer-live-p b) b)))
                (buffer-list))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)
