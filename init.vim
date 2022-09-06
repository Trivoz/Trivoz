call plug#begin('C:/Users/rosej/AppData/Local/nvim/plugged') 
" below are some vim plugins for demonstration purpose.
" " add the plugin you want to use here.
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" disable wrapping
set nowrap

" font settings
set encoding=UTF-8

" tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" KEYBINDINGS - IMPORTANT NOT TO FUCK UP
inoremap z' <ESC>

nnoremap <Left> <Nop>
vnoremap <Left> <Nop>
inoremap <Left> <Nop>

nnoremap <Right> <Nop>
vnoremap <Right> <Nop>
inoremap <Right> <Nop>

nnoremap <Up> <Nop>
vnoremap <Up> <Nop>
inoremap <Up> <Nop>

nnoremap <Down> <Nop>
vnoremap <Down> <Nop>
inoremap <Down> <Nop>

imap <Bs> BACK
imap <Del> DELETE


" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
