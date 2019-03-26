;; ------------------------------------------------------
(use-package neotree
  :after
  projectile
  :commands
  (neotree-show neotree-hide neotree-dir neotree-find)
  :custom
  (neo-theme 'nerd2)
  :bind
  ;;("<f8>" . neotree-projectile-toggle)
  ("<f8>" . neotree-project-dir)
  :preface
  ;; (defun neotree-projectile-toggle ()
  ;;   (interactive)
  ;;   (let ((project-dir
  ;;          (ignore-errors
  ;;        ;;; Pick one: projectile or find-file-in-project
  ;;            (projectile-project-root)
  ;;            ))
  ;;         (file-name (buffer-file-name))
  ;;         (neo-smart-open t))
  ;;     (if (and (fboundp 'neo-global--window-exists-p)
  ;;              (neo-global--window-exists-p))
  ;;         (neotree-hide)
  ;; 	(progn
  ;;         (neotree-show)
  ;;         (if project-dir
  ;;             (neotree-dir project-dir))
  ;;         (if file-name
  ;;             (neotree-find file-name))))))
  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))

  )
;; ------------------------------------------------------


;; ------------------------------------------------------
;; 不要なモードラインを消す
(use-package hide-mode-line
  :hook
  ;; ((neotree-mode imenu-list-minor-mode) . hide-mode-line-mode))
  ((neotree-mode imenu-list-minor-mode) . hide-mode-line-mode))
;; ------------------------------------------------------


;; ------------------------------------------------------
;; 以下 usage
;; Shortcut (Only in Neotree Buffer)
;;  - [n] next line ， p previous line。
;;  - [SPC] or [RET] or [TAB] Open current item if it is a file. Fold/Unfold current item if it is a directory.
;;  - [g] Refresh
;;  - [A] Maximize/Minimize the NeoTree Window
;;  - [H] Toggle display hidden files
;;  - [C-c C-n] Create a file or create a directory if filename ends with a ‘/’
;;  - [C-c C-d] Delete a file or a directory.
;;  - [C-c C-r] Rename a file or a directory.
;;  - [C-c C-c] Change the root directory.

;; Commands（Global）
;;  - [neotree-dir] show NeoTree window and specify a directory as its root
;;  - [neotree-show] or neotree show NeoTree window using current directory as its root
;;  - [neotree-hide] Hide NeoTree window
;;  - [neotree-toggle] toggle/hide NeoTree window
;;  - [neotree-find] show NeoTree window and use the file of current buffer as its root

;; Command（Only in NeoTree Buffer）
;;  - [neotree-enter] Open File / Unfold Directory
;;  - [neotree-refresh] Refresh
;;  - [neotree-stretch-toggle] Maximize / Minimize
;;  - [neotree-change-root] Switch Root Directory
;;  - [neotree-hidden-file-toggle] Toggle hidden files
;;  - [neotree-rename-node] Rename a Node
;;  - [neotree-delete-node] Delete a Node
;;  - [neotree-create-node] Create a file or a directory (if filename ends with ‘/’)
