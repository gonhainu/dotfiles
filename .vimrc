set nocompatible " Vi互換モードオフ
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
set cursorline " カーソル行をハイライト
" カレントウィンドウにのみ罫線を引く
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
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
noremap \ ,

" 表示行単位で移動
noremap j gj
noremap k gk
vnoremap j gj
vnoremap k gk
" Ctrl-hjklでウィンドウ移動

" ;と:を入れ替える
noremap : ;
noremap ; :

" 括弧自動補完
inoremap {{ {}<LEFT>
inoremap [[ []<LEFT>
inoremap (( ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

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
nnoremap <Esc><Esc> :nohlsearch<CR>


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

" インサートモード時の Ctrl+hjkl でカーソル移動
"inoremap <C-k> <Up>
"inoremap <C-j> <Down> 
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>
"inoremap <C-e> <END>
"inoremap <C-a> <HOME>
"}}}

" " pathogenでftdetectなどをloadさせるために一度ファイルタイプ判定をoff
" filetype off
" " pathogen.vimによってbundle配下のpluginをpathに加える
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()
" set helpfile=$VIMRUNTIME/doc/help.txt
" " ファイルタイプ判定をon
" filetype plugin on

"python from powerline.bindings.vim import source_plugin; source_plugin()
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim/
"let g:Powerline_symbols = 'fancy'

" colorschemeの設定
"{{{
set background=dark
syntax enable

"------------------------
" molokai
"------------------------
" colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1

"}}}

"autocmd FileType *
"\ if &|:omnifunc == "
"\ | setlocal omnifunc=syntaxcomplete#Complete
"\ | endif

""
"" neocomplcache & neosnippet {{{
""
" 補完・履歴 neocomplcache
set infercase

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
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
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

"}}}


" ポップアップメニューの色設定
"highlight Pmenu ctermbg=4
"highlight PmenuSel ctermbg=1
"highlight PMenuSbar ctermbg=4

  
" Ruby Reference 1.9.3
" http://doc.okkez.net/archives/
" refe
let g:ref_use_vimproc = 0 " vimprocをインストールしてない場合は0を指定
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

"-----------
" NeoBundle
"-----------
"set nocompatible
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

NeoBundle 'basyura/twibill.vim'
NeoBundle 'basyura/bitly.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neocomplcache-rsense.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimfiler'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'scrooloose/syntastic' "{{{
  let g:syntastic_enable_signs = 1
  let g:syntastic_auto_loc_list = 2
  " rubocop
  let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
  let g:syntastic_ruby_checkers = ['rubocop']
  let g:syntastic_quiet_warnings = 0
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
    \ '=':  "<%= \r %>",
    \ '9':  "(\r)",
    \ '5':  "%(\r)",
    \ '%':  "%(\r)",
    \ 'w':  "%w(\r)",
    \ '#':  "#{\r}",
    \ '3':  "#{\r}",
    \ 'e':  "begin \r end",
    \ 'E':  "<<EOS \r EOS",
    \ 'i':  "if \1if\1 \r end",
    \ 'u':  "unless \1unless\1 \r end",
    \ 'c':  "class \1class\1 \r end",
    \ 'm':  "module \1module\1 \r end",
    \ 'd':  "def \1def\1\2args\r..*\r(&)\2 \r end",
    \ 'p':  "\1method\1 do \2args\r..*\r|&| \2\r end",
    \ 'P':  "\1method\1 {\2args\r..*\r|&|\2 \r }",
    \ }
  let g:surround_custom_mapping.javascript = {
    \ 'f':  "function(){ \r }"
    \ }
  let g:surround_custom_mapping.lua = {
    \ 'f':  "function(){ \r }"
    \ }
  let g:surround_custom_mapping.python = {
    \ 'p':  "print( \r)",
    \ '[':  "[\r]",
    \ }
  let g:surround_custom_mapping.vim= {
    \'f':  "function! \r endfunction"
    \ }

  nmap s <plug>Ysurround
  nmap ss <plug>Yssurround
  let g:surround_{char2nr('e')} = "begin \r end"
  let g:surround_{char2nr('d')} = "do \r end"
  "let g:surround_{char2nr("-")} = ":\r"</plug></plug>
"}}}

NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-endwise' "{{{
  let g:endwise_no_mappings=1
"}}}
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails' "{{{
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

NeoBundle 'thinca/vim-ref' "{{{
  "}}}

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
NeoBundle 'syui/cscroll.vim'
NeoBundle 'syui/wauto.vim' "{{{
  nmap <Leader>s <Plug>(AutoWriteStart)
  nmap <Leader>ss <Plug>(AutoWriteStop)
"}}}

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
"}}}

NeoBundle 'osyo-manga/vim-over' "{{{
  nnoremap <silent> <Leader>m :OverCommandLine<CR>%s/
"}}}

NeoBundle 'osyo-manga/vim-anzu' "{{{
  " キーマップ
  nmap n nzz<Plug>(anzu-update-search-status)
  "nmap n n<Plug>(anzu-n)
  nmap N Nzz<Plug>(anzu-update-search-status)
  "nmap N N<Plug>(anzu-N)
  nmap * <Plug>(anzu-star)
  nmap # <Plug>(anzu-sharp)
  " ESC2回押しで検索ハイライト消去
  nmap <Esc><Esc> <Plug>(anzu-clear-search-status)<Plug>(anzu-clear-sign-matchline):nohlsearch<CR>
  " format = (該当数/全体数)
  let g:anzu_status_format = "(%i/%l)"
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

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'bling/vim-airline' "{{{
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline#extensions#tabline#left_sep = ''

  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'solarized'

  "let g:airline#extensions#anzu#apply = 1

  " vim-anzuの表示を statuslineに
  let g:airline#extensions#anzu#enabled = 0 
  let g:airline_section_c = '%F %{anzu#search_status()}'
  " whitespace無効
  let g:airlineeh#extensions#whitespace#enable = 0
"}}}

NeoBundle 'altercation/vim-colors-solarized' "{{{
  let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  colorscheme solarized
"}}}

NeoBundle 'w0ng/vim-hybrid' "{{{
" let g:hybrid_use_Xresources = 1
" colorscheme hybrid
"}}}
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'aharisu/vim-gdev'
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'rhysd/neco-ruby-keyword-args'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'aharisu/vim_goshrepl'
NeoBundle 'kana/vim-smartchr' " {{{
  inoremap <expr> , smartchr#loop(', ', ',  ', ',')
  "autocmd FileType perl inoremap <buffer> <expr> . smartchr#loop(' . ', '->', '.')
  "autocmd FileType perl inoremap <buffer> <expr> = smartchr#loop(' = ', ' => ', '=')
  inoremap <expr> = smartchr#loop(' = ', '=', ' == ', ' === ', '!=')
" }}}
NeoBundle 'vim-scripts/sudo.vim'

"NeoBundle 'http://git.code.sf.net/p/vim-latex/vim-latex.git'

filetype plugin indent on
filetype indent on
NeoBundleCheck


