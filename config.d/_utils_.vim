" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"******************************************************************************

" 'lifepillar/vim-cheat40'   "{{{2
    let g:cheat40_use_default = 0

    command  Editcheat edit ~/.config/nvim/cheat40.txt
    " cnoreabbrev editcheat Editcheat
 " }}}

 " 'chrisbra/Colorizer'  "{{{2
  "turn off the default keymap
    let g:colorizer_auto_map = 1

    command Coloron :call Colorizer#ColorToggle()
    " cnoreabbrev coloron  ToggleColor

    command Coloroff call Colorizer#ColorOff()
    " cnoreabbrev coloroff ColorOff

    command Colorflip :call Colorizer#SwitchFGBG()
    " cnoreabbrev colorflip ToggleFB

   augroup au_color
     autocmd!
     "colorizer"
     au BufNewFile,BufRead *.css,*.html,*.htm  :ColorHighlight!
   augroup END
 "}}}

 " 'Startify'  "{{{2
let g:startify_custom_header =
       \ startify#fortune#cowsay('', '─','│','┌','┐','┘','└')

let g:startify_use_env =  0
let g:startify_padding_left = 6
let g:startify_disable_at_vimenter = 0

let g:startify_custom_header = 'startify#fortune#boxed()'

let g:startify_enable_special         = 0
let g:startify_files_number           = 6
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_update_oldfiles        = 1

let g:startify_session_delete_buffers = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_number = 100
let g:startify_session_dir = '~/.local/share/nvim/startify/session'

let g:startify_session_savevars = [
     \ 'g:startify_session_savevars',
     \ 'g:startify_session_savecmds',
     \ 'g:random_plugin_use_feature'
     \ ]

let g:startify_bookmarks = [
 \ {'I': '~/.config/nvim/init.vim'},
 \]

let g:startify_list_order = [
      \ ['  --- Apps/Commands ---'],
      \ 'commands',
      \ ['  --- MRU ---'],
      \ 'files',
      \ ['  --- Saved Sessions ---'],
      \ 'sessions',
      \ ['  --- Bookmarks ---'],
      \ 'bookmarks'
      \ ]"

" \ ['New Empty V-Buf', ':vnew | only | NERDTreeToggle | wincmd p'],
let g:startify_commands = [
      \ ['New Empty V-Buf', ':vnew | only'],
      \ ['Vim Reference', 'h ref']
      \ ]

    " let g:startify_list_order = [
    "       \ ['  --- Apps/Commands ---'],
    "       \ 'commands',
    "       \ ['  --- MRU ---'],
    "       \ ['  --- MRU - Current Directory ---'],
    "       \ 'files',
    "       \ 'dir',
    "       \ ['   These are my sessions:'],
    "       \ 'sessions',
    "       \ ['   These are my bookmarks:'],
    "       \ 'bookmarks'
    "       \ ]"

"  command     Start      Startify
 " cnoreabbrev startify    Strartify
cnoreabbrev Ssave   SSave
cnoreabbrev Sclose  SClose
cnoreabbrev Sload   SLoad
cnoreabbrev Sdelete SDelete

augroup au_startify
  autocmd!
  "startified"
  au User Startified setlocal buftype=nofile
augroup END
"}}}

" 'Neoterm'  "{{{2
" When set to `1` neoterm will scroll to the end of its buffer after running any
" command or using :TOpen for when the terminal is hidden.
" Default value: `0`
let g:neoterm_autoscroll = 1

" open terminal switch to the term turn on insert mode
nnoremap <C-w>tv :vertical Tnew<cr> <C-w>li
nnoremap <C-w>ts :belowright Tnew<cr> <C-w>ji
cnoreabbrev Ntv vertical Tnew<cr> <C-w>li
cnoreabbrev Nts vertical Tnew<cr> <C-w>li

cnoreabbrev Ntc Tclear!
cnoreabbrev Ntk Tkill
cnoreabbrev Nto Topen
cnoreabbrev Ntx Tclose
cnoreabbrev NtX Tclose!
" cnoreabbrev Ntd T dart %
"
cnoreabbrev Ntp T python %
" run django server
" cnoreabbrev ntds T python manage.py runserver

"}}}

"******************************************************************************
