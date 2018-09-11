" ConfiguraÂ§cao do Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
" before set this you have to install fzf by homebrew
set rtp+=/usr/local/opt/fzf

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'posva/vim-vue'
Plugin 'pangloss/vim-javascript'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'

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
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>


" set the save and exit mode on ctrl + x
nnoremap <C-x> :x<cr>
inoremap <C-x> <esc>:x<cr>a

" set the fuzzySearch on ';' key
nnoremap ; :Files<CR>

" config the lightline plugin
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" show hidden files on NERDTree
let NERDTreeShowHidden=1


syntax enable

" Abrir nerdtree on default vim command
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
