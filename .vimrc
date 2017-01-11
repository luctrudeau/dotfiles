"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight search results
set hlsearch

" Search while I type
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Highlights
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Show different levels of parentheses in different colors
" https://github.com/luochen1990/rainbow
let g:rainbow_active =1

" Show line numbers
set number

" Display trailing white spaces
let c_space_error = 1

" Display a marker on long lines
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Utilities
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" I'm using fish but some plugins expect bash
set shell=/bin/bash

" System Copy/Paste into vim register
" This makes vim awesome should be there by default!
set clipboard=unnamedplus

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Delete without cutting (no seriously)
nnoremap d "_d
vnoremap d "_d

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

"Show incomplete cmds down the bottom
set showcmd

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Always show the status line
set laststatus=2

"Start scrolling when we're 8 lines away from margins
set scrolloff=8

" Plugins are in ~/.vim/bundle
execute pathogen#infect()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
    " set guifont=Source\ Code\ Pro\ 10
    " set guifont=System\ San\ Francisco\ Display\ 10
    set guifont=DroidSansMono\ 8
    autocmd GUIEnter * set vb t_vb=
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically save before commands like :next and :make
set autowrite

"Reload files changed outside vim
set autoread

" Turn backup off
set directory^=$HOME/.vim/tmp//

" Keep undo history across sessions, by storing in file.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Windows, Splits and Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Awesome way to creat splits
nmap <silent> vv :vsp<CR>
nmap <silent> ss :sp<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Awesome way to manage tabs
nmap <silent> tt :tabnew<CR>
if has('gui_running')
  nnoremap <A-1> 1gt
  nnoremap <A-2> 2gt
  nnoremap <A-3> 3gt
  nnoremap <A-4> 4gt
  nnoremap <A-5> 5gt
  nnoremap <A-6> 6gt
  nnoremap <A-7> 7gt
  nnoremap <A-8> 8gt
  nnoremap <A-9> 9gt
else
" Turns out terminal emulators don't send the alt key
" Go figure... This works with gnome-terminal
" http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
  nnoremap 1 1gt
  nnoremap 2 2gt
  nnoremap 3 3gt
  nnoremap 4 4gt
  nnoremap 5 5gt
  nnoremap 6 6gt
  nnoremap 7 7gt
  nnoremap 8 8gt
  nnoremap 9 9gt
endif

" Show tab number
set showtabline=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctags and build tools
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle tagbar using :tt
cnoreabbrev tt TagbarToggle

" Fuzzy match for ctags
nnoremap <leader>. :CtrlPTag<cr>

" Open quickfix window after grep
autocmd QuickFixCmdPost *grep* cwindow

set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hardcore mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Break old habits
" http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" I'm always hitting these keys by accident
nnoremap <PageUp> <NOP>
nnoremap <PageDown> <NOP>
