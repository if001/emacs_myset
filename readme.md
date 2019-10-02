# readme
### use-package
初回起動時に、use-packageをいれる
`M-x package-install [RET] use-package`

### site-lisp
`site-lisp/`にgitからのコードを配置する

- company-mode  
https://github.com/company-mode/company-mode.git  
- expand-region  
https://github.com/magnars/expand-region.el.git  
- flymake-posframe  
https://github.com/Ladicle/flymake-posframe.git  
- highlight-indent-guides  
https://github.com/DarthFennec/highlight-indent-guides.git  
- init-loader  
https://github.com/emacs-jp/init-loader.git  
- all-the-icons  
https://github.com/domtronn/all-the-icons.el.git  

### all-the-icons
`site-lisp/all-the-icons/fonts`以下のフォントを`~/Libraly/fonts`以下に移動する

### go
gopathをよしなに書き直す

`(add-to-list 'exec-path (expand-file-name "your go path"))`

`$ go get -u -v github.com/nsf/gocode`
