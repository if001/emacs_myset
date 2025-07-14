
(use-package gptel
  :config
  (setq gptel-model 'gemini-2.5-flash-lite-preview-06-17)
  ;; (setq gptel-model 'gemini-2.5-flash-preview-04-17)
  (setq gptel-default-mode 'org-mode)
  (setq gptel-backend (gptel-make-gemini "Gemini"
			:key gemini-api-key
			:stream t))
  )



(use-package gptel-integrations
  :ensure nil
  :config
  (setq mcp-hub-servers
	'("search_web" :command "ddg-search" :args ("stdio"))
	)
  )

(use-package mcp
  :after gptel
  :custom (mcp-hub-servers
           `(
	     ;; ("ddg-search" . (:command "uv" :args ("run" "/Users/ac211/prog/python/duckduckgo-mcp-server/src/main.py")))
	     ("ddg-search" :command "uvx" :args ("--no-cache" "--from" "/Users/ac211/prog/python/duckduckgo-mcp-server/dist/duckduckgo_mcp_server-0.1.0-py3-none-any.whl" "duckduckgo-mcp-server"))
	     )
	   )
  :config (require 'mcp-hub)
  ;; :hook (after-init . mcp-hub-start-all-server)
  )
