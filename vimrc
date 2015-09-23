set nocompatible

" ensure vundle works
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

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
set tabstop=2                 " for proper display of files with tabs
set shiftround                " always round indents to multiple of shiftwidth
set copyindent                " use existing indents for new indents
set preserveindent            " save as much indent structure as possible
set virtualedit=onemore

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

" searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set showmatch                 " show matching bracket
set smartcase                 " search ignore case unless one character is upper case
set hlsearch                  " highlight the search
set diffopt=filler,iwhite     " ignore all whitespace and sync
set gdefault                  " substitute globally on lines
"nnoremap / /\v                " turn off vims default regexp handling
"vnoremap / /\v                " turn off vims default regexp handling

" disable swp files
set noswapfile
set nobackup
set nowritebackup
set backup

" Directories for swp files
set backupdir=$HOME/.vim/backup/
set directory=$HOME/.vim/backup/

set title                     " change the terminal's title
set visualbell                " Don't beep
set noerrorbells              " No error bells please

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

let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
" color solarized

" show invisible characters
set list listchars=tab:»·,trail:·,nbsp:·

" selection exclusive
:set selection=exclusive

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" Set syntax highlighting for specific file types
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru,*_spec\.rb}    set ft=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Automatically wrap at 72 characters and spell check git commit messages
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal spell

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

" ********************** ruby

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" enable autocomplete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" ********************** mappings
"
" set <Leader> to ","
let mapleader = ","

" escape edit mode with "jj"
inoremap jj <ESC>
inoremap jk <ESC>
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
"nnoremap <esc> :noh<return><esc>
"nnoremap <CR> :noh<CR><CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" close quickfix window
map <leader>qq :cclose<CR>

map <S-Enter> O<ESC> "inserts new line without going into insert mode

" bash like (emacs style) commandline keys
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" ********************** plugin configuration
"

" ack as grep replacement
" set grepprg=ack
nnoremap <leader>a :Ag<space>

" Command-Shift-F for Ack
map <D-F> :Ag<space>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

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
"let g:ctrlp_split_window = 1 " <CR> = New Tab
"let g:ctrlp_open_new_file = 't' " Open newly created files in a new tab

"Syntastic Options
"let g:syntastic_check_on_open = 1
map <Leader>e :Errors<cr>
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_javascript_checkers = ["eslint"]"

" bling/vim-airline

" Don't show seperators
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 0
" Enable vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#enable_branch     = 1
let g:airline#extensions#enable_syntastic  = 1

" ********************** custom functions
"
" clear custom whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
