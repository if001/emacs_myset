(add-hook 'prog-mode-hook 'hs-minor-mode)

;; よく使うコマンドのキーバインド（任意）
(global-set-key (kbd "C-c @ C-t") 'hs-toggle-hiding)  ; カーソル下のブロックをトグル
(global-set-key (kbd "C-c @ C-s") 'hs-show-all)       ; 全て展開
(global-set-key (kbd "C-c @ C-h") 'hs-hide-all)       ; 全て折りたたみ
