
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
Plug 'joshdick/onedark.vim'
" Plug 'powerline/powerline
Plug 'vim-airline/vim-airline'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'scrooloose/nerdtree'
Plug 'kovetskiy/sxhkd-vim'
let g:airline_powerline_fonts = 1
call plug#end()
set termguicolors
colorscheme onedark
set number
hi Normal guibg=NONE ctermbg=NONE
set mouse=a

