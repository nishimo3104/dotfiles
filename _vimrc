set nocompatible               " be iMproved
filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=blue
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomasr/molokai'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on


"
 " display
 " ----------------------
 " colorscheme railscasts
 set number " show line number
 set showmode " show mode
 set title " show filename
 set ruler
 set list " show eol,tab,etc...
 set listchars=tab:>-,trail:-,extends:>,precedes:< " eol:$
 set laststatus=2
 " set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
 set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

 " edit
 " ----------------------
 set autoindent
 set smartindent
 set expandtab
 set smarttab
 set tabstop=2 shiftwidth=2 softtabstop=0
 set showmatch " show mactch brace
 set wildmenu
 set clipboard=unnamed " share OS clipboard
 set autoread
 set hidden
 set showcmd
 set backspace=indent,eol,start

 highlight link ZenkakuSpace Error
 match ZenkakuSpace /　/

 " move
 " ----------------------
 nnoremap j gj
 nnoremap k gk
 set whichwrap=b,s,h,l,<,>,[,]

 " When insert mode, enable hjkl and enable go to home/end.
 imap <c-o> <END>
 imap <c-a> <HOME>
 imap <c-h> <LEFT>
 imap <c-j> <DOWN>
 imap <c-k> <UP>
 imap <c-l> <Right>

 " search
 " ----------------------
 set incsearch
 set ignorecase
 set smartcase
 " set hlsearch

 " no bell
 set visualbell
 set t_vb=

 " backup
 " --------------------
 set backup
 set backupdir=~/.vim/vim_backup
 set swapfile
 set directory=~/.vim/vim_swap

 " key map
 " --------------------
 let mapleader = ","
 noremap <CR> o<ESC>

  "自動的に閉じ括弧を入力
  imap { {}<LEFT>
  imap [ []<LEFT>
  imap ( ()<LEFT>

 " auto command
 " --------------------
 augroup BufferAu
    autocmd!
    " change current directory
    autocmd BufNewFile,BufRead,BufEnter * if isdirectory(expand("%:p:h")) && bufname("%") !~ "NERD_tree" | cd %:p:h | endif
 augroup END

