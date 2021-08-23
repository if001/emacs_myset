;;; 00-lang.el --- Font settings:

;;; Commentary:

;;; Code:
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
			:height 130)
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "Hiragino Kaku Gothic ProN" :size 9))
  ;; 英語と日本語の比率を1：2に設定
  (add-to-list 'face-font-rescale-alist
	       '(".*Hiragino Kaku Gothic ProN.*" . 1.2))
      )
  )


;; 行間を指定
(setq-default line-spacing 0.1)

;; ずれ確認用
;; abcdefgchjk あ
;; 0123456789012345678901234567890123456789
;; ｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵ
;; あいうえおあいうえおあいうえおあいうえお


;;; 00-lang.el ends here
