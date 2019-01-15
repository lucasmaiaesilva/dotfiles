" ConfiguraÂ§cao do Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

""plug.vim

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'tomasr/molokai'

call plug#end()

set rtp+=/usr/local/opt/fzf
map <C-p> :FZF<CR>
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
set ma
" The line below set the option to open and close folders on vim
set encoding=utf-8
set fileencoding=utf-8

" slow way of never break syntax highlight from vue files
autocmd FileType vue syntax sync fromstart

colorscheme molokai

" set the save mode on ctrl + s on normal and insert mode
nnoremap <C-s> :w<cr>
inoremap <C-s> <Esc>:w<cr>


" set the save and exit mode on ctrl + x
nnoremap <C-x> :x<cr>
inoremap <C-x> <esc>:x<cr>a

" set quit button on ctrl + q
nnoremap <C-q> :q<cr>
inoremap <C-q> :q!<cr>

" set the nerdtree toogle on space key
nnoremap <space> :NERDTreeToggle %<CR>

" set the fuzzySearch on ';' key
nnoremap ; :Files<CR>

" set the navigation between screens only on crtl + direction, removing thw `w` key
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
