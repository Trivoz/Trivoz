" init.vim
" Mainainer: Joshua Rose
" Version 2.1

set nowrap

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set backspace=indent,eol,start

" coc-related binds
set complete-=i
set nrformats-=octal

" tab settings
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
set invrelativenumber

if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

set autoread

" https://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim
autocmd BufWritePre *.py :%s/\s\+$//e

if empty(mapcheck('<C-L><C-L>'))
endif

nmap <C-L><C-L> :set invrelativenumber<CR>

" Force mandatory leader change
inoremap z' <ESC>
nmap qq :wqa<CR>

if findfile('plugin/vimbegood', &rtp) ==# ''
  let g:vim_be_good_log_file = 1
endif

if findfile('plugin/telescope', &rtp) ==# ''
  nnoremap <silent> ;f <cmd>Telescope find_files<cr>
  nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
  nnoremap <silent> \\ <cmd>Telescope buffers<cr>
  nnoremap <silent> ;; <cmd>Telescope help_tags<cr>
  autocmd User TelescopePreviewerLoaded setlocal wrap
endif  

if findfile('plugin/airline', &rtp) ==# ''
  let g:airline#extentions#tabline#enabled = 1
  let g:airline#extentions#clock#format = '%H:%M:%S'
  let g:airline#extentions#clock#updatetime = 1000
endif

call plug#begin()
  " Dependancy plugins
  Plug 'sharkdp/fd'
  Plug 'BurntSushi/ripgrep'
  Plug 'sainnhe/everforest'
  Plug 'nvim-lua/plenary.nvim'

  " Syntax highlighting
  Plug 'ellisonleao/gruvbox.nvim'

  " Aesthetically p l e a s i n g
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'ryanoasis/vim-devicons'

  " Quality of life plugins
  Plug 'junegunn/vim-easy-align'

  " Completion plugins
  Plug 'neoclide/coc.nvim'
  
  " File management
  Plug 'junegunn/fzf'

  " Blazingly Fast!
  Plug 'ThePrimeagen/harpoon'
  Plug 'ThePrimeagen/vim-be-good'

  " file-gui managers
  Plug 'scrooloose/nerdtree'
  Plug 'nvim-telescope/telescope.nvim'

  " Trackers
  Plug 'wakatime/vim-wakatime'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'

  " Social plugins
  Plug 'andweeb/presence.nvim'

  " NvCHAD Plugins
  Plug 'sheerun/vim-polyglot'
  Plug 'folke/which-key.nvim'
  Plug 'lewis6991/gitsigns.nvim'
call plug#end()

" Supress warnings and providers in :checkhealth reports
let g:python3_host_prog = 'C:\ProgramData\scoop\shims\python3.exe'
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

" custom commands
function! Wpy()
    exec winheight(0)/4."split" | terminal python3 %
endfunction

" Invoke debug for discord rpc
" let g:presence_log_level = "debug"
" allow rpc to detect: on line l of lines 
let g:presence_enable_line_number = 1

set background=dark
colorscheme gruvbox

" map tab to autocomplete coc commands
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Modify auto response time for coc
set updatetime=300
" prevent shifting text
set signcolumn=yes

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" shows documentation in a separate window
nnoremap <silent> K :call ShowDocumentation()<CR>

lua << EOF
require('lualine').setup {
  options = {
    theme = 'auto',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    ignore_focus = {},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', {
        'diagnostics', sources={'nvim_lsp', 'coc'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'buffers'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  },
  extensions = {}
}
EOF

nnoremap <C-Z> :call Wpy() <CR>
