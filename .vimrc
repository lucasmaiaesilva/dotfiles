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
Plug 'mattn/emmet-vim'
Plug 'tomasr/molokai'
Plug 'bronson/vim-trailing-whitespace'

" HTML
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'valloric/matchtagalways'

" VUE
Plug 'posva/vim-vue'

" CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'wavded/vim-stylus'
Plug 'groenewege/vim-less'
Plug 'ap/vim-css-color'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'gavocanov/vim-js-indent'

" TypeScript
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" JSX
Plug 'maxmellon/vim-jsx-pretty'

" Git
" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
" Plug 'junegunn/gv.vim'

call plug#end()

" Git
" noremap <Leader>ga :Git add -- .<CR><CR>
" noremap <Leader>gc :Gcommit<CR>
" noremap <Leader>gw :Gwrite<CR>
" noremap <Leader>gsh :Gpush<CR>
" noremap <Leader>gll :Gpull<CR>
" noremap <Leader>gs :Gstatus<CR>
" noremap <Leader>gb :Gblame<CR>
" noremap <Leader>gd :Gvdiff<CR>
" noremap <Leader>gr :Gremove<CR>

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
set wildignore=node_modules/**/*
" The line below set the option to open and close folders on vim
set encoding=utf-8
set fileencoding=utf-8

" Reverse color of selection on visual Mode
hi Visual term=reverse cterm=reverse guibg=Grey

" slow way of never break syntax highlight from vue files
autocmd FileType vue syntax sync fromstart

colorscheme molokai

" set the save mode on ctrl + s on normal and insert mode
nnoremap <C-s> :w<cr>
inoremap <C-s> <Esc>:w<cr>

" set the save and exit mode on ctrl + x
nnoremap <C-x> :x<cr>
inoremap <C-x> <esc>:x<cr>

" set move lines
" option J and option K
" on windows change to <ALT-j> and <ALT-k>
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

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
highlight Visual term=reverse cterm=reverse guibg=Grey

" Abrir nerdtree on default vim command
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"force syntax to aways be nice, danger zone 'cause it can be slow
autocmd BufEnter * :syntax sync fromstart
