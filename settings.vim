" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"-------------------------------------------------------------------------------
" Set up the nvim environment

syntax on
syntax enable
filetype on
filetype plugin on
language en_US.UTF-8
set encoding=utf-8

set shortmess+=I

set nocompatible

" set backupdir=~/.cache/nvim/backup//
" set directory=~/.cache/nvim/swp//
set undodir=~/.cache/nvim/undo//
set undofile

set nobackup
"set noswapfile
set noundofile

let mapleader      = "\<space>"
let maplocalleader = ","

set title
let titlestring="%{substitute(expand('%:p'), $HOME, '$HOME', '')}"

"  >> | Time Settings
" set timeout
" set timeoutlen=750                                        " Time out on mappings
" set ttimeoutlen=250                                       " Time out on key codes
" set updatetime=1000                                       " Idle time to write swap

"  >> | Search
set incsearch                                             " incremental searching
set showmatch                                             " show pairs match
set showcmd                                               " show partial command in status line
set modeline                                              " enable modeline
set hlsearch                                              " highlight search results
set smartcase                                             " smart case ignore
set ignorecase
set matchtime=1                                           " Tenths of a second to show the matching paren
set cpoptions-=m                                          " showmatch will wait 0.5s or until a char is typed

"  >> | History
set history=1000
set undoreload=1000
set undolevels=1000                                       " How many undos
set undoreload=3000                                       " number of lines to save for undo

"  >> | Edit: Wrap, Tabs, Cursor, Copy/Paste, Spacing, Margins
set nojoinspaces                                          " don't J two spaces... replace with one
set formatoptions+=o                                      " Continue comment marker in new lines.
set expandtab                                             " spaces instead of tabs
set hidden                                                " hide the inactive buffers
set bufhidden=delete
set tabstop=2                                             " a tab = two spaces
set shiftwidth=2                                          " number of spaces for auto-indent
set softtabstop=2                                         " a soft-tab of four spaces
set autoindent                                            " set on the auto-indent
set autoread                                              " update a open file edited outside of Vim

set noautochdir                                             " auto change pwd to that of the open file
augroup auto_ch_dir
    autocmd!
    autocmd BufEnter * silent! lcd %:p:h
augroup END


set cursorline                                            " set higlight for cursor line and columm
set nocursorcolumn
set colorcolumn=121
set noshowmode

"set number
" set the starting default"
set nonumber
set noerrorbells                                          " turn off the beeps
set visualbell t_vb=
set ruler
set nowrap
set foldcolumn=1
set textwidth=120
set foldlevel=0
hi  Folded term=NONE cterm=NONE gui=NONE

set backspace=indent,eol,start                            " defines the backspace key behavior
set virtualedit=all                                       " to edit where there is no actual character
set more                                                  " to show pages using `more` in command outpouts

set splitbelow
set splitright

" Work with the OS clipboard
set clipboard=unnamedplus

" Show hidden chars - I will use for a toggle(1/11)
" set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

" Space above and besides the cursor from screen edges
set scrolloff=3
set sidescrolloff=5
set nostartofline                                         " Do not jump to first character with page commands.

"  >> | Wildmenu / Autocomplete
set wildmode=longest,list
set wildmenu                                              " Command line autocompletion
set wildmode=full                                         " Shows all the options
set wildignore+=*.sw?                                     " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~               " Backup files

" q: q/ set the window height
 set cmdwinheight=10

"  >> | Spelling
set spellfile=~/.local/share/nvim/spell/en.utf-8.add
set spell spelllang=en_us
set complete+=kspell
setlocal  spell!

" What not to save in sessions:
set sessionoptions+=options
set sessionoptions+=globals
set sessionoptions+=folds
set sessionoptions+=help
set sessionoptions+=buffers
set sessionoptions+=curdir
set sessionoptions+=resize
set sessionoptions+=winpos
set sessionoptions+=localoptions
"---------------------------------------------------------------------------------------------------------------------
