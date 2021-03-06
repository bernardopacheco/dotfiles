"
" .vimrc
" Author: Bernardo Pacheco <bernardo@bernardopacheco.net>
" Combine. Solve. Passion.
"

" Configure pathogen.
" More: https://github.com/tpope/vim-pathogen
execute pathogen#infect()

filetype plugin indent on " Enable detection, plugins and indenting in one step
syntax on

" No vi compatible.
set nocompatible

" Change the mapleader from \ to ,
let mapleader = ","
let maplocalleader="\\"

" Strips off two full keystrokes from almost every Vim command
nnoremap ; :

" Prevent some security exploits.
" More: http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html
set modelines=0

" Control over whitespace.
set tabstop=4     " Specifies the width of a tab character.
set shiftwidth=4  " Determines the amount of whitespace to insert or remove
                  "      using the indentation commands in normal mode.
set softtabstop=4 " Fine tunes the amount of whitespace to be inserted.
set expandtab     " Causes spaces to be used in place of tab characters.

" Character encoding.
set termencoding=utf-8
set encoding=utf-8

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=3

" Copy indent from current line when starting a new line.
set autoindent

" If in Insert, Replace or Visual mode put a message on the last line.
set showmode

" Show (partial) command in the last line of the screen.
set showcmd

" set show matching parenthesis
set showmatch

" Search
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                        " case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                        " shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type


" It hides buffers instead of closing them. This means that you can have
" unwritten changes to a file and open a new file using :e, without being forced
" to write or undo your changes first.
" More: http://nvie.com/posts/how-i-boosted-my-vim/#change-vim-behaviour
set hidden

" VIM command line.
set wildmenu              " Make tab completion for files/buffers act like bash.
set wildmode=list:longest " Show a list when pressing tab and complete first
                          "      full match.

" Disable beeping.
set visualbell
set noerrorbells

" Performance boost.
set ttyfast     " Use a faster terminal.
set lazyredraw  " Avoid scrolling problems. Don't update the display while
                "   executing macros.

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Tell VIM to always put a status line in, even if there is only one window.
set laststatus=2

" Use a status bar that is 2 rows high.
set cmdheight=2

" Highlight the screen line of the cursor.
set cursorline

" Display how far away each line is from the current one, instead of showing
" the absolute line number.
set relativenumber

" Show the line and column number of the cursor position.
set ruler

" Handle long lines correctly.
set wrap                " Wrap long lines.
set linebreak           " Prevent words to be splited across two lines.
set nolist              " Ensure that 'linebreak' works.
set textwidth=80        " Maximum allowed width of a line.
set formatoptions=qrn1j " Formats text.
set colorcolumn=+1      " Show a colored column after 'textwidth'.

" Show invisibles.
set list                    " Reveal hidden characters.
set listchars=tab:▸\ ,eol:¬ " Customise the appearance of the characters.

" Undo buffer and history of commands.
set history=1000    " Remember more commands and search history.
set undolevels=1000 " Use many muchos levels of undo.
set undofile        " Create <FILENAME>.un~ files whenever you edit a file.
                    "    These files contain undo information so you can undo
                    "    previous actions even after you close and reopen a file.

" Disable the arrow keys.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Moving around through wrapped lines.
nnoremap j gj
nnoremap k gk
nnoremap 0 g^
nnoremap $ g$
vnoremap j gj
vnoremap k gk
vnoremap 0 g^
vnoremap $ g$

" Split panels
noremap <leader>s <C-W>s
noremap <leader>v <C-w>v
noremap <leader>t :tabnew<cr>

" Navigation among panels
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

" Disable help key.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Quicker escaping.
inoremap jj <ESC>

set guifont=Monaco\ Regular\ 11 " Change font

" Color scheme
if has("gui_running")
    set background=dark
    let g:badwolf_tabline = 2
    let g:badwolf_html_link_underline = 0
    colorscheme badwolf

    " Remove toolbar, left scrollbar and right scrollbar
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
else
    set bg=dark
    colorscheme jellybeans
endif

" Configure ctrlp
" More: https://github.com/kien/ctrlp.vim
set wildignore+=*/node_modules/*,*/bower_components/*,*/build/*,*/dist/*
