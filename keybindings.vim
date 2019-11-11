" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"******************************************************************************

" --[ escape / : ]-- {{{2
" inoremap fd <Esc>
" vnoremap fd <Esc>

 vnoremap jk <Esc>
 inoremap jk <Esc>

 " Save some some typing
  nnoremap ; :
" }}}

"--[ Navigation / Movement ]-- {{{2
"
" change pwd to that of the file being editied
" autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

" insert  mode cursor navigation on mac I have remaped C-HJKL to arrows
inoremap <C-j> <C-o>gj
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-k> <C-o>gk

"keep cursor from jumping back when leaving insert mode
augroup myholdcursor
  autocmd!
    autocmd InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])
augroup END

" turn on vim command line competion via tab
set wildcharm=<Tab>

"insert n space 4ss insert 4 spaces or ss for 1 space
nnoremap si i<space><esc>

" nvim built-in terminal Navigation
tnoremap <C-w>h <C-\><C-N><C-w>h
tnoremap <C-w>j <C-\><C-N><C-w>j
tnoremap <C-w>k <C-\><C-N><C-w>k
tnoremap <C-w>l <C-\><C-N><C-w>l
inoremap <C-w>h <C-\><C-N><C-w>h
inoremap <C-w>j <C-\><C-N><C-w>j
inoremap <C-w>k <C-\><C-N><C-w>k
inoremap <C-w>l <C-\><C-N><C-w>l

" TAB - make shift L/R same as tab - I do not use tab-key to move txt
nnoremap > >>_
nnoremap < <<_

nnoremap <S-Tab> <<_
nnoremap <Tab> >>_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" BOL and EOL
nnoremap Hh ^
nnoremap HH <Home>
nnoremap L $

nnoremap <C-j> <C-e>
nnoremap <C-k> <C-Y>

"}}}

  "--[ Cut/Paste Undo/Redo /Editing ]--   {{{2

" better work editing
nnoremap cw bcw
nnoremap c( ci)
nnoremap c[ ci]
nnoremap c{ ci}
nnoremap c< ci>

" search and replace word under the cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

" keep cursor position when joining
nnoremap J mzJ`z
" Split line (sister to Join lines) S is covered by cc.
nnoremap S mzi<CR><ESC>`z

" cut-paste with system buffer
nnoremap <Leader>y "*y
nnoremap <Leader>p "*p

" yank to eol
nnoremap Y y$
nnoremap p p`[
"after visual yank, cursor to start of visual block
vnoremap y y`[
vnoremap p "_dp`]

" line dupe
nnoremap <leader>gc YI<esc>:Commentary<CR>p

" insert lines
function! AddEmptyLineAbove() "{{{3
  let l:scrolloffsave = &scrolloff
  " Avoid jerky scrolling with ^E at top of window
  set scrolloff=0
  call append(line(".") - 1, "")
  if winline() != winheight(0)
    silent normal! <C-e>
  end
    let &scrolloff = l:scrolloffsave
endfunction "}}}
function! AddEmptyLineBelow()  "{{{3
  call append(line("."), "")
endfunction "}}}
noremap <silent> gO :call AddEmptyLineAbove()<CR>
noremap <silent> go :call AddEmptyLineBelow()<CR>

noremap <silent><C-A-k> :call AddEmptyLineAbove()<CR>
noremap <silent><C-A-j> :call AddEmptyLineBelow()<CR>
"}}}

"--[ Manage - Windows / Files / Buffers ]--  {{{2
" Buffers and tabs
nnoremap <leader>. :bn<CR>
nnoremap <leader>, :bp<CR>

"last know cursor postion
nnoremap <leader>g `.

" Peekabo show registers is simply " in command mode

"save buffer changes then dump buffer
  function SaveDelBuff() "{{{3
    :update
    :Bwipeout!
  endfunction
  "}}}
cnoreabbrev W :call SaveDelBuff()
nnoremap <leader>w :update<CR>

"close all... no saving
nnoremap <Leader>`` :qall!<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" slide window / center windows
nnoremap <C-w>] <C-w><bar>
nnoremap <C-w>[ <C-w>=

"arrow keys to resize the windows works for tmux also
nnoremap <silent> <Left>  :vertical resize +1<CR>
nnoremap <silent> <Right> :vertical resize -1<CR>
nnoremap <silent> <Up>    :resize -1<CR>
nnoremap <silent> <Down>  :resize +1<CR>

function! SmartClose() "{{{3
  if winnr('$') != 1
    close
  endif
endfunction "}}}
nnoremap <silent> <C-w>c  :call SmartClose()<CR>
" If window isn't splited, split buffer.
function! ToggleWinSplit() "{{{3
  let prev_name = winnr()
  silent! wincmd w
  if prev_name == winnr()
    call SplitNice()
  else
    call SmartClose()
  endif
endfunction

function! SplitNice()
  if winwidth(0) > 2 * &winwidth
    vsplit
  else
    split
  endif
  wincmd p
endfunction
"}}}
nnoremap <silent> <C-w><C-s>  :call ToggleWinSplit()<CR>

 " C-d / C-u the other window
function! ScrollOtherWindow(direction) "{{{3
  execute 'wincmd' (winnr('#') == 0 ? 'w' : 'p')
  execute (a:direction ? "normal! \<C-d>" : "normal! \<C-u>")
  wincmd p
endfunction
"}}}
nnoremap <silent> <A-d> :call ScrollOtherWindow(1)<CR>
nnoremap <silent> <A-u> :call ScrollOtherWindow(0)<CR>

command! Split call SplitNice()
nnoremap <silent> <C-w>v :call SplitNice()<CR>
nnoremap <silent> <C-w>V :vnew<CR>
nnoremap <silent> <C-w>n :split<CR>
nnoremap <silent> <C-w>N :new<CR>
" NOTE: C-w t/T create new Terminal windows"

" Center cursor on screen when paging
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" When jump to next search/match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz
"}}}

"--[ Toggle folding and line numbering ]--  {{{2
set foldlevelstart=1
set foldmethod=marker

  "toggle folding
  " nnoremap \ za
  " vnoremap \ za
  " noremap <leader>zr zR
  " noremap <leader>zm zM
  " noremap [Space]k zk
  " noremap [Space]h zc
  " noremap [Space]l zo
  " noremap [Space]a za
  " noremap [Space]m zM
  " noremap [Space]i zMzv
  " noremap [Space]rr zR
  " noremap [Space]f zf
  " noremap [Space]d zd


function! NeatFoldText()   "{{{3
  hi Folded term=NONE cterm=NONE gui=NONE

  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1

  let foldSize = 1 + v:foldend - v:foldstart
  let lineCount = line("$")

  if has("float")
     try
       let foldPercentage = printf(" %.1f", (foldSize*1.0)/lineCount*100) . "% "
       catch /^Vim\%((\a\+)\)\=:E806/	" E806: Using Float as String
       let foldPercentage = printf("| [of %d lines] |", lineCount)
     endtry
  endif

  "let lines_count_text = '| ' . printf("%10s", lines_count . ' lines ') . ' - ' . foldPercentage . ' |'
  let lines_count_text = ' '

  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart(' <<->> ' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 40)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn

  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
"}}}
set foldtext=NeatFoldText()
hi Folded term=NONE cterm=NONE ctermfg=6
cnoreabbrev Foldon set foldenable!

"set relative line numbers
set number
set relativenumber
function! ToggleNumbering() abort "{{{3
  if !&number && !&relativenumber
      set number
      set norelativenumber
  elseif &number && !&relativenumber
      set nonumber
      set relativenumber
  elseif !&number && &relativenumber
      set number
      set relativenumber
  elseif &number && &relativenumber
      set nonumber
      set norelativenumber
  endif
endfunction
"}}}
cnoreabbrev Ln :call ToggleNumbering()<CR>

" If press h on head, fold close. Not using since I remaped h and l
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc'   : 'h'
xnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
" If press o on fold, fold open.
nnoremap <expr> o foldclosed(line('.')) != -1 ? 'zo0'   : 'l'
xnoremap <expr> o foldclosed(line('.')) != -1 ? 'zogv0' : 'l'
"}}}

"--[ misc ]--  {{{2
  command InsertTimeStamp  pu=strftime('%c')
  cnoreabbrev Timestamp InsertTimeStamp

  command Erc e ~/.config/nvim
  command Appdev e ~/AppDev/


  "clears highlighting every time cr pressed
  " nnoremap <silent><CR> :nohlsearch <bar> noshowmode<CR>
  nnoremap <silent><CR> :nohlsearch<CR>

  "don't test visual select when shifting
  xnoremap <  <gv
  xnoremap >  >gv

  " don't yank to default register when changing something
  " use the x register
  nnoremap c "xc
  xnoremap c "xc



" Delete trailing whitespaces
  nnoremap <silent><Leader>-- :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>




" Disable standard plugins
  " let g:loaded_getscriptPlugin = 1
  " let g:loaded_netrwPlugin = 1
  " let g:loaded_tarPlugin = 1
   let g:loaded_tutor_mode_plugin = 1
  " let g:loaded_vimballPlugin = 1
  " let g:loaded_zipPlugin = 1
  " let g:loaded_gzip = 1
  " let g:loaded_rrhelper = 1
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"}}}

