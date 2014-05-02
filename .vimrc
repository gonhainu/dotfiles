set nocompatible
set t_Co=256
set encoding=utf-8
set fileformats=unix,dos,mac
set nobackup " バックアップ取らない
set writebackup
set backupdir=~/vim_backup
set swapfile
set directory=~/vim_swap 
set title
set number " 行番号を表示
set ruler
syntax on
set ambiwidth=double
set tabstop=2 " タブサイズを2にする
set shiftwidth=2
set list
set listchars=trail:-,eol:↲,extends:»,precedes:«,nbsp:%,tab:>\ 
set expandtab
"set softtabstop=0
set autoindent " オートインデントを有効にする
set cindent " Cプログラムファイルの自動インデントを始める
set smartindent " 新しい行を開始した時に、新しい行のインデントを現在行と同じ量にする
set nostartofline
" ビープを鳴らさない
set visualbell
set vb t_vb=
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set hidden " バッファを保存しなくても他のバッファを表示できるようにする
set wildmenu " コマンドライン補完を便利に
set wildmode=list:full " リスト表示，最長マッチ
" タイプ途中のコマンドを画面最下行に表示
set showcmd
set showtabline=2
" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch
" インクリメンタルサーチを有効化
set incsearch
" ステータスラインを常に表示する
set laststatus=2
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%Y]%=%l,%c%V%8P
" バッファが変更されているとき，コマンドをエラーにするのではなく，保存す
" かどうか確認を求める
set confirm
" 全モードでマウスを有効化
set mouse=a
set guioptions+=a
set ttymouse=xterm2
" コマンドラインの高さを2行に
set cmdheight=2
" 検索の時に大文字小文字を区別しない
" ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set ignorecase
set smartcase
" 検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
"補完ウィンドウの設定 :help completopt
set completeopt=menuone
" 画面最後の行をできる限り表示する
set display=lastline
set autoread " 他で書き換えられたら自動で読み直す
" カーソルを行頭，行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" テキスト整形オプション，マルチバイト系を追加
set formatoptions=lmoq
" スクロール次の余白確保
set scrolloff=5
" OSのクリップボードを使う
set clipboard=unnamed
set cursorline " カーソル行をハイライト
" カレントウィンドウにのみ罫線を引く
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

:hi clear CursorLine
:hi CursolLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
" Ctrl-iでヘルプ
"nnoremap :help

" ----------
" Keymapping {{{
" ----------
" <Leader>キーを[,]に変更
let mapleader = ","
let maplocalleader = ","
noremap \ ,

" 表示行単位で移動
noremap j gj
noremap k gk
vnoremap j gj
vnoremap k gk
" Ctrl-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
" insert modeでの移動
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <C-f> <Right>
noremap! <C-b> <Left>
noremap! <C-d> <Del>

" ;と:を入れ替える
noremap : ;
noremap ; :

" jjでEsc
inoremap <silent> jj <Esc>

" タブ移動を簡単にする
" <a href="http://doruby.kbmj.com/aisi/20091218/Vim__" target="_blank" rel="noreferrer" style="cursor:help;display:inline !important;">http://doruby.kbmj.com/aisi/20091218/Vim__</a>
nnoremap <silent> <leader>tf :<c-u>tabfirst<cr>
nnoremap <silent> <leader>tl :<c-u>tablast<cr>
nnoremap <silent> <leader>tn :<c-u>tabnext<cr>
nnoremap <silent> <leader>tN :<c-u>tabNext<cr>
nnoremap <silent> <leader>tp :<c-u>tabprevious<cr>
nnoremap <silent> <leader>te :<c-u>tabedit<cr>
nnoremap <silent> <leader>tc :<c-u>tabclose<cr>
nnoremap <silent> <leader>to :<c-u>tabonly<cr>
nnoremap <silent> <leader>ts :<c-u>tabs<cr>

" 括弧自動補完
" inoremap {{ {}<LEFT>
" inoremap [[ []<LEFT>
" inoremap (( ()<LEFT>
" inoremap "" ""<LEFT>
" inoremap '' ''<LEFT>
" vnoremap { "zdi^V{<C-R>z}<ESC>
" vnoremap [ "zdi^V[<C-R>z]<ESC>
" vnoremap ( "zdi^V(<C-R>z)<ESC>
" vnoremap " "zdi^V"<C-R>z^V"<ESC>
" vnoremap ' "zdi'<C-R>z'<ESC>

" spaceで次のbufferへ。backspaceで前のbufferへ。
nmap <Space><Space> :MBEbn<CR>
nmap <BS><BS> :MBEbp<CR>

" F4で前のバッファ
map <F4> <Esc>:bp<CR>
" F5で次のバッファ
map <F5> <Esc>:bn<CR>
" F6でバッファを削除する
map <F6> <Esc>:bnext \| bdelete #<CR>
command! Bw :bnext \| bdelete #

" .vimrcの編集を簡単にする{{{
" http://vim-users.jp/2009/09/hack74/

" .vimrcや.gvimrcを編集するためのKeymap
nnoremap <Space><Space>. :edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg :<C-u>edit $MYGVIMRC<CR>
" .vimrcや.gvimrcの変更を反映するためのKeymap
nnoremap <Space><Space>.. :<C-u>source $MYVIMRC<CR> 
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

" .vimrcや.gvimrcを変更すると、自動的に変更が反映されるようにする
" augroup MyAutoCmd
" autocmd!
" augroup END
"  
" if !has('gui_running') && !(has('win32') || has('win64'))
"   " .vimrcの再読込時にも色が変化するようにする
"   autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
" else
"   " .vimrcの再読込時にも色が変化するようにする
"   autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC |
"   \if has('gui_running') | source $MYGVIMRC
"   autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
" endif
"}}}


" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>


" コピー&ペースト
" Macの場合は普通にCommand-C,Command-Vも使えたりする
if has('mac')
  map <silent> gy :call YankPB()<CR>
  function! YankPB()
    let tmp = tempname()
    call writefile(getline(a:firstline, a:lastline), tmp, 'b')
    silent exec ":!cat " . tmp . " | iconv -f utf-8 -t shift-jis | pbcopy"
  endfunction
endif

" Paste Mode
" {{{
let paste_mode = 0 " 0 = normal, 1 = paste

function! Paste_on_off()
  if g:paste_mode == 0
    set paste
    let g:paste_mode = 1
  else
    set nopaste
    let g:paste_mode = 0
  endif
  return
endfunction
" }}}

" Paste Mode <F10>
nnoremap <silent> <F10> :call Paste_on_off()<CR>
set pastetoggle=<F10>

"}}}

let g:Powerline_symbols = 'fancy'


"autocmd FileType *
"\ if &|:omnifunc == "
"\ | setlocal omnifunc=syntaxcomplete#Complete
"\ | endif
"
" 補完・履歴 neocomplcache
set infercase


"}}}


" ポップアップメニューの色設定
"highlight Pmenu ctermbg=4
"highlight PmenuSel ctermbg=1
"highlight PMenuSbar ctermbg=4

  
" Ruby Reference 1.9.3
" http://doc.okkez.net/archives/
" refe
"let g:ref_use_vimproc = 0 " vimprocをインストールしてない場合は0を指定
let g:ref_open = 'split'
let g:ref_refe_cmd = expand('~/dotfiles/.vim/ref/ruby-refm-1.9.3/refe-1_9_3')

nnoremap rr :<C-U>Unite ref/refe -default-action=split -input=
nnoremap ri :<C-U>Unite ref/ri -default-action=split -input=

aug MyAutoCmd
  au FileType ruby,eruby,ruby.rspec nnoremap <silent><buffer>KK :<C-U>Unite -no-start-insert ref/ri   -input=<C-R><C-W><CR>
  au FileType ruby,eruby,ruby.rspec nnoremap <silent><buffer>K  :<C-U>Unite -no-start-insert ref/refe -input=<C-R><C-W><CR>
aug END

" vimball インストール先指定
" :let g:vimball_home = "~/dotfiles/.vim/bundle"

" TMUX設定
"### 自動的にコメント文字を挿入させない
"autocmd MyAutoCmd FileType *
"      \ setl formatoptions& formatoptions-=ro formatoptions+=mM


if exists('$TMUX')
  autocmd MyAutoCmd BufEnter * call <SID>set_vim_cwd_to_tmux()
  autocmd MyAutoCmd VimLeave * call <SID>del_vim_cwd_from_tmux()
endif

function! s:set_vim_cwd_to_tmux()
  if !exists('$TMUX')
    return
  endif

  let pain_id = system('tmux display -p "#D" | tr -d "%" | tr -d $"\n"')
  call system('tmux setenv ' . "TMUX_VIM_CWD_" . pain_id . ' ' . getcwd())

  let bt = &buftype
  let ft = &filetype
  " let bn = bufname('%')
  if bt ==# 'nofile'
        \ || ft ==# 'gitcommit' || ft ==# 'git-status' || ft ==# 'git-log'
        \ || ft ==# 'qf' || ft ==# 'gitcommit' || ft ==# 'quickrun'
        \ || ft ==# 'qfreplace' || ft ==# 'ref' || ft ==# 'vcs-commit'
        \ || ft ==# 'vcs-status'
    let pwd = getcwd()
  else
    let pwd = expand('%:p:h')
  endif

  let var_name = system('tmux display -p "TMUXPWD_#D" | tr -d "%" | tr -d $"\n"')
  call system('tmux setenv ' . var_name . ' ' . shellescape(pwd))
endfunction

function! s:del_vim_cwd_from_tmux()
  if !exists('$TMUX')
    return
  endif
  let var_name = system('tmux display -p "TMUX_VIM_CWD_#D" | tr -d "%" | tr -d $"\n"')
  call system('tmux setenv -u ' . var_name)
endfunction


function! s:meet_neocomplete_requirements()
  return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

"-----------
" NeoBundle
"-----------
filetype off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'basyura/TweetVim'
NeoBundle 'basyura/unite-rails' "{{{
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

NeoBundle 'rhysd/accelerated-jk' "{{{
  let g:accelerrated_jk_acceleration_table = [10,5,3]
  nmap j <Plug>(accelerated_jk_gj)
  nmap k <Plug>(accelerated_jk_gk)
"}}}
NeoBundle 'basyura/twibill.vim'
NeoBundle 'basyura/bitly.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/emmet-vim' "{{{
  let g:user_emmet_settings = {
        \ 'indentation':'  ',
        \ 'lang':'ja'
        \ }
"}}}
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/unite.vim' "{{{
  let g:unite_force_overwrite_statusline = 0
  " バッファ一覧
  " 入力モードで開始する
  noremap <C-B> :Unite buffer<CR>
  " ファイル一覧
  noremap <C-N> :Unite -buffer-name=files file file/new<CR>
  " 最近使ったファイルの一覧
  noremap <C-Z> :Unite file_mru<CR>
"}}}

if s:meet_neocomplete_requirements()
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundleFetch 'Shougo/neocomplcache'
else
  NeoBundleFetch 'Shougo/neocomplete.vim'
  NeoBundle 'Shougo/neocomplcache.vim'
endif

if s:meet_neocomplete_requirements()
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
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  inoremap <silent><C-u> <ESC>:<C-U>Unite snippet<CR>
  nnoremap <silent><Space>e :<C-U>NeoSnippetEdit -split<CR>
  smap <C-k> <Plug>(neosnippet_expand_or_jump)

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

else
  ""
  "" neocomplcache & neosnippet {{{
  ""

  "起動時に有効
  let g:neocomplcache_enable_at_startup = 1
  "自動補完を行う入力数を設定
  let g:neocomplcache_auto_completion_start_length = 2
  "1:補完候補検索時に大文字・小文字を無視する
  let g:neocomplcache_enable_ignore_case = 1
  "入力に大文字が入力されている場合、大文字小文字の区別をする
  let g:neocomplcache_enable_smart_case = 1
  let g:neocomplcache#sources#rsense#home_directory = expand('/usr/local/Cellar/rsense/0.3/libexec')
  let g:neocomplcache_force_overwrite_completefunc = 1
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
  let g:neocomplcache_skip_auto_completion_time  = '0.3'
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  inoremap <silent><C-u> <ESC>:<C-U>Unite snippet<CR>
  nnoremap <silent><Space>e :<C-U>NeoSnippetEdit -split<CR>
  smap <C-k> <Plug>(neosnippet_expand_or_jump)

  "関数を補完するための区切り文字パターン
  if !exists('g:neocomplcache_delimiter_patterns')
    let g:neocomplcache_delimiter_patterns = {}
  endif
  let g:neocomplcache_delimiter_patterns['php'] = ['->', '::', '\']

  "カーソルより後のキーワードパターンを認識。
  "h|geとなっている状態(|はカーソル)で、hogeを補完したときに後ろのキーワードを認識してho|geと補完する機能。
  "修正するときにかなり便利。
  "g:neocomplcache_next_keyword_patternsは分からないときはいじらないほうが良いです。
  if !exists('g:neocomplcache_next_keyword_patterns')
    let g:neocomplcache_next_keyword_patterns = {}
  endif
  "よく分からない場合は未設定のほうがよいとのことなので、ひとまずコメントアウト
  "let g:neocomplcache_next_keyword_patterns['php'] = '\h\w*>'
  "twigはhtmlと同じに
  let g:neocomplcache_next_keyword_patterns['twig'] = '[[:alnum:]_:-]*>\|[^"]*"'
  let g:neocomplcache_next_keyword_patterns['gosh_repl'] = '[[:alpha:]]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*'

  "ファイルタイプの関連付け
  if !exists('g:neocomplcache_same_filetype_lists')
    let g:neocomplcache_same_filetype_lists = {}
  endif

  " 辞書ファイルリスト
  let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'php' : $HOME . '/.vim/dict/php.dict',
        \ 'javascript' : $HOME . '/.vim/dict/javascript.dict'
        \ }

  "オムニ補完
  augroup SetOmniCompletionSetting
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType ctp setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType twig setlocal omnifunc=htmlcomplete#CompleteTags
  augroup END

  "オムニ補完のパターンを設定
  if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
  endif
  let g:rsenseUseOmniFunc = 1
  if filereadable(expand('/usr/local/Cellar/rsense/0.3/bin/rsense'))
    let g:rsenseHome = expand('/usr/local/Cellar/rsense/0.3/libexec')
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
  endif
  let g:neocomplcache#sources#rsense#home_directory = '/usr/local/Cellar/rsense/0.3/libexec'
  "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  "let g:neocomplcache_omni_patterns['twig']= '<[^>]*'
  "let g:neocomplcache_omni_patterns['php'] = '[^. \t]->\h\w*\|\h\w*::'
  let g:neocomplcache_omni_patterns['perl'] = '\h\w*->\h\w*\|\h\w*::'

  "改行で補完ウィンドウを閉じる
  inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
  "tabで補完候補の選択を行う
  "inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
  inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
  "C-h, BSで補完ウィンドウを確実に閉じる
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<BS>"
  "C-yで補完候補の確定
  inoremap <expr><C-y> neocomplcache#close_popup()
  "C-eで補完のキャンセルし、ウィンドウを閉じる。ポップアップが開いていないときはEndキー
  inoremap <expr><C-e> pumvisible() ? neocomplcache#cancel_popup() : "\<End>"
  "C-gで補完を元に戻す
  inoremap <expr><C-g> neocomplcache#undo_completion()
  "vim標準のキーワード補完を置き換える
  inoremap <expr><C-n> neocomplcache#manual_keyword_complete()
  "C-pで上キー
  inoremap <C-p> <Up>
  "補完候補の共通文字列を補完する(シェル補完のような動作)
  inoremap <expr><C-l> neocomplcache#complete_common_string()
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
  inoremap <expr><C-Space> neocomplcache#manual_omni_complete()

  "スニペットファイルを編集する
  nnoremap <Space>nes :NeoComplCacheEditSnippets

  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1

  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

endif



NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplcache-rsense.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimfiler' "{{{
  let g:vimfiler_force_overwrite_statusline = 0
NeoBundle 'Shougo/vimshell.vim', {
      \ 'lazy' : 1, 
      \ 'autoload' : {
      \   'commands' : [{ 'name' : 'VimShell',
      \                   'complete' : 'customlist,vimshell#complete' },
      \                 'VimShellExecute', 'VimShellInteractive',
      \                 'VimShellCreate',
      \                 'VimShellTerminal', 'VimShellPop'], 
      \   'mappings' : '<Plug>(vimshell_'
      \ }}
"{{{
  let g:vimshell_force_overwrite_statusline = 0
"}}}
NeoBundle 'AndrewRadev/switch.vim' "{{{
  let g:switch_custom_definitions =
  \[
  \   {
  \         '\(\k\+\)'    : '''\1''',
  \       '''\(.\{-}\)''' :  '"\1"',
  \        '"\(.\{-}\)"'  :   '\1',
  \   },
  \]

  nnoremap <Leader>t :<C-u>Switch<CR>
"}}}
NeoBundle 'scrooloose/syntastic' "{{{
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
"}}}
NeoBundle 'tpope/vim-surround' "{{{
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

  nmap s <plug>Ysurround
  nmap ss <plug>Yssurround
  let g:surround_{char2nr('e')} = "begin \r end"
  let g:surround_{char2nr('d')} = "do \r end"
  "let g:surround_{char2nr("-")} = ":\r"</plug></plug>
"}}}

NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-bundler'
" NeoBundle 'tpope/vim-endwise' "{{{
"   let g:endwise_no_mappings=1
" "}}}
NeoBundle 'tpope/vim-fugitive' "{{{
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
  " MyAutocmd BufEnter * if expand("%") =~ ".git/COMMIT_EDITMSG" | set ft=gitcommit | endif
  " MyAutocmd BufEnter * if expand("%") =~ ".git/rebase-merge" | set ft=gitrebase | endif
"}}}

NeoBundle 'tpope/vim-rails',  { 'autoload': {
  \ 'filetypes' : ['haml', 'ruby', 'eruby'] }} "{{{
  " 有効化
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
"}}}

NeoBundle 'thinca/vim-quickrun' "{{{
  let g:quickrun_config = {}
  let g:quickrun_config['markdown'] = {
        \ 'outputter': 'browser'
        \ }
"}}}

NeoBundleLazy 'thinca/vim-ref' "{{{
"}}}
NeoBundle 'thinca/vim-threes'

NeoBundle 'taka84u9/vim-ref-ri'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomtom/tcomment_vim' "{{{
  if !exists('g:tcomment_types')
    let g:tcomment_types = {}
  endif
  let g:tcomment_types['vim'] = '" %s'
  let g:tcomment_types['ruby'] = '# %s'
"}}}
NeoBundle 'vim-scripts/closetag.vim' "{{{
  let g:closetag_html_style=1
"}}}
NeoBundle 'vim-scripts/ruby-matchit'
NeoBundle 'vim-scripts/Align'
"NeoBundle 'syui/cscroll.vim'
" NeoBundle 'syui/wauto.vim' "{{{
"   nmap <Leader>s <Plug>(AutoWriteStart)
"   nmap <Leader>ss <Plug>(AutoWriteStop)
" "}}}

NeoBundle 'kana/vim-submode' "{{{
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
"}}}

NeoBundle 'osyo-manga/vim-over' "{{{
  nnoremap <silent> <Leader>m :OverCommandLine<CR>%s/
"}}}

NeoBundle 'osyo-manga/vim-anzu' "{{{
  " キーマップ
  "nmap n nzz<Plug>(anzu-update-search-status)
  nmap n <Plug>(anzu-n)
  "nmap N Nzz<Plug>(anzu-update-search-status)
  nmap N <Plug>(anzu-N)
  nmap * <Plug>(anzu-star)
  nmap # <Plug>(anzu-sharp)
  " ESC2回押しで検索ハイライト消去
  nmap <Esc><Esc> <Plug>(anzu-clear-search-status):<C-u>nohlsearch<CR>
  " format = (該当数/全体数)
  let g:anzu_status_format = "%p(%i/%l)"
"}}}

NeoBundle 'LeafCage/yankround.vim' "{{{
  " キーマップ
  nmap p <Plug>(yankround-p)
  nmap P <Plug>(yankround-P)
  nmap <C-p> <Plug>(yankround-prev)
  nmap <C-n> <Plug>(yankround-next)
  " 履歴取得数
  let g:yankround_max_history = 50
  " 履歴一覧
  nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>
"}}}

NeoBundleLazy 'kien/ctrlp.vim'
" NeoBundle 'bling/vim-airline' "{{{
"   let g:airline#extensions#tabline#enabled = 1
"   let g:airline#extensions#tabline#left_alt_sep = "\u2b81"
"   let g:airline#extensions#tabline#left_sep = "\u2b80"
" 
"   if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
"   endif
"   let g:airline_left_sep = '⮀'
"   let g:airline_left_alt_sep = '⮁'
"   let g:airline_right_sep = '⮂'
"   let g:airline_right_alt_sep = '⮃'
"   let g:airline_symbols.branch = '⭠'
"   let g:airline_symbols.readonly = '⭤'
"   let g:airline_symbols.linenr = '⭡'
"
"   let g:airline_theme = 'solarized'
"
"   "let g:airline#extensions#anzu#apply = 1
"
"   " vim-anzuの表示を statuslineに
"   let g:airline#extensions#anzu#enabled = 0 
"   let g:airline_section_c = '%F %{anzu#search_status()}'
"   " whitespace無効
"   let g:airlineeh#extensions#whitespace#enable = 0
"}}}
NeoBundle 'itchyny/lightline.vim' "{{{
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename', 'anzu'], [ 'buflist' ], [ 'ctrlpmark' ] ],
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
"}}}

NeoBundle 'altercation/vim-colors-solarized' "{{{
  " let g:solarized_termcolors=256
  " let g:solarized_termtrans=1
  " colorscheme solarized
"}}}
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'
  " let g:molokai_original = 1
  " let g:rehash256 = 1
  " colorscheme molokai

NeoBundle 'w0ng/vim-hybrid' "{{{
  "let g:hybrid_use_Xresources = 1
  "colorscheme hybrid
"}}}
NeoBundle 'vim-scripts/wombat256.vim'
  " colorscheme wombat256mod
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'itchyny/landscape.vim'
NeoBundle 'itchyny/calendar.vim' "{{{
  let g:calendar_google_calendar = 1
"}}}
NeoBundle 'rhysd/neco-ruby-keyword-args'
NeoBundle 'rhysd/unite-ruby-require.vim' "{{{
  let g:unite_source_ruby_require_ruby_cammand = expand("~/.rbenv/shims/ruby")
"}}}
NeoBundle 'rhysd/unite-codic.vim'
NeoBundle 'koron/codic-vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'aharisu/vim_goshrepl' "{{{
  autocmd FileType scheme vmap <CR> <Plug>(gosh_repl_send_block)
"}}}
NeoBundle 'aharisu/vim-gdev' "{{{
  ":Unite gosh_infoを実行する
  nmap gi <Plug>(gosh_info_start_search)
  nmap gk <Plug>(gosh_info_start_search_with_cur_keyword)
  imap <C-A> <Plug>(gosh_info_start_search_with_cur_keyword)
"}}}
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundleLazy 'kana/vim-smartchr' " {{{
  inoremap <expr> , smartchr#one_of(', ', ',')
  inoremap <expr> =
        \ search('\(&\<bar><bar>\<bar>+\<bar>-\<bar>/\<bar>>\<bar><\) \%#', 'bcn')? '<bs> =  '
        \ : search('\(*\<bar>!\)\%#', 'bcn') ? '= '
        \ : smartchr#one_of(' = ', '=', ' == ', ' === ', ' => ')
  augroup MyAutoCmd
    "inoremap <expr> = smartchr#loop(' = ', '=', ' == ', ' => ', ' === ', '!=')
    autocmd FileType perl,php inoremap <buffer> <expr> . smartchr#loop(' . ', '->', '.')
    autocmd FileType perl,php inoremap <buffer> <expr> - smartchr#loop('-', '->')
    autocmd FileType c,cpp inoremap <buffer> <expr> . smartchr#loop('.', '->', '...')
    autocmd FileType eruby
          \ inoremap <buffer> <expr> > smartchr#loop('>', '%>')
          \| inoremap <buffer> <expr> < smartchr#loop('<', '<%', '<%=')
  augroup END
" }}}
NeoBundleLazy 'kana/vim-smartinput' "{{{
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
"}}}
NeoBundle 'cohama/vim-smartinput-endwise' "{{{
  call smartinput_endwise#define_default_rules()
"}}}
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'mkitt/tabline.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bonsaiben/bootstrap-snippets'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundleLazy 'alpaca-tc/alpaca_tags', {
      \ 'rev': 'development', 
      \ 'depends': ['Shougo/vimproc.vim', 'Shougo/unite.vim'], 
      \ 'autoload' : {
      \   'commands' : ['Tags', 'Tags', 'TagsUpdate', 'TagsSet', 'TagsBundle', 'TagsCleanCache'], 
      \   'unite_sources' : ['tags']
      \ }}
  let g:alpaca_update_tags_config = {
        \ '_' : '-R --sort=yes --languages=-js,html,css', 
        \ 'ruby': '--languages=+Ruby', 
        \ }
  augroup AlpacaTags
    autocmd!
    if exists(':Tags')
      autocmd BufWritePost * TagsUpdate ruby
      autocmd BufWritePost Gemfile TagsBundle
      autocmd BufEnter * TagsSet
    endif
  augroup END

  nnoremap <expr>tt  ':Unite tags -horizontal -buffer-name=tags -input='.expand("<cword>").'<CR>'

NeoBundleLazy 'alpaca-tc/beautify.vim', {
      \ 'autoload' : {
      \   'commands' : [
      \     {
      \       'name' : 'Beautify', 
      \       'complete' : 'customlist,beautify#complete_options'
      \     }
      \   ]
      \ }}

NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'moro/vim-review'
NeoBundleLazy 'moll/vim-node' "{{{
  autocmd User Node
        \ if &filetype == "javascript" |
        \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
        \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
        \ endif
"}}}
NeoBundle 't9md/vim-textmanip' "{{{
  " 選択したテキストの移動(textmanip)
  vmap <C-j> <Plug>(textmanip-move-down)
  vmap <C-k> <Plug>(textmanip-move-up)
  vmap <C-h> <Plug>(textmanip-move-left)
  vmap <C-l> <Plug>(textmanip-move-right)
  " 行の複製(textmanip)
  vmap <M-d> <Plug>(textmanip-duplicate-down)
  nmap <M-d> <Plug>(textmanip-duplicate-down)
"}}}
NeoBundleLazy 'Simple-Javascript-Indenter', {
      \ 'autoload' : {
      \   'filetype' : ['js', 'html'],
      \   },
      \ } "{{{
  let g:SimpleJSIndenter_BriefMode=2
"}}}
NeoBundle 'nathanaelkane/vim-indent-guides' "{{{
  let g:indent_guides_auto_colors=0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black    ctermbg=235
  autocmd VimEnter,ColorScheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=236
  let g:indent_guides_enable_on_vim_startup=1
  let g:indent_guides_start_level=1
  let g:indent_guides_guide_size=2
"}}}
" NeoBundle 'Lokaltog/vim-easymotion' "{{{
"   let g:EasyMotion_do_mapping = 0
"
"   " =======================================
"   " Find Motions
"   " =======================================
"   " Jump to anywhere you want by just `4` or `3` key strokes without thinking!
"   " `s{char}{char}{target}`
"   nmap s <Plug>(easymotion-s2)
"   xmap s <Plug>(easymotion-s2)
"   omap z <Plug>(easymotion-s2)
"   " Of course, you can map to any key you want such as `<Space>`
"   " map <Space>(easymotion-s2)
"
"   " Turn on case sensitive feature
"   let g:EasyMotion_smartcase = 1
"
"   " =======================================
"   " Line Motions
"   " =======================================
"   " `JK` Motions: Extend line motions
"   map <Leader>j <Plug>(easymotion-j)
"   map <Leader>k <Plug>(easymotion-k)
"   " keep cursor column with `JK` motions
"   let g:EasyMotion_startofline = 0
"
"   " =======================================
"   " General Configuration
"   " =======================================
"   let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
"   " Show target key with upper case to improve readability
"   let g:EasyMotion_use_upper = 1
"   " Jump to first match with enter & space
"   let g:EasyMotion_enter_jump_first = 1
"   let g:EasyMotion_space_jump_first = 1
"
"
"   " =======================================
"   " Search Motions
"   " =======================================
"   " Extend search motions with vital-over command line interface
"   " Incremental highlight of all the matches
"   " Now, you don't need to repetitively press `n` or `N` with EasyMotion feature
"   " `<Tab>` & `<S-Tab>` to scroll up/down a page with next match
"   " :h easymotion-command-line
"   nmap g/ <Plug>(easymotion-sn)
"   xmap g/ <Plug>(easymotion-sn)
"   omap g/ <Plug>(easymotion-tn)
" "}}}
NeoBundle 'mattn/emoji-vim'
" NeoBundle 'csexton/jekyll.vim' "{{{
"   let g:jekyll_path = "~/gonhainu.github.io/octopress/source/"
"   let g:jekyll_post_date = "%Y-%m-%d %H:%M"
"   let g:jekyll_post_published = "false"
"   let g:jekyll_prompt_categories = "true"
"   let g:jekyll_comments = "true"
"   map <Leader>jn :JekyllPost<CR>
"   map <Leader>jl :JekyllList<CR>
" "}}}
NeoBundle 'glidenote/octoeditor.vim' "{{{
  let g:octopress_path = '~/gonhainu.github.io/octopress'
  map <Leader>on :OctopressNew<CR>
  map <Leader>ol :OctopressList<CR>
  " map <Leader>og :OcropressGrep<CR>
  nmap <Leader>og :OctopressGenerate<CR>
  nmap <Leader>od :OctopressDeploy<CR>
"}}}
" NeoBundle 'VimClojure' "{{{
"   let vimclojure#HighlightBuiltins = 1
"   let vimclojure#HighlightContrib = 1
"   let vimclojure#DynamicHighlighting = 1
"   let vimclojure#ParanRainbow = 1
"   let vimclojure#WantNailgun = 1
"   let vimclojure#NailgunClient = "/usr/local/stow/ngclient-2.3.1/ng"
" "}}}
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'amdt/vim-niji' "{{{
"  let g:niji_matching_filetypes = ['ruby', 'python']
"}}}
" NeoBundle 'nvie/vim-flake8' "{{{
"   let g:flake8_ignore='E501'
" "}}}
NeoBundle 'todesking/ruby_hl_lvar.vim' "{{{
  " Highlight group name for Local variable
  " Default: 'Identifier'
  let g:ruby_hl_lvar_hl_group = 'RubyLocalVariable'

  " Auto enable and refresh highlight when when text is changed. Useful but
  " bit slow.
  " Default: 1
  let g:ruby_hl_lvar_auto_enable = 0

  nmap <leader>he <Plug>(ruby_hl_lvar-enable)
  nmap <leader>hd <Plug>(ruby_hl_lvar-disable)
  nmap <leader>hr <Plug>(ruby_hl_lvar-refresh)
"}}}
NeoBundle 'http://git.code.sf.net/p/vim-latex/vim-latex.git'
NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin on
filetype indent on
NeoBundleCheck

" colorschemeの設定
"{{{
set background=dark
syntax enable

if ($ft=='ruby')
  colorscheme Tomorrow-Night
else
  colorscheme hybrid
endif

let tex_flavor = 'latex'
set grepprg=grep\ -nH\ $*
set shellslash
let g:Tex_BibtexFlavor = '/usr/texbin/pbibtex'
let g:Tex_BibtexFlavor = '/usr/texbin/upbibtex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_MakeIndexFlavor = ''
let g:Tex_View_Rule_pdf = '/usr/bin/open -a Preview.app'

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

" let g:indent_guides_auto_colors=0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black    ctermbg=235
" autocmd VimEnter,ColorScheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=236
" let g:indent_guides_enable_on_vim_startup=1
" let g:indent_guides_start_level=1
" let g:indent_guides_guide_size=1
