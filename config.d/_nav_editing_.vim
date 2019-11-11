" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"******************************************************************************

" 'ervandew/supertab' "{{{2
  let g:SuperTabDefaultCompletionType = "<c-n>"
  "let g:SuperTabContextDefaultCompletionType = "<c-n>"
"}}}

" 'majutsushi/tagbar'  {{{2
  nmap <leader>tb :TagbarToggle<CR>
  cnoreabbrev Tagbar TagbarToggle
"}}}

" 'matze/vim-move'  {{{2
  "use the Alt/Opt key with hjkl
  let g:move_key_modifier = 'M'
"}}}

"  'easymotion/vim-easymotion'  {{{2
  " turn default mappings off
  let g:EasyMotion_smartcase  = 1
  let g:EasyMotion_do_mapping = 0

  let g:EasyMotion_use_upper = 1
  let g:EasyMotion_keys = '~ABCDEFGHIJKLMNOPRSTUVWXYZ;'

  let g:EasyMotion_verbose           = 0  "turn messages off
  let g:EasyMotion_enter_jump_first  = 1
  let g:EasyMotion_space_jump_first  = 1
  let g:EasyMotion_landing_highlight = 0
  let g:EasyMotion_move_highlight    = 1

  " hi EasyMotionTarget ctermbg=none ctermfg=green
  hi EasyMotionTarget ctermbg=blue ctermfg=green
  hi EasyMotionShade  ctermbg=blue ctermfg=blue

  hi EasyMotionTarget2First  ctermbg=none ctermfg=red
  hi EasyMotionTarget2Second ctermbg=none ctermfg=lightred

  hi EasyMotionMoveHL    ctermbg=green ctermfg=none
  hi EasyMotionIncSearch ctermbg=green ctermfg=none

  nmap ss :<C-u>call EasyMotion#S(-1,1,2)<CR>
  " nmap  <silent><leader>en <Plug>(easymotion-next)
  " command EasyNext :call EasyMotion#NextPrevious(0,0)
  " cnoreabbrev en EasyNext

  " nmap  <silent><leader>ep <Plug>(easymotion-prev)
  " command EasyPrev :call EasyMotion#NextPrevious(0,1)
  " cnoreabbrev ep EasyPrev

  nmap sc <Plug>(easymotion-s2)
  xmap sc <Plug>(easymotion-s2)
  omap z  <Plug>(easymotion-s2)

  " nmap <Leader>s <Plug>(easymotion-sn)
  " xmap <Leader>s <Plug>(easymotion-sn)
  " omap <Leader>z <Plug>(easymotion-sn)
"}}}

" 'rhysd/clever-f.vim'  {{{2
  " Clever let f/F t/T repeat.  No need for ; to repeat
  "
  let g:clever_f_smart_case = 1
  let g:clever_f_fix_key_direction = 1
  let g:clever_f_show_prompt = 0
  let g:clever_f_mark_char = 1

  " below variables must be set before loading this script
  let g:clever_f_mark_cursor_color       = 'Cursor'
  let g:clever_f_mark_char_color         = 'myCleverChar'

  augroup au_clever
    autocmd!
    autocmd VimEnter *  highlight default myCleverChar   ctermfg=white ctermbg=red  cterm=bold,underline
  augroup END
"}}}



"******************************************************************************
