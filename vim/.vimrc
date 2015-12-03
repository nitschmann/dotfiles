" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" Let me hide modified buffers
set hidden

" highlight search matches
set hlsearch

" Change the leader key from \ to ,
let mapleader=","

" Change replace view
set cpoptions+=$

set encoding=utf-8

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'nvie/vim-togglemouse'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'raimondi/delimitMate'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'vim-scripts/Vim-R-plugin'
NeoBundle 'rking/ag.vim'
NeoBundle 'vim-scripts/bash-support.vim'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'vim-scripts/AutoComplPop'
NeoBundle 'vim-scripts/Spacegray.vim'
NeoBundle 'tpope/vim-liquid'
NeoBundle 'wincent/Command-T'
NeoBundle 'fatih/vim-go'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'pangloss/vim-javascript'

NeoBundleCheck

" Airplane
let g:airline_powerline_fonts = 1

" Set terminal title to filename
set title

" Switch syntax highlighting on.
syntax on

filetype off

" Enable loading the plugin files for specific file types.
filetype plugin indent on

call neobundle#end()

" Copy indent from current line when starting a new line.
set autoindent

" Number of spaces that a <Tab> in the file counts for.
set tabstop=2

" Controls how many columns Vim uses when <Tab> is pressed in insert mode.
set softtabstop=2

" always uses spaces instead of tab characters
set expandtab

" How many columns text is indented with reindent operations (>> & <<) and
" automatic C-style indentation
set shiftwidth=2

" When on, a <Tab> in front of a line inserts balnks according to 'shiftwidth'
set smarttab

set backspace=indent,eol,start

" Maximum width of text that is being inserted. A longer line will be broken
" after whitespace to get this width. A zero value disables this.
set textwidth=79

" When set to dark, Vim will try to use colors that look good on a dark
" background.
" set background=dark

colorscheme twilight256

" Print the line number in front of each line.
set number

autocmd filetype javascript set shiftwidth=2

" While typing a search command, show where the pattern, as it was typed so far,
" When a bracket is inserted, briefly jump to the matching one. A Beep is given
" if there is no match.
set showmatch

set laststatus=2

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

" set AirlineTheme
let g:airline_theme='bubblegum'

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

autocmd BufWritePre *.* :%s/\s\+$//e

" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Place NERDTree on the left side
let g:NERDTreeWinPos = 'left'

let NERDTreeShowHidden=1

" open vsplit right
set splitright

" splits always to the bottom
set splitbelow

" Adjust viewports to the same size
map <Leader>= <C-w>=

" 80 character column
set colorcolumn=80

" extend path to current dir
set path+=$PWD/**

" clean search patterns
let @/ = ""

" let :vimgrep work correctly
set directory=.,$TEMP

" backup dir settings
set backup

" just write cache and swap files for the session time to save space
" set backupdir=/tmp/vim/backup
" set dir=/tmp/vim/swap
set backupdir=~/.vim/tmp//
set dir=~/.vim/swap//

" disable highlighting of search results
set hlsearch!

" enable scrolling and mouse-clicks
set mouse=a

" ignore specific dirs for search
set wildignore+=vendor/cache/**,vendor/assets/**,log/**,tmp/**,node_modules/**

" use system clipboard
set clipboard=unnamed

augroup CommandTExtension
  autocmd!
  autocmd FocusGained * CommandTFlush
  autocmd BufWritePost * CommandTFlush
  autocmd FileWritePost * CommandTFlush
  autocmd BufDelete * CommandTFlush
augroup END
