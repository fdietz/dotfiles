set nocompatible              " Use vim settings, rather than vi settings

" use Plug to load plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype indent plugin on     " Enable filetype detection and specific indenting

syntax on                     " syntax highlighting

set encoding=utf-8 fileencoding=utf-8

set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set numberwidth=1             " min width of number column to the left
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
set ttimeoutlen=50            " make esc work faster

" searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set showmatch                 " show matching bracket
set smartcase                 " search ignore case unless one character is upper case
set hlsearch                  " highlight the search
set diffopt=filler,iwhite     " ignore all whitespace and sync
set gdefault                  " substitute globally on lines

" fix default regexp handling by automatically inserting \v before any search string
nnoremap / /\v
vnoremap / /\v

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

set mouse=a                   " Enable mouse in all modes

set laststatus=2              " always show status line

set selection=exclusive       " selection exclusive

set splitbelow                " open split panes to bottom by default
set splitright                " open split panes to right by default

au VimResized * :wincmd =     " Resize splits when the window is resized

set list listchars=tab:»·,trail:·,nbsp:·         " show invisible characters

set completeopt=longest,menuone                  " autocomplete settings

set wildmenu                                     " turn on wild menu
set wildmode=list:longest,full                   " wildmenu completion

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store?                      " OSX bullshit
set wildignore+=node_modules                     " Node modules
set wildignore+=deps                             " Elixir dependencies
set wildignore+=_build                           " Elixir build

let macvim_hig_shift_movement = 1                " MacVIM shift+arrow-keys behavior (required in .vimrc)

set clipboard=unnamed                            " use the system clipboard

" ********************** look and feel

" set true colors
if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif

" cursor look and feel
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

set background=dark
" default color scheme
" color gruvbox
color hybrid
" color onedark
" color muon


" gruvbox
let g:gruvbox_contrast_dark="medium"
let g:gruvbox_termcolors=256

" Solid line for vsplit separator
"set fillchars=vert:│
set cursorline          " highlight current line

" change cursor shape in insert/normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
  " vertical bar in insert mode
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  " block in normal mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" ********************** Spellcheck

" Spelling highlights. Use underline in term to prevent cursorline highlights
" from interfering
if !has("gui_running")
  hi clear SpellBad
  hi SpellBad cterm=underline ctermfg=red
  hi clear SpellCap
  hi SpellCap cterm=underline ctermfg=blue
  hi clear SpellLocal
  hi SpellLocal cterm=underline ctermfg=blue
  hi clear SpellRare
  hi SpellRare cterm=underline ctermfg=blue
endif

" ********************** Filetype

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,config.ru,*_spec\.rb}    set ft=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.pm set filetype=perl
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" Enable spellchecking for Markdown
autocmd FileType markdown setlocal spell

" Automatically wrap at 80 characters for Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Automatically wrap at 72 characters and spell check git commit messages
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal spell

" ********************** mappings
"
" set <Leader> to ","
let mapleader = ","
let maplocalleader = "\\"

" escape edit mode with "jj"
inoremap jj <ESC>
inoremap jk <ESC>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" line wrapping is enabled, cursor down will jump "over" the current line
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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

" clear search highlighting
"nnoremap <cr> :nohlsearch<cr>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" save file
nnoremap s :w<cr>

" yank to end of line
nnoremap Y y$

" toggling wrap/nowrap
nmap <Leader>w :set wrap!<cr>
nmap <Leader>W :set nowrap<cr>

" buffer resizing mappings (shift + arrow key)
nnoremap <S-Up> <c-w>+
nnoremap <S-Down> <c-w>-
nnoremap <S-Left> <c-w><
nnoremap <S-Right> <c-w>>

" indent on paste
nnoremap p ]p
" paste without indent
nnoremap <c-p> p

" Execute dot in the selection
vnoremap . :norm.<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" open file in chrome
nmap <silent> <leader>ch :exec 'silent !open -a "Google Chrome" % &'<CR>
" ********************** plugin configuration

" vim-ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" fzf plugin
nnoremap <C-p> :<C-u>FZF<CR>
map <leader>p :<C-u>FZF<cr>
map <leader>a :Ag<Space>
nmap <Leader>b :Buffers<CR>

" NerdTree
map <Leader>n :NERDTreeFind<CR>
map <C-n> :NERDTreeTabsToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
let g:ctrlp_dont_split = 'NERD_tree_2'

" linting neomake
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
let g:eslint_path = StrTrim(system('PATH=$(npm bin):$PATH && which eslint'))

autocmd! BufRead,BufWritePost * Neomake
" let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
" let g:neomake_jsx_enabled_makers = ['eslint', 'flow']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_eslint_exe = g:eslint_path
let g:neomake_javascript_flow_exe = g:flow_path
let g:neomake_jsx_flow_exe = g:flow_path

let g:neomake_warning_sign = {
  \ 'text': '!',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': '✗',
  \ 'texthl': 'ErrorMsg',
  \ }

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

set tags=./tags;~/git

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
  let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" ludovicchabant/vim-gutentags
let g:gutentags_cache_dir = '~/.tags_cache'

" vim-jsx
let g:jsx_ext_required = 0

" ********************** custom functions
" return to last edited line when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" clear custom whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
