;;; 50-theme.el --- Theme settings:

;;; Commentary:
;; 参考
;; https://qiita.com/nobuyuki86/items/122e85b470b361ded0b4#theme
;;; Code:

(use-package ef-themes
  :ensure t
  :config
  (setq ef-themes-mixed-fonts t
        ef-themes-variable-pitch-ui t)
  (load-theme 'ef-melissa-light t))


(use-package modus-themes
  :ensure t
  :config
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil
        modus-themes-mixed-fonts t
        modus-themes-variable-pitch-ui t
        modus-themes-disable-other-themes t)

  (setq modus-themes-completions
        '((t . (underline))))

  (setq modus-themes-common-palette-overrides
        '((fg-completion-match-0 blue)
          (fg-completion-match-1 magenta-warmer)
          (fg-completion-match-2 cyan)
          (fg-completion-match-3 red)
          (bg-completion-match-0 bg-blue-nuanced)
          (bg-completion-match-1 bg-magenta-nuanced)
          (bg-completion-match-2 bg-cyan-nuanced)
          (bg-completion-match-3 bg-red-nuanced)))

  ;; (load-theme 'modus-operandi-tinted t)
  )


;; dashboard
(use-package dashboard
  :init
  (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-display-icons-p t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-center-content t)
  :config  
  (dashboard-setup-startup-hook)
  (add-to-list 'dashboard-item-generators
               '(error-status . (lambda (list-size)
                                  (when (not (equal (init-loader-error-log) ""))
				    (dashboard-insert-heading "ERROR")
				    (insert "\n初期化時にエラーが発生しました。\n*init-log* を確認してください")))))
  (setq dashboard-items '(
			  (recents   . 5)
			  (projects   . 5)
			  (agenda    . 5)
			  (bookmarks . 5)
			  (error-status . nil)
			  ))  
  (setq dashboard-heading-icons '((recents   . "nf-oct-history")
				  (projects  . "nf-oct-rocket")
				  (agenda    . "nf-oct-calendar")
                                  (bookmarks . "nf-oct-bookmark")
                                  (registers . "nf-oct-database")
				  (error-status . "nf-oct-bug")
				  ))
  )
