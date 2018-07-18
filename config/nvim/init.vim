"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state("~/.vim/dein")
  call dein#begin('~/.vim/dein')

  " Let dein manage dein
  " Required:
  " call dein#add('~/.vim/dein/ ./plugin/repos/github.com/Shougo/dein.vim')

  " My bundles/plugins
  call dein#add('itchyny/lightline.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('benmills/vimux')
  call dein#add('edkolev/tmuxline.vim')
  call dein#add('kien/ctrlp.vim')
  call dein#add('flazz/vim-colorschemes')
  call dein#add('rking/ag.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/syntastic')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-commentary')
  call dein#add('ntpeters/vim-better-whitespace')

  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('vim-scripts/AutoComplPop')
  call dein#add('tpope/vim-endwise')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('Shougo/deoplete-rct')

  " Syntax highlighting plugins
  call dein#add('fatih/vim-go')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('mxw/vim-jsx')
  call dein#add('pangloss/vim-javascript')
  call dein#add('posva/vim-vue')
  call dein#add('tpope/vim-rbenv')
  call dein#add('mustache/vim-mustache-handlebars')

  " jellybeans template
  call dein#add('nanotech/jellybeans.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax on

" Install new plugins at startup
if dein#check_install()
  call dein#install()
endif

" Set terminal title to filename
set title

" enable scrolling and mouse-clicks
set mouse=a

" scrooloose/nerdtree
" Open NERDTree automatically when vim starts up if no files were specified
set autoread

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
autocmd BufWritePre *.* :%s/\s\+$//e
set autoread
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

" Place NERDTree on the left side
let g:NERDTreeWinPos = 'left'

let NERDTreeShowHidden=1

" open vsplit right
set splitright

" Set the color scheme
set background=dark

colorscheme jellybeans

" scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" airblade/vim-gitgutter
" Toggle GitGutter on C-g
map <C-g> :GitGutterToggle<CR>
" Stop vim-gitgutter running eagerly
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" benmills/vimux
map qq :VimuxRunLastCommand<CR>
map qe :VimuxPromptCommand<CR>

" edkolev/tmuxline.vim
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : '#(~/.tmux/plugins/tmux-battery/scripts/battery_percentage.sh) Battery',
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#h'}

" Disable usage of cursor keys within insert mode, removes delay when pressing
" <Shift><o> immediately after <Esc>.

" Print the line number in front of each line.
set number

" extend path to current dir
set path+=$PWD/**

" backup dir settings
set backup

" Store swapfiles somewhere else
set directory=$HOME/.config/nvim/swap
set backupdir=$HOME/.config/nvim/swap/

" clean search patterns
let @/ = ""

" Save Tweak
map qw :w<CR>

" Let me hide modified buffers
set hidden

" To clear highlighted matches until next search
" nnoremap <esc> :noh<return><esc>

" Change the leader key from \ to ,
let mapleader=","

" Change replace view
set cpoptions+=$

" To use ,. and ,m (:bn => :bnext; :bp => :bprevious)
map <Leader>. :bnext<CR>
map <Leader>m :bprevious<CR>

" Set terminal title to filename
set title

" Switch syntax highlighting on.
syntax on

" Fix the delete key
" :fixdel

" Number of spaces that a <Tab> in the file counts for.
set tabstop=2

" Controls how many columns Vim uses when <Tab> is pressed in insert mode.
set softtabstop=2

" When set, hitting <Tab> in insert mode will produce the appropriate
" number of spaces.
set expandtab

" How many columns text is indented with reindent operations (>> & <<) and
" automatic C-style indentation
set shiftwidth=2

au FileType sh setl sw=2 sts=2 et

" While typing a search command, show where the pattern, as it was typed so far,
" When a bracket is inserted, briefly jump to the matching one. A Beep is given
" if there is no match.
set showmatch

" Highlight the screen line of the cursor with CursorLine.
" set cursorline " cursorcolumn

" View the changes you have made to a buffer since the file was loaded
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

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

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" whitespace
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" 100 character column
set colorcolumn=100

nnoremap <silent> <leader>x :noh<cr>

" disable highlighting of search results
set hlsearch!

" copying
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

set clipboard+=unnamedplus

" ignore specific dirs for search
set wildignore+=vendor/cache/**,vendor/assets/**,log/**,tmp/**,node_modules/**

" removes trailing whitespace
autocmd BufEnter * EnableStripWhitespaceOnSave

" increase tabsize for C and C++ programs
autocmd Filetype c setlocal ts=4 sts=4 sw=4
autocmd Filetype cpp  setlocal ts=4 sts=4 sw=4

" increase tabsize for Go-Lang programs
autocmd Filetype go setlocal ts=4 sts=4 sw=4
" Handle Dockerfiles correctly
autocmd BufRead,BufNewFile Dockerfile* set filetype=dockerfile
"
autocmd BufRead,BufNewFile *.yml.example set filetype=yaml

set timeoutlen=1000 ttimeoutlen=0

" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif

" Let vim find the current ruby version and ruby_host_prog via rbenv
" ----------------------------------------------------------------------------
let g:ruby_path = system('echo $HOME/.rbenv/shims')
" let $NVIM_RUBY_HOST_PROG = system("echo $(echo $(rbenv whence neovim-ruby-host | tail -1) | sed -e 's/^[ \t]*//')")
" let g:ruby_host_prog = system('echo $HOME/.rbenv/versions/2.4.1/bin/neovim-ruby-host')
let g:syntastic_eruby_ruby_quiet_messages =
    \ {'regex': 'possibly useless use of a variable in void context'}
