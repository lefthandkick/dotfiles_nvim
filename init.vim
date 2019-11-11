" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"******************************************************************************
let g:my_uname = substitute(system("uname"), '\n', '', '')

" Lets be modern..
let $XDG_CACHE_HOME  = expand($HOME.'/.cache')
let $XDG_CONFIG_HOME = expand($HOME.'/.config')
let $XDG_DATA_HOME   = expand($HOME.'/.local/share')

" Where to find python venv for nvim
" let g:python_host_prog =  'not using python2
let g:python3_host_prog = '/usr/bin/python3'

" Where the configs are
let g:vim_home = get(g:, 'vim_home', '~/.config/nvim/')

"---------------------------------
"~/.config/nvim/load_plugs.vim
"~/.config/nvim/settings.vim
"~/.config/nvim/keybindings.vim
"---------------------------------

" Load all vim configs
let config_list = [
     \ 'settings.vim',
     \ 'load_plugs.vim',
     \ 'config.d/_*.vim',
     \ 'keybindings.vim'
     \]
    "  \ 'helpers.d/*_.vim',

for files in config_list
  for vrc in glob(g:vim_home.files, 1, 1)
     exec 'source ' vrc
  endfor
endfor

set secure
command PU PlugUpdate | PlugUpgrade

" turn hidden files off by defauls gh to toggle visability
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" fuction to set up solarized
call MyUIFunc()

" Helper Functions {{{2
  function! StripTWSpaces()   "{{{3
    let l:l = line(".")
    let l:c = col(".")
    %s/\s\+$//e
    call cursor(l:l, l:c)
  endfunction
  "}}}
function! MyHelpTab()  "{{{3
" Help <what you want help with> displayed in a new tab ex: help nmap
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
"}}}
function PrintKeymap()   "{{{3
  :!rm ~/.config/nvim/pk_vim_keymap.txt
  :redir > ~/.config/nvim/pk_vim_keymap.txt
  :silent verbose map
    " :silent verbose vmap
    " :silent verbose imap
  :redir END
endfunction
command Pk call PrintKeymap()
command Ek edit ~/.config/nvim/pk_vim_keymap.txt
"}}}
function! Toggle_Quickfix_Window() "{{{3
  let _ = winnr('$')
  cclose
  if _ == winnr('$')
    copen
    setlocal nowrap
    setlocal whichwrap=b,s
  endif
endfunction
 nnoremap <silent> q<Space> :<C-u>call Toggle_Quickfix_Window()<CR>
"}}}
"}}}

 augroup MyVimrcStart
  autocmd!
    " Vim script
    set syntax=vim
    set noshowmode

    au VimEnter * set nospell
    " wipe all the registers at start time.
    au VimEnter * command! Wipereg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

    au BufEnter *.txt call MyHelpTab()

    au BufWritePre * call StripTWSpaces()

    au BufNewFile,BufRead *.vim,*.viminfo	 set filetype=vim
 augroup END
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set mouse=c
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~








"}}}

