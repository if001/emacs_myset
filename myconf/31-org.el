;;; 31-org.el --- Org settings:

;;; Commentary:
;; templateに用いることができるelement
;; https://orgmode.org/manual/Template-elements.html
;; %フォーマットの表記
;; https://orgmode.org/manual/Template-expansion.html

;; Code:
(use-package org
  :defer t
  :init
  (setq org-return-follows-link t  ; Returnキーでリンク先を開く
        org-mouse-1-follows-link t ; マウスクリックでリンク先を開く
        )
  ;; TODOキーワード設定
  (setq org-todo-keywords
	'((sequence "TODO(t)" "DOIN(i)" "WAIT(w)" "|" "DONE(d)")))
  (setq org-todo-keyword-faces
	'(
	  ("WAIT"  . (:foreground "CadetBlue3"      :weight bold))
	  ("TODO"  . (:foreground "LightGoldenrod3" :weight bold))
	  ))
  ;; DONEステータス時の見出しの色を変えない
  (setq org-fontify-done-headline nil)
  (setq work-directory "~/prog/org/")
  (defun yy-mm-file (base-dir file-prefix)
    "Generate a file name like 'YYYY-MM-PREFIX.org' in BASE-DIR."
    (let* ((now (current-time))
           (year (format-time-string "%Y" now))
           (month (format-time-string "%m" now))
           (full-dir (expand-file-name base-dir)))
      (unless (file-directory-p full-dir) ;; ディレクトリが存在しない場合は作成
	(make-directory full-dir t))
      ;; ファイル名を生成
      (expand-file-name (format "%s-%s-%s.org" year month file-prefix) full-dir)))
  
  (defun yy-mm-dd-file (base-dir file-prefix)
    "Generate a file name like 'YYYY-MM-DD-PREFIX.org' in BASE-DIR."
    (let* ((now (current-time))
           (year (format-time-string "%Y" now))
           (month (format-time-string "%m" now))
	   (day (format-time-string "%d" now))
           (full-dir (expand-file-name base-dir)))
      (unless (file-directory-p full-dir) ;; ディレクトリが存在しない場合は作成
	(make-directory full-dir t))
      ;; ファイル名を生成
      (expand-file-name (format "%s-%s-%s-%s.org" year month day file-prefix) full-dir)))

  
  :config
  (setq listfile (concat work-directory "list.org"))
  (setq chatfile (concat work-directory "chats.org"))
  (setq ideafile (concat work-directory "idea/idea.org"))
   
  ;; (setq taskfile (yy-mm-file (concat work-directory "tasks/") "task"))
  ;; (setq laterfile (yy-mm-file (concat work-directory "later/") "later"))
  ;; (setq techfile (yy-mm-dd-file (concat work-directory "tech/") "tech"))

  (setq memofile (yy-mm-dd-file (concat work-directory "memo/") "memo"))
  (setq chatfile (yy-mm-dd-file (concat work-directory "chat/") "chat"))
  (setq fefile (yy-mm-file (concat work-directory "fe/") "fe"))
  (setq matsuo-lab-file (yy-mm-dd-file (concat work-directory "matsuo-lab-llm-compe/") "matsuo-lab-llm-compe"))
 
  
  (setq org-capture-templates
	'(
	  ;; タスク
	  ("t" "task" entry (file memofile)
	   "** TODO %? :todo: \n:PROPERTIES:\n:CREATED: %U\n:TAG: task \n:END:\n%i\n%a\n"  :empty-lines 1)
	  ("l" "あとで読む" entry (file memofile)
           "** %? :later: \n:PROPERTIES:\n:CREATED: %U\n:TAG: later \n:END:\n%i\n%a\n"  :empty-lines 1)
	  ("a" "Any Idea" entry (file memofile)
           "** %? :any: \n:PROPERTIES:\n:CREATED: %U\n:TAG: any \n:END:\n%i\n%a\n"  :empty-lines 1)
	  ("i" "Tech memo" entry (file memofile)
           "** %? :tech: \n:PROPERTIES:\n:CREATED: %U\n:TAG: tech \n:END:\n%i\n%a\n"  :empty-lines 1)
	  ;; ("m" "Memo" entry (file+headline memofile "Memo")
          ;;  "* %? :memo: \n  :PROPERTIES:\n  :CREATED: %U\n  :TAG: memo\n  :END:\n  %i\n  %a\n" :empty-lines 1)
	  ("m" "Memo" entry (file memofile)
           "** %? :memo: \n:PROPERTIES:\n:CREATED: %U\n:TAG: memo \n:END:\n%i\n%a\n" :empty-lines 1 :tree-type month)
	  ("e" "emacs" entry (file memofile)
           "** %? :memo: \n:PROPERTIES:\n:CREATED: %U\n:TAG: memo \n:END:\n%i\n%a\n" :empty-lines 1 :tree-type month)
	  ("p" "Pepar" entry (file memofile)
           "** %? :pepar: \n:PROPERTIES:\n:CREATED: %U\n:TAG: pepar \n:END:\n%i\n%a\n" :empty-lines 1 :tree-type month)


	  ;; ("m" "Memo" entry (file+olp+datetree datetreefile)
          ;;  "** %<%m-%d(%a) %H:%M>\n#+filetags: :memo: \n:PROPERTIES:\n:CREATED: %U\n:TAG: :memo: \n:END:\n%?\n%i\n%a\n" :empty-lines 1 :tree-type month)
	  ("s" "matsuo-lab-llm-compe" entry (file matsuo-lab-file)
           "** %? :llm_compe: \n:PROPERTIES:\n:CREATED: %U\n:TAG: llm_compe \n:END:\n%i\n%a\n" :empty-lines 1 :tree-type month)	  
	  ("c" "chats" entry (file+headline chatfile "Chats")
	   "** %? :chat: \n\n:PROPERTIES:\n:CREATED: %U\n:TAG: chat\n:END:\n%i\n" :empty-lines 1)
	  ("f" "FE memo" entry (file fefile)
           "* %? :fe: \n:PROPERTIES:\n:CREATED: %U\n:TAG: fe \n:END:\n%i\n%a\n"  :empty-lines 1)
	  )
	)

  ;; agendaの設定
  (defun my-list-subdirectories (dir)
    "指定したディレクトリ DIR の直下にあるディレクトリのリストを返します。"
    (let ((files (directory-files dir t nil))) ;; t で絶対パス、nil でソート
      (cl-loop for file in files
               when (and (file-directory-p file)
			 (not (string-equal (file-name-nondirectory file) "."))
			 (not (string-equal (file-name-nondirectory file) "..")))
               collect (concat file "/")
	       )
      ))
  (setq org-agenda-files (my-list-subdirectories work-directory))
  ;;(setq org-agenda-files '("~/prog/org/memo/"))
  ;; (message org-agenda-files)
  (setq org-agenda-custom-commands
	'(
	  ("s" "List entries with memo tag/property" tags "memo")
	  ("p" "Entries with property TAG=memo" tags "+TAG=\"tech\"")
	  )
	)
  
  
  )


(with-eval-after-load 'org
  ;; orgの検索用
  (defun my/org-date-string (days-offset)
    "Return date string like '2025-07-01' offset by DAYS-OFFSET from today."
    (format-time-string "%Y-%m-%d"
			(time-add (current-time)
                                  (days-to-time days-offset)))
    )

  ;; プロパティから時刻文字列を取得し、Emacsの内部時刻形式に変換
  (defun my/org-parse-created-timestamp ()
    "Parse CREATED property as a time value, or nil if not present or invalid."
    (let ((ts (org-entry-get nil "CREATED")))
      (when ts
	(condition-case nil
            (encode-time (parse-time-string ts))
          (error nil)))))  ;; エラー時は nil を返す

  ;; 指定した日数前より後かどうかをチェック
  (defun my/org-created-after-days-ago-p (days)
    "Return non-nil if the CREATED property is within the last DAYS days."
    (let ((cutoff (time-subtract (current-time) (days-to-time days))))
      (let ((created-time (my/org-parse-created-timestamp)))
	(and created-time
             (time-less-p cutoff created-time)))))

  ;; 今日作成されたかチェック
  (defun my/org-created-today-p ()
    "Return non-nil if CREATED property is today."
    (let* ((created-time (my/org-parse-created-timestamp))
           (now (current-time)))
      (when created-time
	(let ((created-date (decode-time created-time))
              (now-date (decode-time now)))
          (and (= (nth 3 created-date) (nth 3 now-date))   ;; day
               (= (nth 4 created-date) (nth 4 now-date))   ;; month
               (= (nth 5 created-date) (nth 5 now-date))))))) ;; year

  ;; (defun my/release-org-buffers ()
  ;;   "Release all currently open org-mode buffers using `org-release-buffers`."
  ;;   (interactive)
  ;;   (let ((org-buffers
  ;;          (seq-filter (lambda (buf)
  ;; 			 (with-current-buffer buf
  ;;                          (derived-mode-p 'org-mode)))
  ;;                      (buffer-list))))
  ;;     (if org-buffers
  ;; 	  (
  ;; 	   (org-release-buffers org-buffers)
  ;; 	   (message "Released %d org buffers." (length org-buffers))
  ;; 	   )
  ;; 	(message "not found buffer")
  ;; 	)
  ;;     )
  ;;   )
  )

;; (org-release-buffers org-agenda-new-buffers)
(use-package org-ql
  :defer t
  :after org
  :config
  (setq org-ql-views
	'(
	  ("🕓 今日作成したメモ"
           :buffers-files org-agenda-files
	   :query (my/org-created-today-p)
           :title "🕓 今日作成したメモ"
	   :files org-agenda-files
	   )
	  ("🦑 昨日作成したメモ"
           :buffers-files org-agenda-files
	   :query (my/org-created-after-days-ago-p 1)
           :title "🦑 昨日作成したメモ"
	   :files org-agenda-files
	   )
	  ("📅 過去7日間に作成されたエントリ"
	   :buffers-files org-agenda-files
           :title "📅 過去7日間に作成されたエントリ"
	   :query (my/org-created-after-days-ago-p 7)
           :files org-agenda-files
	   )
          ("📝 メモ"
           :buffers-files org-agenda-files
           :query (tags "memo")
           :title "📝 メモ"
	   :narrow nil
	 )
	;; ("今日のタスク"
        ;;  :buffers-files org-agenda-files
        ;;  :query (and (todo)
        ;;              (ts-active :on today)) ; 今日の日付を持つもの
        ;;  :title "今日のタスク一覧"
        ;;  :sort (ts priority todo)
	;;  :narrow nil
	;;  )
        ;; ("今週の予定"
        ;;  :buffers-files org-agenda-files
        ;;  :query (ts-active :from today :to 7)
        ;;  :title "今週の予定"
	;;  :narrow nil
	;;  ) ;; 今日から7日以内
	)
      )
  )

;; アンダースコアを入力しても下付き文字にならないようにする
(setq org-use-sub-superscripts '{}
      org-export-with-sub-superscripts nil)


;; org-indent-mode
;; インデント機能を有効にしています。
(use-package org-indent
  :ensure nil
  :hook (org-mode . org-indent-mode))


;; org用のシンプルなメモ取りツール
(use-package denote
  :defer t
  :init
  (with-eval-after-load 'org
    (setq denote-directory "~/prog/org/denote/"))

  :custom
  (denote-known-keywords '("emacs" "memo" "tweet"))
  :config
  ;; (add-hook 'find-file-hook #'denote-link-buttonize-buffer)
  (add-hook 'dired-mode-hook #'denote-dired-mode-in-directories)
  (add-hook 'context-menu-functions #'denote-context-menu)

  (denote-rename-buffer-mode +1))

;; org-mode用のtheme
(use-package org-modern
  :custom
  (org-modern-fold-stars '(("▶" . "▼") ("▷" . "▽") ("▸" . "▾") ("▹" . "▿") ("▸" . "▾")))
  :config
  (setopt
   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t

   ;; Agenda styling
   org-agenda-tags-column 0
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "◀── now ─────────────────────────────────────────────────")

  ;; Ellipsis styling
  (setopt org-ellipsis "…")
  (set-face-attribute 'org-ellipsis nil :inherit 'default :box nil)

  (global-org-modern-mode))




(message "load 31-org.el")
