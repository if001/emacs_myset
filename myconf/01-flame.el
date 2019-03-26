;;-------------------------------------------------------------------------;;
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
	'(width . 200)
        '(height . 65)
        )
	      initial-frame-alist))
(setq default-frame-alist initial-frame-alist)

(custom-set-variables
 '(blink-cursor-mode nil) ;;カーソルの点滅をやめる
 '(inhibit-startup-screen t);;起動時にGNU Emacs を表示しない
 '(show-paren-mode t));;対応するカッコを強調


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

;; ガベージコレクションが発動したら表示
(setq garbage-collection-messages t)

;; GCを減らして軽くする.(10倍)
(setq gc-cons-threshold (* gc-cons-threshold 20))


;; かっこの自動挿入
(electric-pair-mode 1)

;;C-nを押し続けてもページが切り替わることなく一行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t) ;; shell-mode
;;-------------------------------------------------------------------------;;


;;-------------------------------------------------------------------------;;
;;行番号の表示
(require 'linum)
(global-linum-mode)
;; (custom-set-faces
;;  '(linum ((t (
;; 	      :inherit (shadow default)
;; 		       :background "#20232a"
;; 		       :foreground "gray65"
;; 		       )))))
(custom-set-faces
 '(linum ((t (:inherit (shadow default) :background "#20232a" :foreground "gray65" :strike-through nil :underline nil :slant normal :weight normal)))))

(setq linum-format "%4d")  ;;予めマージンを指定

;; モードラインに行数を非表示に
(line-number-mode nil)
;;-------------------------------------------------------------------------;;




;---------------------------------------------------------------------;
;; キーバインドでwindow sizeを変更
;; 使わんけど一応入れておく
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
	;;(setq c (read-key))
        (cond ((= c ?r)
               (enlarge-window-horizontally dx))
              ((= c ?l)
               (shrink-window-horizontally dx))
              ((= c ?d)
               (enlarge-window dy))
              ((= c ?u)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))
;---------------------------------------------------------------------;
