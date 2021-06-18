
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
" Plug 'joshdick/onedark.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'powerline/powerline
Plug 'romainl/Apprentice'
" Plug 'vim-airline/vim-airline'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'scrooloose/nerdtree'
Plug 'kovetskiy/sxhkd-vim'
let g:airline_powerline_fonts = 1
call plug#end()
set termguicolors
colorscheme apprentice
set number
hi Normal guibg=NONE ctermbg=NONE
set mouse=a
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
