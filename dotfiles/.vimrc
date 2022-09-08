filetype off
set shellslash

" disable wrapping
set nowrap

" font settings
set encoding=UTF-8

" tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" KEYBINDINGS - IMPORTANT NOT TO FUCK UP
inoremap <esc> :echo "Escape remapped to z'"<CR>
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


" VISUAL SETTINGS
syntax on
syntax enable

" --- COLOR SETTINGS --- "
if (empty($TMUX))
    if (has("termguicolors"))
        set termguicolors
    endif
endif


" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

imap <Bs> BACK
imap <Del> DELETE


" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start
