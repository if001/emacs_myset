;;; hs-minor-mode
(add-hook 'prog-mode-hook 'hs-minor-mode)
(define-key global-map (kbd "C-.") 'hs-toggle-hiding)

