set nocompatible              " Use vim settings, rather than vi settings

" use vundle to load plugins
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

" Enable mouse in all modes
set mouse=a

" Make it obvious where 80 characters is
"set textwidth=80
"set colorcolumn=+1

" always show status line
set laststatus=2

" selection exclusive
set selection=exclusive

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Resize splits when the window is resized
au VimResized * :wincmd =

" show invisible characters
set list listchars=tab:»·,trail:·,nbsp:·

" autocomplete settings
set completeopt=longest,menuone

set wildmenu                                     " turn on wild menu
" wildmenu completion
set wildmode=list:longest,full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store?                      " OSX bullshit

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" use the system clipboard
set clipboard=unnamed

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

" open new vertical split and switch over to it
nnoremap <leader>w <C-w>v<C-w>l

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
" ********************** plugin configuration

" vim-ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

" fzf
noremap <leader>p :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" NerdTree
"map <C-n> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
"map <leader>n :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
"
 map <Leader>n :NERDTreeFind<CR>
 map <C-n> :NERDTreeTabsToggle<CR>

" linting neomake
autocmd! BufRead,BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')

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

" vim-rspec mappings
let g:rspec_runner = "os_x_iterm2"
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" tagbar
nnoremap <silent> <leader>tt :TagbarToggle<CR>

set tags=./tags;~/git

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
  let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" emmet

" ********************** custom functions

" clear custom whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
