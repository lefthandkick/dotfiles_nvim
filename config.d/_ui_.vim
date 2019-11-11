" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"******************************************************************************

" 'Yggdroot/indentLine'   "{{{2
  let g:indentLine_enabled = 1
  let g:indentLine_setColors = 1

  let g:indentLine_char = '┊'
  " let g:indentLine_noConcealCursor=""
  let g:indentLine_color_gui = '#094959'

  " let g:indentLine_setConceal = 0
  cnoreabbrev Iline IndentLinesToggle
"}}}

" 'lifepillar/vim-solarized8'  {{{2
 "--------------------------------
 " Not sure why, but just works better this way
 "--------------------------------
 function MyUIFunc() abort
    set t_Co=256
    set termguicolors
    " set guicursor= "if set like this... you can't change cursor shape

    let g:solarized_extra_hi_groups = 1
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1

    set background=dark
    colorscheme solarized8_flat
 endfunction

 " augroup MyVimrcStart
 "  autocmd!
 "    au VimEnter * call MyUIFunc()
 " augroup End
 "}}}

"  'vim-airline/vim-airline'   {{{2
 "----------------------------------------------------
 cnoreabbrev Airt  AirlineToggle
 cnoreabbrev Airw  AirlineToggleWhitespace
 cnoreabbrev Airr  AirlineRefresh
 cnoreabbrev Aire  AirlineExtensions

 "----------------------------------------------------
 let g:airline_theme="bubblegum"

 let laststatus = 2

 let g:airline_left_sep = ''
 let g:airline_left_alt_sep = '|'

 let g:airline_right_sep = ''
 let g:airline_right_alt_sep = '|'

 let g:airline_mode_map = {
   \ '__' : '-',
   \ 'c'  : 'C',
   \ 'i'  : 'I',
   \ 'ic' : 'I',
   \ 'ix' : 'I',
   \ 'ni' : 'N',
   \ 'n'  : 'N',
   \ 'no' : 'N',
   \ 'R'  : 'R',
   \ 'Rv' : 'R',
   \ 's'  : 'S',
   \ 'S'  : 'S',
   \ '' : 'S',
   \ 't'  : 'T',
   \ 'v'  : 'VC',
   \ 'V'  : 'VL',
   \ '' : 'VB',
   \ }

 let g:airline_symbols = {}
 let g:airline_symbols.branch = ''
 let g:airline_symbols.readonly = ''
 let g:airline_symbols.linenr = ''


 " -- Detection --
 "----------------------------------------------------
 let g:airline_detect_spell = 1
 let g:airline_detect_modified = 1

 " -- Tabs and Buffers --
 "----------------------------------------------------
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#show_splits = 0
 let g:airline#extensions#tabline#formatter = 'unique_tail'

 let g:airline#extensions#tabline#show_tabs = 1
 let g:airline#extensions#tabline#show_tab_nr = 1
 let g:airline#extensions#tabline#show_tab_type = 2
 let g:airline#extensions#tabline#show_buffers = 1
 let g:airline#extensions#tabline#close_symbol = 'X'
 let g:airline#extensions#tabline#show_close_button = 0
 let g:airline#extensions#tabline#buffer_idx_mode = 1

 " rename label for buffers (default: 'buffers') (c) >
 let g:airline#extensions#tabline#buffers_label = ' <|B'
 " rename label for tabs (default: 'tabs') (c) >
 let g:airline#extensions#tabline#tabs_label = 'T|> '

 " always show current tabpage/buffer first >
 " let airline#extensions#tabline#current_first = 1

 " Just show the filename (no path) in the tab
 let g:airline#extensions#tabline#fnamemod = ':t'
 " let g:airline#extensions#tabline#fnamecollapse = 0

 " -- Format the Airline --
 "----------------------------------------------------
 let g:airline_skip_empty_sections = 1
 let g:airline#extensions#default#layout = [
   \ [ 'a', 'b', 'c' ],
   \ [ 'x', 'warning', 'error', 'z' ]
   \ ]

 let g:airline_section_y = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'  "set relitive path

 let g:airline#extensions#branch#enabled = 1
 let g:airline#extensions#hunks#non_zero_only = 1
 let g:airline#extensions#whitespace#enabled = 0

 "----------------------------------------------------
 function! MyLineNumber()
    return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
      \    substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
 endfunction

 let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])

 function MyAirLine() abort
    call airline#parts#define('linenr', {'function': 'MyLineNumber', 'accents': 'bold'})
 endfunction

 augroup MyAir
    autocmd!
    au VimEnter * call MyAirLine()
    au VimEnter * AirlineRefresh

    au Bufenter * AirlineRefresh

    " au InsertEnter * call MyAirLine()
    " au InsertLeave * call MyAirLine()
 augroup END

 " Buffer Switching
 " ----------------------------------------------
 nmap <leader>1 <Plug>AirlineSelectTab1
 nmap <leader>2 <Plug>AirlineSelectTab2
 nmap <leader>3 <Plug>AirlineSelectTab3
 nmap <leader>4 <Plug>AirlineSelectTab4
 nmap <leader>5 <Plug>AirlineSelectTab5
 nmap <leader>6 <Plug>AirlineSelectTab6
 nmap <leader>7 <Plug>AirlineSelectTab7
 nmap <leader>8 <Plug>AirlineSelectTab8
 nmap <leader>9 <Plug>AirlineSelectTab9
"******************************************************************************
"}}}

"******************************************************************************
