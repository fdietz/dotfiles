if has("gui_macvim")

  " *************************** gui options
  "

  " hide scrollbar, hide toolbar
  set guioptions=aAce

  " font
  set gfn=Monaco:h13

  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

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

  " **************************** mappings
  "

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

  " Command-T for CommandT
  macmenu &File.New\ Tab key=<D-T>

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt

  map <silent> <D-A-right> :tabnext<CR>
  map <silent> <D-A-left> :tabprevious<CR>

end

" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
