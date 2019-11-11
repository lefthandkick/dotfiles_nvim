" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"******************************************************************************

"--[ junegunn/fzf.vim ]-- {{{2
  set rtp+=~/.fzf
  let g:fzf_history_dir = '/home/zlx/.local/share/nvim/'

  augroup Myfzf
    autocmd!
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
  augroup END

  " [Buffers] Jump to the existing window if possible
 " let g:fzf_buffers_jump = 1

  " In Neovim, you can set up fzf window using a Vim command
  let g:fzf_layout = { 'window': 'enew' }
  let g:fzf_layout = { 'window': '-tabnew' }
  let g:fzf_layout = { 'window': '10new' }


    " This is the default extra key bindings
   let g:fzf_action = {
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ }

  " Default fzf layout
  " - down / up / left / right
  let g:fzf_layout = { 'down': '~30%' }

  " nnoremap <Leader>fh :History<CR>
  noreabbrev Fh :History

  " Command History
  noreabbrev Fc :History:
  " Search History
  noreabbrev Fs :History/

  " nnoremap <Leader>ff :Files<CR>
  noreabbrev Ff :Files

  " nnoremap <Leader>fb :Buffers<CR>
  noreabbrev Fb :Buffers

  " nnoremap <Leader>ft :BTags<CR>
  noreabbrev Ft :BTags

  " nnoremap <Leader>fm :Marks<CR>
  noreabbrev Fm :Marks

  "ToDo:
  "add git


  nnoremap \\ :Ag<space>
  nnoremap \| :Ag <C-R><C-W><cr>
  " nnoremap \| :Ag <C-R><C-W><cr>:cw<cr>

  command! MRU call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})



  function! Myfzf_mru() abort
    call fzf#run({
    \  'source':  v:oldfiles,
    \  'sink':    'e',
    \  'options': '-m -x +s',
    \  'down':    '30%'})
  endfunction

  command Mru call Myfzf_mru()
  " noreabbrev <silent> fr MRU

  function! Myfzf_dir_search() abort
    let current_file =expand("%")
    let cwd = fnamemodify(current_file, ':p:h')
    let command = 'ag -g "" -f ' . cwd . ' --depth 0'

    call fzf#run({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '-m -x +s',
        \ 'down':    '30%'})
  endfunction

" \ 'window':  'enew' })
command! Fz call Myfzf_dir_search()
" noreabbrev fs Fzn

 function! s:get_registers() abort
  redir => l:regs
  silent registers
  redir END

  return split(l:regs, '\n')[1:]
endfunction

function! s:registers(...) abort
  let l:opts = {
        \ 'source': s:get_registers(),
        \ 'sink': {x -> feedkeys(matchstr(x, '\v^\S+\ze.*') . (a:1 ? 'P' : 'p'), 'x')},
        \ 'options': '--prompt="Reg> "'
        \ }
  call fzf#run(fzf#wrap(l:opts))
endfunction
command! -bang Registers call s:registers('<bang>' ==# '!')

command! -nargs=1 -bang Locate call fzf#run(fzf#wrap(
      \ {'source': 'locate <q-args>', 'options': '-m'}, <bang>0))





"}}}

"--[ mhinz/vim-sayonara ]--  "{{{2
   " -[ moll/vim-bbye
    command     BX bufdo Bwipeout
    cnoreabbrev Bx   Bwipeout
    cnoreabbrev Bxx  Bwipeout!

   " -[ mhinz/vim-sayonara
   "Note: check keybindings.vim for more mappings
   "
   cnoreabbrev Sx   Sayonara
   cnoreabbrev Sxx  Sayonara!

   "nnoremap <Leader>x :Sayonara<CR>
"}}}

" --[ vim-scripts/YankRing.vim' ]-- {{{2
"  --------------------------------------
  let g:yankring_max_history = 100
  let g:yankring_min_element_length = 2
  let g:yankring_max_display = 70
  let g:yankring_enabled = 1
  let g:yankring_persist = 1
  let g:yankring_paste_using_g = 1
  let g:yankring_window_use_separate = 1
  let g:yankring_window_auto_close = 1
  let g:yankring_record_insert = 0
  let g:yankring_window_use_horiz = 0
  let g:yankring_window_height = 10 "works for horz
  let g:yankring_window_width = 45
  let g:yankring_window_use_right = 1
  let g:yankring_window_increment = 60

  let g:yankring_manage_numbered_reg = 1
  let g:yankring_history_dir = '/home/zlx/.local/share/nvim'
  let g:yankring_clipboard_monitor = 1
  let g:yankring_manual_clipboard_check = 0
  let g:yankring_default_menu_mode = 3

  " let  g:yankring_menu_root = 'MyPlugin.&YankRing'
  " let  g:yankring_menu_priority = 30

  "fix for yankring and neovim
  let g:yankring_clipboard_monitor=0

  " nnoremap <silent><leader>yr :YRShow<CR>
  cnoreabbrev Yr       YRGetElem
  cnoreabbrev Yroff    YRToggle 0
  cnoreabbrev Yron     YRToggle 1
  cnoreabbrev Yrclear  YRClear
  cnoreabbrev Yrpop    YRPop
  cnoreabbrev Yr/      YRSearch
"}}}

"******************************************************************************
