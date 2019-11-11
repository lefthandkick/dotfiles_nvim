" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"******************************************************************************

"--[ Elixir-ls/Elixir-ls (Download and Complile) ]-- {{{2
  let g:elixirls = {
  \ 'path': printf('%s/%s', stdpath('config'), 'elixir-ls'),
  \ }
  " used to build JakeBecker's version
  " \ 'path': printf('%s/%s', stdpath('config'), 'bundle/elixir-ls'),

  let g:elixirls.lsp = printf(
  \ '%s/%s',
  \ g:elixirls.path,
  \ 'release/language_server.sh')

function! g:elixirls.compile(...)
  let l:commands = join([
    \ 'mix local.hex --force',
    \ 'mix local.rebar --force',
    \ 'mix deps.get',
    \ 'mix compile',
    \ 'mix elixir_ls.release'
    \ ], '&&')

  echom '>>> Compiling elixirls'
  silent call system(l:commands)
  echom '>>> elixirls compiled'
endfunction
"}}}

filetype off
call plug#begin('~/.local/share/nvim/plug_ins')
"******************************************************************************

"  Visual / UI
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/_ui_.vim
  Plug 'Yggdroot/indentLine'
  Plug 'lifepillar/vim-solarized8'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'


" Utilities
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/_utils_.vim
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'mhinz/vim-startify'
  Plug 'lifepillar/vim-cheat40'
  Plug 'chrisbra/Colorizer'
  Plug 'kassio/neoterm'
  Plug 'tpope/vim-projectionist'

" File and Buffer stuff & Registers
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/_files_buf_reg_.vim
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'moll/vim-bbye'
  Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
  Plug 'junegunn/vim-peekaboo'
  " Plug 'mbbill/undotree'
  Plug 'vim-scripts/YankRing.vim'

" Nav + Editing Tools
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/_nav_editing_.vim
 Plug 'ervandew/supertab'
 Plug 'majutsushi/tagbar'
 Plug 'matze/vim-move'
 Plug 'easymotion/vim-easymotion'
 Plug 'rhysd/clever-f.vim'


" Highlighting + Formatting
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/_formatting_.vim
  Plug 'sheerun/vim-polyglot'
  Plug 'elixir-editors/vim-elixir'
  Plug 'elzr/vim-json'
  Plug 'sbdchd/neoformat'

" Code Completion and Linting
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    " ~/.config/nvim/config.d/_coc_.vim
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "
  " ~/.config/nvim/config.d/_completion_linting_.vim
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

  Plug 'Shougo/echodoc.vim'
  Plug 'Shougo/neco-vim'

  "Plug 'JakeBecker/elixir-ls', { 'do': { -> g:elixirls.compile() } }
  Plug 'elixir-lsp/elixir-ls', { 'do': { -> g:elixirls.compile() } }

  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

  Plug 'avdgaag/vim-phoenix'
  Plug 'mmorearty/elixir-ctags'
  " Plug 'mattreduce/vim-mix'
  Plug 'janko/vim-test'
  " Plug 'slashmili/alchemist.vim'

  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'Shougo/neco-vim'

  "/home/zlx/.config/TabNine/tabnine_config.json
  "/home/zlx/.config/TabNine/TabNineExample.toml

" Writing / Doc Tools
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/_writting_.vim
  Plug 'vimwiki/vimwiki'
  Plug 'reedes/vim-pencil'
  Plug 'reedes/vim-lexical'
  Plug 'rhysd/vim-grammarous'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  Plug 'dhruvasagar/vim-table-mode'

" Git
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  " ~/.config/nvim/config.d/_git_.vim
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
 "******************************************************************************
 call plug#end()
 filetype plugin indent on
"******************************************************************************
