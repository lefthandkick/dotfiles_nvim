" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"******************************************************************************

 " autocmd BufWritePost *.exs,*.ex silent :!mix format %

 let g:my_uname = substitute(system("uname"), '\n', '', '')

"--[ Shougo/echodoc.vim ]-- {{{2
set cmdheight=2
let g:echodoc_enable_at_startup = 1
" let g:echodoc#type = 'virtual'
let g:echodoc#type = 'signature'
"}}}

" --[ Deoplete ]--  {{{2
"
  let g:neopairs#enable = 1

  let g:deoplete#enable_at_startup     = 1
  let g:deoplete#enable_refresh_always = 1
  let g:deoplete#enable_camel_case     = 1

  let g:deoplete#disable_auto_complete = 0

  let g:deoplete#auto_completion_start_length = 1

  let g:deoplete#max_abbr_width = 50
  let g:deoplete#max_menu_width = 40

  let g:deoplete#skip_chars = ['(', ')', '<', '>']

  let g:deoplete#tag#cache_limit_size = 800000

  let g:deoplete#file#enable_buffer_path = 1

  call deoplete#custom#var('tabnine', {
   \ 'line_limit': 500,
   \ 'max_num_results': 10,
   \ })

  let g:deoplete#sources = {}
  let g:deoplete#omni#input_patterns = {}

  call deoplete#custom#option('sources', {
      \ '_': ['LanguageClient', 'tabnine', 'neosnippet', 'file', 'buffer', 'tag']
      \ } )

  call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])

      " \ 'python': ['LanguageClient'],
      " \ 'elixir': ['LanguageClient']

  "Disable the candidates in Comment/String syntaxes.
  call deoplete#custom#source('_',
      \ 'disabled_syntaxes', ['Comment', 'String'])

  " let b:deoplete_ignore_sources = ['buffer', 'markdown']

  call deoplete#custom#source('LanguageClient', 'rank', 700)
  call deoplete#custom#source('tabnine',        'rank', 600)
  call deoplete#custom#source('buffer',         'rank', 500)
  call deoplete#custom#source('neosnippet',     'rank', 100)

  call deoplete#custom#source('LanguageClient', 'mark', 'L/C')
  call deoplete#custom#source('buffer',         'mark', 'Buf')
  call deoplete#custom#source('tabnine',        'mark', 'T9')
  call deoplete#custom#source('neosnippet',     'mark', 'Snip')

"}}}

"--[ LanguageClient Neovim ]-- {{{2
 " ensure deoplete pick lsp up
 set completefunc=LanguageClient#complete
 let g:LanguageClient_selectionUI = "fzf"
 let g:LanguageClient_diagnosticsList = "Quickfix"
 let g:LanguageClient_diagnosticsEnable = 1
 let g:LanguageClient_loggingLevel = 'WARN'
 let g:LanguageClient_loggingFile = expand('~/.cache/nvim/ls-log/ls.log')

 " may use in later: completion options put into completion line
 let g:LanguageClient_completionPreferTextEdit = 0

 " g:LanguageClient_settingsPath - used for jason config

 let g:LanguageClient_documentHighlightDisplay = {
    \    1: {
    \       "name": "Text",
    \       "texthl": "hlsearch",
    \   },
    \   2: {
    \       "name": "Read",
    \       "texthl": "SpellLocal",
    \   },
    \   3: {
    \       "name": "Write",
    \       "texthl": "SpellRare",
    \   },
    \ }

    " \       "name": "Error",
    " \       "texthl": "ALEError",
    " \       "signText": ">",
    " \       "signTexthl": "ALEErrorSign",
    " \       "virtualTexthl": "xError",
    " \   },


  let g:LanguageClient_diagnosticsDisplay = {
    \     1: {
    \       "name": "Error",
    \       "texthl": "hlsearch",
    \       "signText": ">",
    \       "signTexthl": "hlsearch",
    \       "virtualTexthl": "hlsearch",
    \   },
    \   2: {
    \       "name": "Warning",
    \       "texthl": "ALEWarning",
    \       "signText": "W",
    \       "signTexthl": "ALEWarningSign",
    \       "virtualTexthl": "Todo",
    \   },
    \   3: {
    \       "name": "Information",
    \       "texthl": "ALEInfo",
    \       "signText": "I",
    \       "signTexthl": "ALEInfoSign",
    \       "virtualTexthl": "Todo",
    \   },
    \   4: {
    \       "name": "Hint",
    \       "texthl": "ALEInfo",
    \       "signText": "H",
    \       "signTexthl": "ALEInfoSign",
    \       "virtualTexthl": "Todo",
    \   },
    \ }




 let g:LanguageClient_serverCommands = {}
 let g:LanguageClient_serverCommands = {
\ 'elixir': ['~/.local/share/nvim/plug_ins/elixir-ls/release/language_server.sh'],
\ 'viml': ['neco-vim'],
\ }

let g:LanguageClient_rootMarkers = {}
let g:LanguageClient_rootMarkers = {
    \ 'elixir': ['mix.exs'],
    \ }



  " Always draw the signcolumn.
  " set signcolumn=yes

function SetLSPShortcuts()
  nnoremap <localleader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <localleader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <localleader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <localleader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <localleader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <localleader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <localleader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <localleader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <localleader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <localleader>lm :call LanguageClient_contextMenu()<CR>
endfunction

augroup LangServer
autocmd!
  autocmd BufReadPost *.ex,*.exs setlocal filetype=elixir
  autocmd FileType elixir call SetLSPShortcuts()

augroup END


"}}}

"******************************************************************************
