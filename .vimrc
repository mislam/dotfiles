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
Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
"============================================================
" Plugins end here
"============================================================

" All of your Plugins must be added before the following line
call vundle#end() " [required]

syntax on
filetype plugin indent on

" Make backspace work like most other apps
set backspace=2

" Show line numbers
set number

" Show invisible characters
set list
set listchars=tab:>-,trail:.,extends:>,precedes:<

" Highlight search results
set hlsearch

" Solarized color scheme
syntax enable
set background=dark
:if !empty(glob("$HOME/.vim/bundle/vim-colors-solarized"))
  colorscheme base16-default
endif

" Vertical split appears to the right
set splitright

" Horizontal split appears below
set splitbelow

" Use 2 spaces for a tab
set tabstop=2 shiftwidth=2 expandtab

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

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

" Use Ag for search
let g:agprg="ag --column"

" Enable file type detection
filetype on

" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

" Treat .md files as Markdown
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

" Set backup, swap and undo directories
set swapfile
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Auto-open NERDTree when VIM starts without an argument
function! StartUp()
  if 0 == argc()
    NERDTree  " Open NERDTree
    wincmd w  " Switch to the empty split
    wincmd q  " Close the empty split
  end
endfunction

autocmd VimEnter * call StartUp()


" ============
" Key Bindings
" ============

" File tree browser
map \           :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \|          :NERDTreeFind<CR>
