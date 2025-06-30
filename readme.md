# readme

## install
`install.sh`で必要なrepositoryをclone

`brew install ripgrep` grep

`brew install fd` 高速find

`brew install git-delta` git-diffを見やすく

emacsを一度起動してから、use-packageで必要なpackageをinstall後

`M-x nerd-icons-install-fonts required`
`tab`
`M-x treesit-install-language-grammar RET python RET`



### site-lisp
`site-lisp/`にgitからのコードを配置する

- expand-region  
https://github.com/magnars/expand-region.el.git  
- flymake-posframe  
https://github.com/Ladicle/flymake-posframe.git  
- init-loader  
https://github.com/emacs-jp/init-loader.git  


### all-the-icons
`M-x all-the-icons-install-fonts`

### nerd-icon
`M-x nerd-icons-install-fonts`

### LSP
`M-x lsp-install-server` でserverのinstall

### python
`brew install tree-sitter`

[pylsp](https://github.com/python-lsp/python-lsp-server)  
`brew install python-lsp-server`

以下でtreesitをインストールしておく
`M-x treesit-install-language-grammar RET python RET`

### go
gopathをよしなに書き直す

`(add-to-list 'exec-path (expand-file-name "your go path"))`

`$ go get -u -v github.com/nsf/gocode`


### Vertico と Consult
Consultで、bufferやファイルなどの候補を表示

