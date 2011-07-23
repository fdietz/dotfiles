" mode not vi compatible
set nocompatible

" Load plugins from .vim/bundles using .vim/autoload/pathogen.vim
runtime! ~/.vim/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
" call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundle'))
call pathogen#helptags()

" On some Linux systems, this is necessary to make sure pathogen picks up ftdetect directories in plugins
filetype off

" set <Leader> to ","
let mapleader = ","
" <Leader> timeout 
set timeoutlen=500

filetype on
filetype plugin on
filetype indent on

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" selection exclusive
:set selection=exclusive

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn

" Status bar
set laststatus=2

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" make uses real tabs
au FileType make                                     set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile *.txt call s:setupWrapping()

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=79

" Use modeline overrides
set modeline
set modelines=10

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" toggle comments
vmap <D-/> ,c<space>gv
map <D-/> ,c<space>
imap <D-/> <esc>,c<space>

" indent in visual and insert mode
vmap > >gv
vmap < <gv

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Directories for swp files
set backup
set backupdir=$HOME/.vim/backup/
set directory=$HOME/.vim/backup/

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" ack as grep replacement
set grepprg=ack

" cursor look and feel
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" default color scheme
color ir_black

" open current file with Firefox, Google Chrome, Safari
map <silent> <Leader>firefox :! open -a firefox.app %:p<CR>
map <silent> <Leader>chrome :! open -a google\ chrome.app %:p<CR>

" Clean up the trailing spaces
map <Leader>I :call Preserve("normal gg=G")<CR>:call Preserve("%s/\\s\\+$//e")<CR>
" a function that preserves the state when commands are called
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" run rails/ruby tests (rails.vim)
map <Leader>r :Rake<CR>
map <Leader>R :.Rake<CR>

" Command-T configuration
let g:CommandTMaxHeight=20
" Cmd-T should open file in your tab by default
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'
" Cmd-T should open window at top
let g:CommandTMatchWindowAtTop = 1 

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

