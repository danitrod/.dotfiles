set number
set tabstop=2
set shiftwidth=2

packadd! dracula
syntax enable
colorscheme dracula

call plug#begin()
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'preservim/nerdcommenter'
call plug#end()

