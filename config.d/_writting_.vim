" Author            : Matthew Rockwell
" Inspired by       : the VIM Community
" Initially created : 5/14/1998
"******************************************************************************




"  'reedes/vim-lexical' {{{2
  "-------------------------------------------------
  "Better Spelling Mappings
  set spellsuggest=10
  " keyboard shortcuts
  nnoremap <C-s>s [sz=
  inoremap <C-s>s <ESC>[sz=

  let g:lexical#spelllang  = ['en_us',]
  let g:lexical#thesaurus  = []
  let g:lexical#thesaurus  = ['~/.config/nvim/spell/mthesaur.txt']
  let g:lexical#spellfile  = ['~/.config/nvim/spell/en.utf-8.add']
  let g:lexical#dictkonary = ['/usr/share/dict/words',]

  " spell word
  let g:lexical#spell_key = '<C-s>k'
  " let g:lexical#thesaurus_key = '<leader>t'
  " let g:lexical#dictionary_key = '<leader>sK'
"}}}

" 'iamcco/markdown-preview.nvim' {{{2
  "----------------------------------------------------------------------------
    let g:mkdp_auto_start = 0
    let g:mkdp_auto_close = 1
    let g:mkdp_refresh_slow = 1
    " for normal mode
    command Mdp MarkdownPreview

    " for insert mode
    " imap <silent> <F8> <Plug>MarkdownPreview
    " for normal mode
    command Mds StopMarkdownPreview
    " for insert mode
    " imap <silent> <F9> <Plug>StopMarkdownPreview
"}}}

" 'plasticboy/vim-markdown' {{{2
  "----------------------------------------------
    " **** >>>> Plug tabular must come before plasticboy/vim-markdown
    let g:tex_conceal = ""
    let g:vim_markdown_conceal = 0

    let g:vim_markdown_math = 1
    let g:vim_markdown_toc_autofit  = 1
    let g:vim_markdown_folding_level = 1        " can be 1 thru 6
    let g:vim_markdown_folding_disabled = 0     " turn folding on
    let g:vim_markdown_new_list_item_indent = 0
    let g:vim_markdown_auto_insert_bullets  = 0

    let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'css', 'javascript' ]
    let g:markdown_minlines = 100
"}}}

" 'dhruvasagar/vim-table-mode' {{{2
  "-------------------------------------------------
  let g:table_mode_corner='|'

  function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
  endfunction

  inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
  inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

"}}}

augroup MyMarkdown    {{{2
    autocmd!
    " autocmd FileType markdown
    "   \ call deoplete#custom#buffer_option('auto_complete', v:false)

    set completeopt=longest,menuone
    autocmd FileType markdown,mkd,md  call lexical#init()
    autocmd FileType textile          call lexical#init()
    autocmd FileType text             call lexical#init({ 'spell': 0 })
 augroup END
"}}}

" vim-wiki {{{2
  augroup myWritting
    autocmd FileType vimwiki setlocal conceallevel=2 spell textwidth=80
    autocmd FileType vimwiki call pencil#init({'wrap': 'soft'})
  augroup END

" ------[ vimwiki/vimwiki'
  let g:vimwiki_folding = 'custom'

  let wiki_diary = {}
  let wiki_diary.index = 'Diary'
  let wiki_diary.path = '~/.config/nvim/vim_wiki_files/Diary'
  " let wiki_diary.html_template = '~/.config/nvim/vim_wiki_files/diary/public_html/template.tpl'
  let wiki_diary.syntax = 'markdown'
  let wiki_diary.ext = '.md'

  let wiki_proj = {}
  let wiki_proj.index = 'Projects'
  let wiki_proj.path = '~/.config/nvim/vim_wiki_files/Project_Notes'
  let wiki_proj.syntax = 'markdown'
  let wiki_proj.ext = '.md'

  let wiki_vim = {}
  let wiki_vim.index = 'VIM-Notes'
  let wiki_vim.path = '~/.config/nvim/vim_wiki_files/Vim'
  let wiki_vim.syntax = 'markdown'
  let wiki_vim.ext = '.md'

  let g:vimwiki_list = [wiki_diary, wiki_proj, wiki_vim]
  let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

  nmap <Leader>wv <Plug>VimwikiVSplitLink

 "}}}

 " 'reedes/vim-pencil'  {{{2
  let g:pencil#joinspaces = 1             " 0=one_space (def), 1=two_spaces
  let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
  augroup my-pencil
    autocmd FileType markdown call pencil#init({'wrap': 'soft', 'autoformat': 1})
    autocmd FileType text     call pencil#init({'wrap': 'hard', 'autoformat': 0})
  augroup END

"}}}

" 'rhysd/vim-grammarous' {{{2
  "For example, below setting makes grammar checker check comments only except for markdown and vim help.
  let g:grammarous#default_comments_only_filetypes = {
              \ '*' : 1, 'help' : 0, 'markdown' : 0,
              \ }
  " noremap <leader>wg :GrammarousCheck<CR>
       " noremap <leader>wr :GrammarousReset<CR>
  " command Gram      GrammorousCheck
  " command Gramreset GrammorousReset
  cnoreabbrev Gram GrammorousCheck
  cnoreabbrev Gramreset GrammorousReset
"}}}

"******************************************************************************
