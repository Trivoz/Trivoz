echo "Vimrc loaded from ~/.config/nvim/init.vim"
call plug#begin()
Plug 'ellisonleao/gruvbox.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'hoob3rt/lualine.nvim'
Plug 'brooth/far.vim'
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'LinArcX/telescope-command-palette.nvim'
Plug 'Verf/telescope-everything.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'ThePrimeagen/harpoon'
Plug 'jonls/redshift'
Plug 'andweeb/presence.nvim'
Plug 'neoclide/coc.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'wakatime/vim-wakatime'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sainnhe/everforest'
Plug 'sharkdp/fd'
Plug 'scrooloose/nerdtree'
Plug 'lsdr/monokai'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/screensaver.vim'
Plug 'enricobacis/vim-airline-clock'
call plug#end()

set nowrap
set encoding=UTF-8
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set invrelativenumber
set statusline=\PATH:\ %r%F\ \ \ \ \LINE:\ %l/%L/%P\ TIME:\ %{strftime('%c')}

" nmap ; :Telescope<CR>
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

nmap <C-L><C-L> :set invrelativenumber<CR>
inoremap z' <ESC>
nnoremap <silent>K :Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> <C-j> :Lspsaga diagnostic_jump_next<CR>
nmap qq :wqa<CR>
set background=dark
colorscheme gruvbox

let g:vim_be_good_log_file = 1 " Set vim to log files
let g:airline#extentions#tabline#enabled = 1 " Enable buffers
let g:airline#extensions#clock#format = '%H:%M:%S'
let g:airline#extensions#clock#updatetime = 1000

autocmd User TelescopePreviewerLoaded setlocal wrap
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w
" command! Scratch lua require'tools'.makeScratch()
