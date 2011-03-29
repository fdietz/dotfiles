call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible

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
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,test/fixtures/*,vendor/gems/*

" set <Leader> to ","
let mapleader = ","

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

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

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
color desert

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

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

" hide toolbar
set guioptions-=T

" hide menu
set guioptions-=m

" hide right scrollbar
set guioptions-=r

" hide left scrollbar
set guioptions-=l

" hide left scrollbar when using multiple buffers
set guioptions-=L

" color scheme changer
nmap <silent> <Leader>1 :colorscheme desert<CR>
nmap <silent> <Leader>2 :colorscheme twilight<CR>
nmap <silent> <Leader>3 :colorscheme xoria256<CR>
nmap <silent> <Leader>4 :colorscheme ir_black<CR>
nmap <silent> <Leader>5 :colorscheme mustang<CR>

" open current file with Firefox, Google Chrome, Safari
map <silent> <Leader>firefox :! open -a firefox.app %:p<CR>
map <silent> <Leader>chrome :! open -a google\ chrome.app %:p<CR>

" quickly switch buffers
map <Leader>j :b#<CR>

" change to ~/Desktop directory
nmap <Leader>d :cd ~/Desktop<CR>:e.<CR>

" space instead of esc to enter command line
nmap <space> :

" get out of INSERT mode with jj
inoremap jj <ESC>
cnoremap jj <ESC>

" indent in visual and insert mode
vmap > >gv
vmap < <gv

" indent with tab and shift-tag in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv

" map control left and control right to swap the buffer
map <C-A-right> <ESC>:bn<CR>
map <C-A-left> <ESC>:bp<CR>

" ctags.vim
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"

" map <D-d> :execute 'NERDTreeToggle ' . getcwd()<CR>
" navigates nerdtree to the current file
" map <leader><S-d> :NERDTree %:p:h<CR> 

" ,w will easily switch window focus
map <leader>w <C-w>w

" Clean up the trailing spaces
nmap <leader><S-s> :call Preserve("%s/\\s\\+$//e")<CR>

" <Leader> timeout 
set timeoutlen=500

" run test with Cmd-r and Cmd-R (depends on rails.vim)
" map <D-r>:Rake<CR>
" map <D-R>:.Rake<CR>

" settings for VimClojure
let g:vimclojure#HighlightBuiltins=1   " Highlight Clojure's builtins
let g:vimclojure#ParenRainbow=1        " Rainbow parentheses'!
let g:vimclojure#DynamicHighlighting=1 " Dynamically highlight functions
"let vimclojure#NailgunClient="/Users/hinmanm/bin/ng" " Nailgun location
"let vimclojure#WantNailgun=1
"let vimclojure#SplitPos = "right"

" Leader shortcuts for Rails commands
map <Leader>m :Rmodel
map <Leader>c :Rcontroller
map <Leader>v :Rview
map <Leader>u :Runittest
map <Leader>f :Rfunctionaltest

map <Leader>r :Rake<CR>
map <Leader>R :.Rake<CR>



