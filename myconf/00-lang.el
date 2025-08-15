;;; 00-lang.el --- Font settings:

;;; Commentary:

;;; Code:


;; 英語フォント
(defvar my/font-eng "Ricty Diminished")
;; 日本語フォント
(defvar my/font-jp "Noto Sans CJK JP")

(if (string-match "issei-All-Series" (system-name))
    (progn
      (message "linux settings")
      (set-face-attribute 'default nil
			  :family "Ricty Diminished"
			  :height 110)
      (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty Diminished" :size 14))
    
      ;; 英語と日本語の比率を1：2に設定
      ;; (setq face-font-rescale-alist '((".*Ricty Diminished.*" . 1.2)))
      )
  )

(if (string-match "ac211.local" (system-name))
    (progn
          (message "ac211.local settings")
    (set-face-attribute 'default nil
			:family "Ricty Diminished"
			:height 140)
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "Hiragino Kaku Gothic ProN" :size 10))
  ;; 英語と日本語の比率を1：2に設定
  (add-to-list 'face-font-rescale-alist
	       '(".*Hiragino Kaku Gothic ProN.*" . 1.2))
      )
  )

(if (string-match "DESKTOP-QFI57MO" (system-name))
    (progn
      (message "wsl settings")
      (set-face-attribute 'default nil
			  :family "Ricty Diminished"
			  :height 110)
      ;; (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty Diminished" :size 14))
      (set-fontset-font t 'japanese-jisx0208 (font-spec :family my/font-jp :size 14))
      (set-fontset-font t 'japanese-jisx0212 (font-spec :family my/font-jp :size 14))
    
      ;; 英語と日本語の比率を1：2に設定
      ;; (setq face-font-rescale-alist '((".*Ricty Diminished.*" . 1.2)))
      )
  )


;; 行間を指定
(setq-default line-spacing 0.1)

;; ずれ確認用
;; abcdefgchjk あ
;; 0123456789012345678901234567890123456789
;; ｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵ
;; あいうえおあいうえおあいうえおあいうえお

  
(message "00-lang.el loaded")
;;; 00-lang.el ends her

