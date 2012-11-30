set nocompatible
filetype off

" init vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" my bundles here
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails.git'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'

filetype plugin indent on     " load filetype plugins and indent settings

set encoding=utf-8 fileencoding=utf-8
syntax on
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set hidden                    " hide buffers instead of closing them
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd

" indents and tabs
set autoindent                " set the cursor at same indent as line above
set smartindent               " try to be smart about indenting (C-style)
set expandtab                 " expand <Tab>s with spaces; death to tabs!
set shiftwidth=2              " spaces for each step of (auto)indent
set softtabstop=2             " set virtual tab stop (compat for 8-wide tabs)
set tabstop=8                 " for proper display of files with tabs
set shiftround                " always round indents to multiple of shiftwidth
set copyindent                " use existing indents for new indents
set preserveindent            " save as much indent structure as possible

set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set backspace=indent,eol,start  " allow backspacing over everything
set linebreak
set cmdheight=1               " command line one line high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set shell=bash
set fileformats=unix
set ff=unix

filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

" searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

" Directories for swp files
set backup
set backupdir=$HOME/.vim/backup/
set directory=$HOME/.vim/backup/

set title                     " change the terminal's title
set visualbell                " Don't beep
set noerrorbells              " No error bells please

set autoread                  " automatically reload changes if detected

" ********************** look and feel
"
"set cursorline

" cursor look and feel
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

set background=dark
" default color scheme
" color ir_black
color molokai

" show invisible characters
"set list
" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬

" selection exclusive
:set selection=exclusive

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" allow movement everwhere
"set virtualedit=all

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" wildmenu completion
set wildmode=list:longest
set wildmenu

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store?                      " OSX bullshit

" always show status line
set laststatus=2

" ********************** mappings
"
" set <Leader> to ","
let mapleader = ","

" escape edit mode with "jj"
inoremap jj <ESC>

" indent in visual and insert mode
vmap > >gv
vmap < <gv

" Command-][ to increase/decrease indentation
vmap <D-]> >gv
vmap <D-[> <gv

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" open current file with Firefox, Google Chrome, Safari
map <silent> <Leader>firefox :! open -a firefox.app %:p<CR>
map <silent> <Leader>chrome :! open -a google\ chrome.app %:p<CR>

" open vertical split and switch over to it
nnoremap <leader>w <C-w>v<C-w>l

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" line wrapping is enabled, cursor down will jump "over" the current line
nnoremap j gj
nnoremap k gk

" resize horizontal split window
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" clear last search highlighting
nnoremap <esc> :noh<return><esc>
nnoremap <CR> :noh<CR><CR>

" close quickfix window
map <leader>qq :cclose<CR>

" ********************** plugin configuration
"

" ack as grep replacement
set grepprg=ack
nnoremap <leader>a :Ack<space>

" Command-Shift-F for Ack
map <D-F> :Ack<space>

" NerdTree
map <C-n> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>n :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" CtrlP plugin
map <leader>p :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>
let g:ctrlp_working_path_mode = 2 " Smart path mode
let g:ctrlp_mru_files = 1 " Enable Most Recently Used files feature
let g:ctrlp_jump_to_buffer = 2 " Jump to tab AND buffer if already open
let g:ctrlp_split_window = 1 " <CR> = New Tab
let g:ctrlp_open_new_file = 't' " Open newly created files in a new tab

" ********************** custom functions
"
" clear custom whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
