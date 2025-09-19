(use-package reformatter
  :ensure t
  :config
  (reformatter-define go-format
    :program "goimports")
  (reformatter-define web-format
    :program "prettier"
    :args `("--write" "--stdin-filepath" ,buffer-file-name))
  (reformatter-define python-format
    :program "ruff"
    :args `("format" "--stdin-filename" ,buffer-file-name))
  :hook
  (go-ts-mode . go-format-on-save-mode)
  (typescript-ts-mode . web-format-on-save-mode)
  (tsx-ts-mode . web-format-on-save-mode)
  (json-ts-mode . web-format-on-save-mode)
  (python-ts-mode . python-format-on-save-mode))
