" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"******************************************************************************

" 'sbdchd/neoformat' {{{
let g:neoformat_basic_format_align = 1
let g:neoformat_run_all_formatters = 0

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

"let g:neoformat_enabled_python = ['yapf', 'docformatter']

command Nf  call MyNeoformat()
command Nfp :Neoformat! python yapf | update

function MyNeoformat() abort
    undojoin | Neoformat | update
endfunction

" augroup neofmt
"   autocmd!
"   autocmd BufWritePre *.py undojoin | Neoformat! python yapf | update
" augroup END
"}}}

 " 'elzr/vim-json' {{{2
   let g:vim_json_syntax_conceal = 1    " turn on "
   let g:indentLine_noConcealCursor="nc"
"}}}



"******************************************************************************
