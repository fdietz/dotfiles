" mode not vi compatible
set nocompatible

" ********************** pathogen
"

" Load plugins from .vim/bundles using .vim/autoload/pathogen.vim
runtime! ~/.vim/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
" call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundle'))
call pathogen#helptags()

set encoding=utf-8 fileencoding=utf-8
syntax on
set background=dark
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd

" indents and tabs
set autoindent                  " set the cursor at same indent as line above
set smartindent                 " try to be smart about indenting (C-style)
set expandtab                   " expand <Tab>s with spaces; death to tabs!
set shiftwidth=2                " spaces for each step of (auto)indent
set softtabstop=2               " set virtual tab stop (compat for 8-wide tabs)
set tabstop=8                   " for proper display of files with tabs
set shiftround                  " always round indents to multiple of shiftwidth
set copyindent                  " use existing indents for new indents
set preserveindent              " save as much indent structure as possible
filetype plugin indent on       " load filetype plugins and indent settings

set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set backspace=indent,eol,start
set linebreak
"set cmdheight=2               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
set noerrorbells              " No error bells please
set shell=bash
set fileformats=unix
set ff=unix
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins

set wildmode=longest:full
set wildmenu                  " menu has tab completion
let maplocalleader=','        " all my macros start with ,

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

" ********************** look and feel
"

" cursor look and feel
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" default color scheme
color ir_black

" Don't beep
set visualbell

" show invisible characters
set list
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" selection exclusive
:set selection=exclusive

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby


" ********************** status line
"
set laststatus=2
if has('statusline')
        " Status line detail: (from Rafael Garcia-Suarez)
        " %f		file path
        " %y		file type between braces (if defined)
        " %([%R%M]%)	read-only, modified and modifiable flags between braces
        " %{'!'[&ff=='default_file_format']}
        "			shows a '!' if the file format is not the platform
        "			default
        " %{'$'[!&list]}	shows a '*' if in list mode
        " %{'~'[&pm=='']}	shows a '~' if in patchmode
        " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
        "			only for debug : display the current syntax item name
        " %=		right-align following items
        " #%n		buffer number
        " %l/%L,%c%V	line number, total number of lines, and column number
        "function! SetStatusLineStyle()
        "        if &stl == '' || &stl =~ 'synID'
        "                let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}" .
        "                                        \"%{'~'[&pm=='']}"                     .
        "                                        \"%=#%n %l/%L,%c%V "                   .
        "                                        \"git:%{call GitBranch()}"
        "        else
        "                let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}" .
        "                                        \" (%{synIDattr(synID(line('.'),col('.'),0),'name')})" .
        "                                        \"%=#%n %l/%L,%c%V "
        "        endif
        "endfunc
        "call SetStatusLineStyle()

        function! SetStatusLineStyle()
                let &stl="%f %y "                       .
                        \"%([%R%M]%)"                   .
                        \"%#StatusLineNC#%{&ff=='unix'?'':&ff.'\ format'}%*" .
                        \"%{'$'[!&list]}"               .
                        \"%{'~'[&pm=='']}"              .
                        \"%="                           .
                        \"#%n %l/%L,%c%V "              .
                        \""
                 "      \"%#StatusLineNC#%{GitBranchInfoString()}%* " .
        endfunc
        call SetStatusLineStyle()

        if has('title')
                set titlestring=%t%(\ [%R%M]%)
        endif

        "highlight StatusLine    ctermfg=White ctermbg=DarkBlue cterm=bold
        "highlight StatusLineNC  ctermfg=White ctermbg=DarkBlue cterm=NONE
endif

" ********************** mappings
"
" set <Leader> to ","
let mapleader = ","

" indent in visual and insert mode
vmap > >gv
vmap < <gv

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" open current file with Firefox, Google Chrome, Safari
map <silent> <Leader>firefox :! open -a firefox.app %:p<CR>
map <silent> <Leader>chrome :! open -a google\ chrome.app %:p<CR>

" ********************** plugin configuration
"

" ack as grep replacement
set grepprg=ack

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"

" Command-T configuration
let g:CommandTMaxHeight=20
" Cmd-T should open file in your tab by default
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'
" Cmd-T should open window at top
let g:CommandTMatchWindowAtTop = 1 

" run rails/ruby tests (rails.vim)
map <Leader>r :Rake<CR>
map <Leader>R :.Rake<CR>

" ********************** custom functions
"

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" **********************
"

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
