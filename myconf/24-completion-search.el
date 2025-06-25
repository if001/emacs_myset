

;;; 24-completion-search.el --- use vertico:

;;; Commentary:
;; 参考: https://joppot.info/posts/2d8a8c1d-6d7f-4cf8-a51a-0f7e5c7e3c80

;;; Code:

;;; Vertico: ミニバッファ補完UIの強化
(use-package vertico
  :init
  (vertico-mode)
  :config
  ;; 必要に応じてカスタマイズ
  (setq vertico-count 15) ;; Show more candidates
  (setq vertico-cycle t) ;; 候補の循環を有効にする
  )

;; 補完候補に非常に長い候補が存在するとパフォーマンス上の問題がある。その解消用
(use-package vertico-truncate
  :load-path "site-lisp/vertico-truncate"
  :config
  (vertico-truncate-mode +1))

;; find-file のファイル・ディレクトリ操作時の操作性を向上させる
(use-package vertico-directory
  :ensure nil
  :after vertico
  :bind ( :map vertico-map
          ("<backspace>" . vertico-directory-delete-char)))


;; consult-buffer: 現在展開されている Buffer 一覧の表示だけど、Bookmark なども表示してくれて気が利いている。
;; find-file: 現在のディレクトリのファイル一覧を表示する基本コマンドだけど consult で見れる。
;; consult-line: 一般的なアプリの ctrl+f のような普通の検索ができる。
;; consult-fd: fd を使ってプロジェクト内のファイルをファイル名で検索できる。
;; consult-ripgrep: rg を使ってプロジェクト内のファイルを中の文字列を対象にして検索できる。
;; consult-flycheck: flycheck による error や worning を検索できる。
;; consult-outline: アウトラインの目次を検索できる。
;; consult-imenu: imenu による目次を検索できる。
;;; Consult: コマンドの統一インターフェース
(use-package consult
  :init
  :after (vertico) ; Load after vertico
  :bind
  ("C-s" . consult-line)  ;; バッファ内をキーワードで検索
  ("C-x b" . consult-buffer)
  ("C-x 4 b" . consult-buffer-other-window)
  ("C-r" . consult-ripgrep) ;; ripgrep がインストールされていれば
  ;; ("C-g C-g" . consult-grep) ;; デフォルトの grep コマンドに consult を適用
  ("M-y" . consult-yank-pop) ;; kill-ring の履歴から選択
  )

;;; Orderless: 順不同のマッチング
(use-package orderless
  :init
  ;; Vertico, Consult のデフォルト補完スタイルを orderless に設定
  (setq completion-styles '(orderless basic))
  (setq completion-category-defaults nil)
  (setq completion-category-overrides '((file (styles . (orderless partial-completion)))))
  )

;;; Marginalia: 補完候補に情報表示
(use-package marginalia
  :init
  (marginalia-mode)
  ;; 必要に応じてカスタマイズ
  ;; (setq marginalia-annotators '(marginalia-annotator-file marginalia-annotator-symbol))
  )

;;; Embark: コンテキストに応じたアクションフレームワーク
(use-package embark
  :bind
  ;; M-. で選択中のシンボルを consult-line で検索
  ("M-." . embark-act)
  ;; C-. でembark-dwim (Do What I Mean)を呼び出す
  ("C-." . embark-dwim)
  ;; C-h B で embark-bindings を呼び出し、現在のバッファで利用可能な embark アクションを表示
  ("C-h B" . embark-bindings)
  :config
  ;; Embark と他のパッケージとの連携設定
  ;; Vertico との連携
  ;; (add-to-list 'vertico-buffer-mode-hook #'embark-vertico-setup)
  ;; Consult との連携
  ;; (add-to-list 'consult-preview-hook #'embark-consult-preview-mode)

  ;; Embark のキーマップ設定
  ;; 例えば、ファイルを選択したときに f を押すと find-file する
  ;; (setq embark-general-bindings
  ;;       '("f" . find-file)
  ;;       ("d" . dired-jump)
  ;;       ("e" . find-file-other-window))
  )

;;; Embark-consult: Embark と Consult の連携を強化
(use-package embark-consult
  :after (embark consult)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode) ; Previews in Embark Collect
  :config
  ;; Embark のアクションに Consult コマンドを追加
  ;; (embark-consult-define-keymap)
  )

;;; Emacs の設定（参考）
;; ミニバッファを大きくする
(setq resize-mini-windows t)
(setq mini-window-hscroll t)
(setq mini-window-max-height 0.4)

;; 補完候補の表示数を増やす
(setq completion-cycle-threshold nil)
(setq completion-try-completion nil)
(setq completion-auto-help t)

;; isearch のインクリメンタルサーチをより強力に
(setq search-whitespace-regexp ".*?")

;; ミニバッファの履歴を保存
(setq history-length 100)
(setq history-delete-duplicates t)
(setq savehist-mode t)


;; buffeへの表示をいい感じにしてくれるらしい
(use-package beframe
  :ensure t
  :config
  (defvar consult-buffer-sources)
  (declare-function consult--buffer-state "consult")

  (with-eval-after-load 'consult
    (defface beframe-buffer
      '((t :inherit font-lock-string-face))
      "Face for `consult' framed buffers.")

    (defvar beframe-consult-source
      `( :name     "Frame-specific buffers (current frame)"
         :narrow   ?F
         :category buffer
         :face     beframe-buffer
         :history  beframe-history
         :items    ,#'beframe-buffer-names
         :action   ,#'switch-to-buffer
         :state    ,#'consult--buffer-state))

    (add-to-list 'consult-buffer-sources 'beframe-consult-source))

  (beframe-mode +1)
  )

(message "loaded 24-completion-search")
