"
" Plugin Settings
"

" unite.vim
"
" バッファ一覧
" 入力モードで開始する
noremap <C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=files file file/new<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>

let s:bundle = neobundle#get("unite.vim")
function! s:bundle.hooks.on_source(bundle)
  let g:unite_force_overwrite_statusline = 0
endfunction

" unite-rails
let s:bundle = neobundle#get("unite-rails")
function! s:bundle.hooks.on_source(bundle)
  function! UniteRailsSetting()
    nnoremap <buffer><C-H><C-H><C-H>  :<C-U>Unite rails/view<CR>
    nnoremap <buffer><C-H><C-H>       :<C-U>Unite rails/model<CR>
    nnoremap <buffer><C-H>            :<C-U>Unite rails/controller<CR>

    nnoremap <buffer><C-H>c           :<C-U>Unite rails/config<CR>
    nnoremap <buffer><C-H>s           :<C-U>Unite rails/spec<CR>
    nnoremap <buffer><C-H>m           :<C-U>Unite rails/db -input=migrate<CR>
    nnoremap <buffer><C-H>l           :<C-U>Unite rails/lib<CR>
    nnoremap <buffer><expr><C-H>g     ':e '.b:rails_root.'/Gemfile<CR>'
    nnoremap <buffer><expr><C-H>r     ':e '.b:rails_root.'/config/routes.rb<CR>'
    nnoremap <buffer><expr><C-H>se    ':e '.b:rails_root.'/db/seeds.rb<CR>'
    nnoremap <buffer><C-H>ra          :<C-U>Unite rails/rake<CR>
    nnoremap <buffer><C-H>h           :<C-U>Unite rails/heroku<CR>
  endfunction
  aug MyAutoCmd
    au User Rails call UniteRailsSetting()
  aug END
"}}}
endfunction

" vimfiler
nnoremap <leader>e :VimFilerExplore -split -winwidth=30 -find -no-quit<CR>

let s:bundle = neobundle#get("vimfiler")
function! s:bundle.hooks.on_source(bundle)
  let g:vimfiler_force_overwrite_statusline = 0
endfunction

" vimshell
let s:bundle = neobundle#get("vimshell.vim")
function! s:bundle.hooks.on_source(bundle)
  let g:vimshell_force_overwrite_statusline = 0
endfunction

" switch.vim
nnoremap <Leader>t :<C-u>Switch<CR>

let s:bundle = neobundle#get("switch.vim")
function! s:bundle.hooks.on_source(bundle)
  let g:switch_custom_definitions =
  \[
  \   {
  \         '\(\k\+\)'    : '''\1''',
  \       '''\(.\{-}\)''' :  '"\1"',
  \        '"\(.\{-}\)"'  :   '\1',
  \   },
  \]
endfunction

" syntastic
let s:bundle = neobundle#get("syntastic")
function! s:bundle.hooks.on_source(bundle)
  let g:syntastic_enable_signs = 1
  let g:syntastic_auto_loc_list = 2
  " rubocop
  let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby', 'eruby', 'python'] }
  let g:syntastic_ruby_checkers = ['rubocop']
  let g:syntastic_python_chekers = ['flake8']
  let g:syntastic_quiet_messages = {'level': 'warnings'}
  augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp,*.pl,*.py call s:syntastic()
  augroup END
  function! s:syntastic()
    SyntasticCheck
    call lightline#update()
  endfunction
endfunction

" vim-surround
nmap s <plug>Ysurround
nmap ss <plug>Yssurround

let s:bundle = neobundle#get("syntastic")
function! s:bundle.hooks.on_source(bundle)
  let g:surround_custom_mapping = {}
  let g:surround_custom_mapping._ = {
    \ 'p': "<pre> \r </pre>",
    \ 'w': "%w(\r)",
    \ }
  let g:surround_custom_mapping.help = {
    \ 'p': "> \r <",
    \ }
  let g:surround_custom_mapping.ruby = {
    \ '-': "<% \r %>",
    \ '=': "<%= \r %>",
    \ '9': "(\r)",
    \ '5': "%(\r)",
    \ '%': "%(\r)",
    \ 'w': "%w(\r)",
    \ '#': "#{\r}",
    \ '3': "#{\r}",
    \ 'e': "begin \r end",
    \ 'E': "<<EOS \r EOS",
    \ 'i': "if \1if\1 \r end",
    \ 'u': "unless \1unless\1 \r end",
    \ 'c': "class \1class\1 \r end",
    \ 'm': "module \1module\1 \r end",
    \ 'd': "def \1def\1\2args\r..*\r(&)\2 \r end",
    \ 'p': "\1method\1 do \2args\r..*\r|&| \2\r end",
    \ 'P': "\1method\1 {\2args\r..*\r|&|\2 \r }",
    \ }
  let g:surround_custom_mapping.javascript = {
    \ 'f': "function(){ \r }"
    \ }
  let g:surround_custom_mapping.lua = {
    \ 'f': "function(){ \r }"
    \ }
  let g:surround_custom_mapping.python = {
    \ 'p': "print( \r)",
    \ '[': "[\r]",
    \ }
  let g:surround_custom_mapping.vim= {
    \'f': "function! \r endfunction"
    \ }
  let g:surround_{char2nr('e')} = "begin \r end"
  let g:surround_{char2nr('d')} = "do \r end"
  "let g:surround_{char2nr("-")} = ":\r"</plug></plug>
"}}}
endfunction

" vim-fugitive {{{
nnoremap [git] <Nop>
nmap <Leader>g [git]
nnoremap [git]d :<C-u>Gdiff HEAD<CR>
nnoremap [git]s :<C-u>Gstatus<CR>
nnoremap [git]l :<C-u>Glog<CR>
nnoremap [git]a :<C-u>Gwrite<CR>
nnoremap [git]c :<C-u>Gcommit<CR>
nnoremap [git]C :<C-u>Git commit --amend<CR>
nnoremap [git]b :<C-u>Gblame<CR>
" ftdetect is often failed
"MyAutocmd BufEnter * if expand("%") =~ ".git/COMMIT_EDITMSG" | set ft=gitcommit | endif
"MyAutocmd BufEnter * if expand("%") =~ ".git/rebase-merge" | set ft=gitrebase | endif
" }}}

" vim-rails {{{
let s:bundle = neobundle#get("vim-rails")
function! s:bundle.hooks.on_source(bundle)
  let g:rails_default_file='config/database.yml'
  let g:rails_level = 4
  let g:rails_mappings = 1
  let g:rails_modelines = 0
  function! SetUpRailsSetting()
    nnoremap <buffer><Space>r :R<CR>
    nnoremap <buffer><Space>a :A<CR>
    nnoremap <buffer><Space>m :Rmodel<Space>
    nnoremap <buffer><Space>c :Rcontroller<Space>
    nnoremap <buffer><Space>v :Rview<Space>
    nnoremap <buffer><Space>p :Rpreview<CR>
  endfunction
  aug MyAutoCmd
    au User Rails call SetUpRailsSetting()
  aug END
  aug RailsDictSetting
    au!
  aug END
endfunction
" }}}

" vim-quickrun {{{
let s:bundle = neobundle#get("vim-quickrun")
function! s:bundle.hooks.on_source(bundle)
  let g:quickrun_config = {}
  let g:quickrun_config['markdown'] = {
        \ 'outputter': 'browser'
        \ }
  let g:quickrun_config['go'] = {
        \ 'command': 'go',
        \ 'exec': ['%c run %s']
        \ }
endfunction
" }}}

" tcomment_types {{{
let s:bundle = neobundle#get("vim-quickrun")
function! s:bundle.hooks.on_source(bundle)
  if !exists('g:tcomment_types')
    let g:tcomment_types = {}
  endif
  let g:tcomment_types['vim'] = '" %s'
  let g:tcomment_types['ruby'] = '# %s'
  lef g:tcomment_types['python'] = '# %s'
endfunction
" }}}

" closetag.vim {{{
let s:bundle = neobundle#get("vim-quickrun")
function! s:bundle.hooks.on_source(bundle)
  let g:closetag_html_style = 1
endfunction
" }}}

" vim-over {{{
nnoremap <silent> <Leader>m :OverCommandLine<CR>%s/
" }}}

" vim-anzu {{{
" キーマップ
"nmap n nzz<Plug>(anzu-update-search-status)
nmap n <Plug>(anzu-n)
"nmap N Nzz<Plug>(anzu-update-search-status)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
" ESC2回押しで検索ハイライト消去
nmap <Esc><Esc> <Plug>(anzu-clear-search-status):<C-u>nohlsearch<CR>

let s:bundle = neobundle#get("vim-anzu")
function! s:bundle.hooks.on_source(bundle)
  " format = (該当数/全体数)
  let g:anzu_status_format = "%p(%i/%l)"
endfunction
" }}}

" yankround.vim {{{
" キーマップ
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
" 履歴一覧
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>

let s:bundle = neobundle#get("yankround.vim")
function! s:bundle.hooks.on_source(bundle)
  " 履歴取得数
  let g:yankround_max_history = 50
endfunction
" }}}

" accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

let s:bundle = neobundle#get("accelerated-jk")
function! s:bundle.hooks.on_source(bundle)
  let g:accelerrated_jk_acceleration_table = [10,5,3]
endfunction

" emmet-vim
let s:bundle = neobundle#get("emmet-vim")
function! s:bundle.hooks.on_source(bundle)
  let g:user_emmet_settings = {
        \ 'indentation':'  ',
        \ 'lang':'ja'
        \ }
endfunction

" lightline.vim {{{
let s:bundle = neobundle#get("lightline.vim")
function! s:bundle.hooks.on_source(bundle)
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'pyenv' ],
        \             [ 'fugitive', 'filename', ],
        \             [ 'anzu', 'ctrlpmark' ]
        \   ],
        \   'right': [ [ 'syntastic', 'lineinfo' ],
        \              [ 'percent' ],
        \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
        \ },
        \ 'component': {
        \   'lineinfo': '⭡ %3l:%-2v', 
        \ },
        \ 'component_expand': {
        \   'syntastic': 'SyntasticStatuslineFlag', 
        \ },
        \ 'component_type': {
        \   'syntastic': 'error',
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'anzu': 'anzu#search_status',
        \   'ctrlpmark': 'CtrlPMark',
        \   'buflist': 'Mline_bufhist',
        \   'pyenv': 'pyenv#statusline#component',
        \ },
        \ 'separator': { 'left': "\u2b80",  'right': "\u2b82" },
        \ 'subseparator': { 'left': "\u2b81",  'right': "\u2b83" },
        \ }

  function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction

  function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
  endfunction

  function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
          \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
          \  &ft == 'unite' ? unite#get_status_string() :
          \  &ft == 'vimshell' ? vimshell#get_status_string() :
          \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
          \ ('' != MyModified() ? ' ' . MyModified() : '')
  endfunction

  function! MyFugitive()
    try
      if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
        let _ = fugitive#head()
        return strlen(_) ? '⭠ '._ : ''
      endif
    catch
    endtry
    return ''
  endfunction

  function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
  endfunction

  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
  endfunction

  function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
  endfunction

  function! MyMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
  endfunction 

  function! CtrlPMark()
    if expand('%:t') =~ 'ControlP'
      call lightline#link('iR'[g:lightline.ctrlp_regex])
      return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
            \ , g:lightline.ctrlp_next], 0)
    else
      return ''
    endif
  endfunction

  let g:ctrlp_status_func = {
        \ 'main': 'CtrlPStatusFunc_1',
        \ 'prog': 'CtrlPStatusFunc_2',
        \ }

  function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
  endfunction

  function! CtrlPStatusFunc_2(str)
    return lightline#statusline(0)
  endfunction

  let g:mline_bufhist_queue = []

  let g:mline_bufhist_limit = 4

  let g:mline_bufhist_exclution_pat = '^$\|.jax$\|vimfiler:\|\[unite\]\|tagbar'

  let g:mline_bufhist_enable = 1
  command! Btoggle :let g:mline_bufhist_enable = g:mline_bufhist_enable ? 0 : 1 | :redrawstatus!
  function! Mline_bufhist()
    if &filetype =~? 'unite\|vimfiler\|tagbar' || !&modifiable || len(g:mline_bufhist_queue)  ==  0 || g:mline_bufhist_enable  ==  0
      return ''
    endif

    let current_buf_nr = bufnr('%')
    let buf_names_str = ''
    let last = g:mline_bufhist_queue[-1]
    for i in g:mline_bufhist_queue
      let t = fnamemodify(i, ':t')
      let n = bufnr(t)

      if n != current_buf_nr
        let buf_names_str .= printf('[%d]:%s' . (i == last ? '' : ' | '), n, t)
      endif
    endfor

    return buf_names_str
  endfunction

  function! s:update_recent_buflist(file)
    if a:file =~? g:mline_bufhist_exclution_pat
      return
    endif

    if len(g:mline_bufhist_queue) == 0
      for i in range(min( [ bufnr('$'), g:mline_bufhist_limit + 1 ] ))
        let t = bufname(i)
        if bufexists(i) && t !~? g:mline_bufhist_exclution_pat
          call add(g:mline_bufhist_queue, fnamemodify(t, ':p'))
        endif
      endfor
    endif

    " update exist buffer
    let idx = index(g:mline_bufhist_queue, a:file)
    if 0 <= idx
      call remove(g:mline_bufhist_queue, idx)
    endif

    call insert(g:mline_bufhist_queue, a:file)

    if g:mline_bufhist_limit + 1 < len(g:mline_bufhist_queue)
      call remove(g:mline_bufhist_queue, -1)
    endif
  endfunction

  augroup general
    autocmd!
    autocmd TabEnter,BufWinEnter * call s:update_recent_buflist(expand('<amatch>'))
  augroup END
endfunction
" }}}

" vim-smartchr
inoremap <expr> , smartchr#one_of(', ', ',')
inoremap <expr> =
      \ search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn') ? '<BS>= '
      \ : search('\(*\<bar>!\)\%#', 'bcn') ? '= '
      \ : smartchr#one_of(' = ', '=', ' == ', ' === ', ' => ')
let s:bundle = neobundle#get("vim-smartchr")
function! s:bundle.hooks.on_source(bundle)
  augroup MyAutoCmd
    "inoremap <expr> = smartchr#loop(' = ', '=', ' == ', ' => ', ' === ', '!=')
    autocmd FileType perl,php inoremap <buffer> <expr> . smartchr#loop(' . ', '->', '.')
    autocmd FileType perl,php inoremap <buffer> <expr> - smartchr#loop('-', '->')
    autocmd FileType c,cpp inoremap <buffer> <expr> . smartchr#loop('.', '->', '...')
    autocmd FileType eruby
          \ inoremap <buffer> <expr> > smartchr#loop('>', '%>')
          \| inoremap <buffer> <expr> < smartchr#loop('<', '<%', '<%=')
  augroup END
endfunction
" }}}

" vim-go
let s:bundle = neobundle#get("vim-go")
function! s:bundle.hooks.on_source(bundle)
  let g:go_bin_path=expand("~/go/bin")
  let g:go_play_open_browser=0
  let g:go_fmt_fail_silently=1
  let g:go_fmt_autosave=0
  let g:go_fmt_command="gofmt"
  let g:go_snippet_engine="neosnippet"
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  au FileType go nmap <leader>gb <Plug>(go-build)
  au FileType go nmap <leader>gt <Plug>(go-test)
  au FileType go nmap gd <Plug>(go-def)
  au FileType go nmap <Leader>ds <Plug>(go-def-split)
  au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dt <Plug>(go-def-tab)
  au FileType go nmap <Leader>gl :GoLint<CR>
  " let g:go_gocode_bin="~/go/src/github.com/nsf/gocode/gocode.go"
  " let g:go_golint_bin="~/go/src/github.com/golang/lint/golint/golint.go"
  " let g:go_goimports_bin="~/go/src/code.google.com/p/go.tools/cmd/goimports"
endfunction

" calender.vim {{{
let s:bundle = neobundle#get("calendar.vim")
function! s:bundle.hooks.on_source(bundle)
  let g:calendar_google_calendar = 1
endfunction
" }}}

" unite-ruby-require.vim {{{
let s:bundle = neobundle#get("calendar.vim")
function! s:bundle.hooks.on_source(bundle)
  let g:unite_source_ruby_require_ruby_cammand = expand("~/.rbenv/shims/ruby")
endfunction
" }}}

" vim_goshrepl {{{
autocmd FileType scheme vmap <CR> <Plug>(gosh_repl_send_block)
" }}}

" vim-gdev {{{
" :Unite gosh_infoを実行する
nmap gi <Plug>(gosh_info_start_search)
nmap gk <Plug>(gosh_info_start_search_with_cur_keyword)
imap <C-A> <Plug>(gosh_info_start_search_with_cur_keyword)
" }}}

" vim-smartword {{{
nmap w <Plug>(smartword-w)
nmap b <Plug>(smartword-b)
nmap e <Plug>(smartword-e)
" }}}

" vim-node {{{
autocmd User Node
      \ if &filetype == "javascript" |
      \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
      \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
      \ endif
" }}}

" vim-textmanip {{{
" 選択したテキストの移動(textmanip)
vmap <C-j> <Plug>(textmanip-move-down)
vmap <C-k> <Plug>(textmanip-move-up)
vmap <C-h> <Plug>(textmanip-move-left)
vmap <C-l> <Plug>(textmanip-move-right)
" 行の複製(textmanip)
vmap <M-d> <Plug>(textmanip-duplicate-down)
nmap <M-d> <Plug>(textmanip-duplicate-down)
" }}}

" Simple-Javascript-Indenter {{{
let s:bundle = neobundle#get("Simple-Javascript-Indenter")
function! s:bundle.hooks.on_source(bundle)
  let g:SimpleJSIndenter_BriefMode=2
endfunction
" }}}

" indentLine {{{
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>

let s:bundle = neobundle#get("indentLine")
function! s:bundle.hooks.on_source(bundle)
  let g:indentLine_faster=1
endfunction
" }}}

" jedi-vim {{{
let s:bundle = neobundle#get("jedi-vim")
function! s:bundle.hooks.on_source(bundle)
  autocmd FileType python setlocal omnifunc=jedi#completions
  let g:jedi#completions_enabled = 0
  let g:jedi#auto_vim_configuration = 0

  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
endfunction
" }}

" smartinput {{{
let s:bundle = neobundle#get("vim-smartinput")
function! s:bundle.hooks.on_source(bundle)
  call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
  call smartinput#define_rule({
        \ 'at'    : '(\%#)', 
        \ 'char'  : '<Space>',
        \ 'input' : '<Space><Space><Left>'
        \ })
  call smartinput#define_rule({
        \ 'at'    : '( \%# )', 
        \ 'char'  : '<BS>', 
        \ 'input' : '<Del><BS>'
        \ })
  " call smartinput#define_rule({
  "       \ 'at'    : '\s\+\%#', 
  "       \ 'char'  : '<CR>', 
  "       \ 'input' : "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>"
  "       \ })
  call smartinput#define_rule({
        \ 'at'       : '\\(\%#\\)',
        \ 'char'     : '<BS>',
        \ 'input'    : '<Del><Del><BS><BS>',
        \ 'filetype' : ['vim'],
        \ 'syntax'   : ['String'],
        \ })
  call smartinput#define_rule({
        \ 'at'       : '\\[%z](\%#\\)',
        \ 'char'     : '<BS>',
        \ 'input'    : '<Del><Del><BS><BS><BS>',
        \ 'filetype' : ['vim'],
        \ 'syntax'   : ['String'],
        \ })
  call smartinput#map_to_trigger('i', '#', '#', '#')
  call smartinput#define_rule({
        \ 'at'       : '\%#',
        \ 'char'     : '#',
        \ 'input'    : '#{}<Left>',
        \ 'filetype' : ['ruby'],
        \ 'syntax'   : ['Constant', 'Special'],
        \ })
  call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar>')
  call smartinput#define_rule({
        \ 'at'       : '\({\|\<do\>\)\s*\%#',
        \ 'char'     : '<Bar>',
        \ 'input'    : '<Bar><Bar><Left>',
        \ 'filetype' : ['ruby'],
        \ })
  call smartinput#map_to_trigger('i', '<Plug>(smartinput_BS)', 
        \                        '<BS>', 
        \                        '<BS>')
  call smartinput#map_to_trigger('i', '<Plug>(smartinput_C-h)', 
        \                        '<BS>',
        \                        '<C-h>')
  call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)', 
        \                        '<Enter>',
        \                        '<Enter>')
endfunction
unlet s:bundle
" }}}

let s:bundle = neobundle#get("vim-smartinput-endwise")
function! s:bundle.hooks.on_source(bundle)
  call smartinput_endwise#define_default_rules()
endfunction

let s:bundle = neobundle#get("vim-submode")
function! s:bundle.hooks.on_source(bundle)
  " Chrome bind
  "nnoremap <silent> <Leader>j :ChromeScrollDown<CR>
  "nnoremap <silent> <Leader>k :ChromeScrollUp<CR>
  "nnoremap <silent> <Leader>q :ChromeTabClose<CR>
  call submode#enter_with('cscroll', 'n', '', '<Leader>j', ':ChromeScrollDown<CR>')
  call submode#enter_with('cscroll', 'n', '', '<Leader>k', ':ChromeScrollUp<CR>')
  call submode#leave_with('cscroll', 'n', '', 'n')
  call submode#map('cscroll', 'n', '', 'j', ':ChromeScrollDown<CR>')
  call submode#map('cscroll', 'n', '', 'k', ':ChromeScrollUp<CR>')
  call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
  call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
  call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
  call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
  call submode#map('winsize', 'n',  '', '>', '<C-w>>')
  call submode#map('winsize', 'n',  '', '<', '<C-w><')
  call submode#map('winsize', 'n',  '', '+', '<C-w>+')
  call submode#map('winsize', 'n',  '', '-', '<C-w>-')
endfunction

" neocomplete
imap <C-k> <Plug>(neosnippet_expand_or_jump)
inoremap <silent><C-u> <ESC>:<C-U>Unite snippet<CR>
nnoremap <silent><Space>e :<C-U>NeoSnippetEdit -split<CR>
smap <C-k> <Plug>(neosnippet_expand_or_jump)

let s:bundle = neobundle#get("neocomplete.vim")
function! s:bundle.hooks.on_source(bundle)
  " 起動時に有効
  let g:neocomplete#enable_at_startup = 1
  " 自動補完を行う入力数を設定
  let g:neocomplete#auto_completion_start_length = 2
  " 補完候補検索時に大文字・小文字を無視する
  let g:neocomplete#enable_ignore_case = 1
  " 入力に大文字が入力されている場合、大文字小文字の区別をする
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#min_keyword_length = 3
  let g:neocomplete#force_overwrite_completefunc = 1
  let g:neocomplete#skip_auto_completion_time = '0.3'
  " 関数を補完するための区切り文字パターン
  if !exists('g:neocomplete#delimiter_patterns')
    let g:neocomplete#delimiter_patterns = {}
  endif
  let g:neocomplete#delimiter_patterns['php'] = ['->', '::', '\']

  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'
  let g:neocomplete#keyword_patterns['gosh_repl'] = '[[:alpha:]]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*'
  
  "カーソルより後のキーワードパターンを認識。
  "h|geとなっている状態(|はカーソル)で、hogeを補完したときに後ろのキーワードを認識してho|geと補完する機能。
  "修正するときにかなり便利。
  "g:neocomplcache_next_keyword_patternsは分からないときはいじらないほうが良いです。
  " if !exists('g:neocomplete#next_keyword_patterns')
  "   let g:neocomplete#next_keyword_patterns = {}
  " endif
  "よく分からない場合は未設定のほうがよいとのことなので、ひとまずコメントアウト
  "let g:neocomplcache_next_keyword_patterns['php'] = '\h\w*>'
  "twigはhtmlと同じに
  "let g:neocomplete#next_keyword_patterns['twig'] = '[[:alnum:]_:-]*>\|[^"]*"'

  "ファイルタイプの関連付け
  if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
  endif

  " 辞書ファイルリスト
  let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME . '/.vimshell_hist',
        \ 'php' : $HOME . '/.vim/dict/php.dict',
        \ 'javascript' : $HOME . '/.vim/dict/javascript.dict',
        \ 'ruby' : $HOME . '/.vim/dict/ruby.dict'
        \ }

  au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict
  "オムニ補完
  augroup SetOmniCompletionSetting
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
    "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType ctp setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType twig setlocal omnifunc=htmlcomplete#CompleteTags
  augroup END

  "オムニ補完のパターンを設定
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  "let g:neocomplcache_omni_patterns['twig']= '<[^>]*'
  "let g:neocomplcache_omni_patterns['php'] = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
  let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::\w*'
  " let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit] *\t]\.\w*'
  let g:neocomplete#sources#omni#input_patterns.go = '\h\w*\.\?'

  if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions = {}
  endif
  let g:neocomplete#sources#vim#complete_functions = {
        \ 'Ref' : 'ref#complete',
        \ 'Unite' : 'unite#complete_source',
        \ 'VimShellExecute' :
        \   'vimshell#vimshell_execute_complete',
        \ 'VimShellInteractive' :
        \   'vimshell#vimshell_execute_complete',
        \ 'VimShellTerminal' :
        \   'vimshell#vimshell_execute_complete',
        \ 'VimShell' : 'vimshell#complete',
        \ 'VimFiler' : 'vimshell#complete',
        \}

  "改行で補完ウィンドウを閉じる
  imap <expr><CR> neocomplete#smart_close_popup() . "\<Plug>(smartinput_CR)"
  "tabで補完候補の選択を行う
  "inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
  inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
  "C-h, BSで補完ウィンドウを確実に閉じる
  imap <expr><C-h> neocomplete#smart_close_popup()."\<Plug>(smartinput_C-h)"
  imap <expr><BS> neocomplete#smart_close_popup()."\<Plug>(smartinput_BS)"
  "C-yで補完候補の確定
  inoremap <expr><C-y> neocomplete#close_popup()
  "C-eで補完のキャンセルし、ウィンドウを閉じる。ポップアップが開いていないときはEndキー
  inoremap <expr><C-e> pumvisible() ? neocomplete#cancel_popup() : "\<End>"
  "C-gで補完を元に戻す
  inoremap <expr><C-g> neocomplete#undo_completion()
  "vim標準のキーワード補完を置き換える
  inoremap <expr><C-n> neocomplete#manual_keyword_complete()
  "C-pで上キー
  inoremap <C-p> <Up>
  "補完候補の共通文字列を補完する(シェル補完のような動作)
  inoremap <expr><C-l> neocomplete#complete_common_string()
  "スニペットを展開する。スニペットが関係しないところでは行末まで削除
  "imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
  "smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  " imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  "  \ "\<Plug>(neosnippet_expand_or_jump)"
  "  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? 
        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)"
        \: "\<TAB>"

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

  "オムニ補完の手動呼び出し
  inoremap <expr><C-Space> neocomplete#manual_omni_complete()

  "スニペットファイルを編集する
  nnoremap <Space>nes :<C-U>NeoSnippetEdit<CR>

  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1

  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
endfunction

" slimv {{{
set tags=$HOME/.vim/tags/lisp.tags
let g:paredit_mode=1
let g:paredit_electric_return=0

function! s:generate_lisp_tags()
  let g:slimv_ctags = 'ctags -a -f '.$HOME.'/.vim/tags/lisp.tags -R '.expand('%:p:h').' --language-force=Lisp'
  call SlimvGenerateTags()
endfunction
command! -nargs=0 GenerateLispTagsRecursive call <SID>generate_lisp_tags_recursive()

let g:slimv_repl_split = 4
let g:slimv_repl_name = 'REPL'
let g:slimv_repl_simple_eval = 0
let g:slimv_lisp = '/usr/local/bin/clisp'
let g:slimv_impl = 'clisp'
let g:slimv_preferred = 'clisp'
let g:slimv_swank_cmd = '!osascript -e "tell application \"iTerm2\" to do script \"clisp '.$HOME.'/.vim/bundle/slimv/slime/start-swank.lisp\""'

let g:lisp_rainbow=1

autocmd BufNewFile,BufRead *.asd set filetype=lisp
" }}}
