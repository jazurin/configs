"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'brookhong/cscope.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-commentary'
Plugin 'majutsushi/tagbar'
Plugin 'sukima/xmledit'
"experimental:
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'mfukar/robotframework-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50 "keep 50 lines of command line history
set incsearch "do incremental searching
set ruler "show the cursor position all the time
set laststatus=2 "show 2 lines of status
set number "show line numbers
set title "show file title
set listchars=trail:. "show spaces as white spaces
set list "enable listchars
set omnifunc=syntaxcomplete#Complete "turn on omnicompletion
set wildmenu "show autocompletion matches above status bar
set hidden "allow moving to another buffer without writing first
set scrolloff=1 "show 1 line before top or bottom of file

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256 "set colors to 256 to support colorschemes that need it

if has("gui_running")
    colorscheme solarized
    " No menus and no toolbar
    set guioptions-=m
    set guioptions-=T
    set columns=184
    set lines=53
else
    colorscheme gruvbox "supports better search highlighting
endif

set background=dark "set background after loading colorscheme

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight when going beyond 80 columns
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('+colorcolumn')
   set colorcolumn=80
else
   highlight OverLength ctermbg=red ctermfg=white guibg=#592929
   match OverLength /\%80v.\+/
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrl_working_path_mode='ra'
" let CtrlP ignore these dirs/files
set wildignore+=*/obj/*,*.so,*.swp,*.gz

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map  <C-n> :NERDTreeToggle<ESC>
nmap <F8> :TagbarToggle<CR>
" cycle through buffers using TAB and shift+TAB
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ttimeoutlen=50 "Switch back from insert to normal faster
"show buffers and numbers on the top status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:aghighlight=1 "highlight the found search pattern
