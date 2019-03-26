;; フォント設定
;; (if (string-match "ac171.local" system-name)
;;     )
(set-face-attribute 'default nil
		    :family "Ricty Diminished"
					;: family "Osaka"
					;: family "M+ 2p"
		    :height 130)
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Hiragino Kaku Gothic ProN" :size 9))


;; ;; 英語と日本語の比率を1：2に設定
(add-to-list 'face-font-rescale-alist
             '(".*Hiragino Kaku Gothic ProN.*" . 1.2))

;; 行間を指定
(setq-default line-spacing 0.1)
