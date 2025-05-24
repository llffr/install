set number
set relativenumber

" Set tabs and indentation
set tabstop=4       " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4    " Number of spaces used for each step of (auto)indent
set expandtab       " Use spaces instead of tabs
set autoindent      " Copy indent from current line when starting a new line

" Enable syntax highlighting
syntax on

" Enable line wrapping
set wrap

" Show matching brackets
set showmatch

" Highlight search results
set hlsearch
set incsearch       " Show search matches as you type

" Ignore case in search unless there's a capital letter
set ignorecase
set smartcase

" Show line and column in the status line
set ruler

" Set backspace behavior to be more intuitive
set backspace=indent,eol,start

" Enable mouse support (in GUI and some terminals)
set mouse=a

" Disable swap files
set noswapfile

" Enable clipboard (only in Vim compiled with +clipboard)
set clipboard=unnamedplus

" Show command as you type
set showcmd

" Better command-line completion
set wildmenu
