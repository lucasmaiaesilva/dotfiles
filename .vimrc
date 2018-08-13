" Configura§cao do Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
Plugin 'crusoexia/vim-javascript-lib'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'

call vundle#end()            " required
filetype plugin indent on    " 

set clipboard=unnamed
set cursorline
set number
set wildmenu
set smartcase
set noswf
set noshowmode
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set splitbelow
set splitright
" The line below set the option to open and close folders on vim
set encoding=utf-8
set fileencoding=utf-8

" set the save mode on ctrl + s on normal and insert mode
noremap <C-s> :w<CR>
noremap <C-s> <Esc>:w<CR>a

" set the fuzzy search shortcut
" noremap ; :Files<CR>

syntax enable

" Abrir nerdtree on default vim command
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" emmet
let g:user_emmet_leader_key='\'

" javascript vim
let g:javascript_plugin_flow = 1

