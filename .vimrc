set nocompatible  " [required]
filetype off      " [required]

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

" let Vundle manage Vundle [required]
Plugin 'gmarik/Vundle.vim'

"============================================================
" Plugins start here
"============================================================
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'editorconfig/editorconfig-vim'
"============================================================
" Plugins end here
"============================================================

" All of your Plugins must be added before the following line
call vundle#end() " [required]

syntax on
filetype plugin indent on

" Solarized color scheme
syntax enable
set background=dark
:if !empty(glob("$HOME/.vim/bundle/vim-colors-solarized"))
  colorscheme solarized
endif

" Vertical split appears to the right
set splitright

" Horizontal split appears below
set splitbelow

" Use 2 spaces for a tab
set tabstop=2 shiftwidth=2 expandtab

" Show hidden files in NERDTree
" let NERDTreeShowHidden=1

" Always show airline (statusline)
set laststatus=2

" Airline theme
let g:airline_theme='solarized'

" Automatically populate powerline symbol
let g:airline_powerline_fonts=1

" Enable mouse in all modes
set mouse=a

" JSHint
let g:syntastic_javascript_checkers = ['jshint']

" Use JavaScript syntax highlighting for JSON
autocmd BufNewFile,BufRead *.json set ft=javascript

" Auto-open NERDTree when VIM starts without an argument
function! StartUp()
  if 0 == argc()
    NERDTree  " Open NERDTree
    wincmd w  " Switch to the empty split
    wincmd q  " Close the empty split
  end
endfunction

autocmd VimEnter * call StartUp()
