(use-package gptel
  :config
  (setq gptel-model 'gemini-2.5-flash-lite-preview-06-17)
  ;; (setq gptel-model 'gemini-2.5-flash-preview-04-17)
  (setq gptel-default-mode 'org-mode)
  (setq gptel-backend (gptel-make-gemini "Gemini"
			:key gemini-api-key
			:stream t))
  )
