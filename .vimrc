augroup MyAutoCmd
  autocmd!
augroup END
syntax on
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
set ambiwidth=double
set tabstop=2 " タブサイズを2にする
set shiftwidth=2
set list
set listchars=trail:_,eol:↲,extends:»,precedes:«,nbsp:%,tab:»\ 
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
set spelllang+=cjk
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

" 行末スペースをハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter, * match TrailingSpaces /\s\+$/
augroup END

" Ctrl-iでヘルプ
"nnoremap :help

" ----------
" Keymapping {{{
" ----------
nnoremap [space] <Nop>
nmap     <Space> [space]
xmap     <Space> [space]
" <Leader>キーを[,]に変更
" let mapleader = ","
" let maplocalleader = ","
" noremap \ ,

" 表示行単位で移動
nnoremap <silent> j gj
nnoremap <silent> gj j
nnoremap <silent> k gk
nnoremap <silent> gk k
nnoremap <silent> $ g$
nnoremap <silent> g$ $
vnoremap <silent> j gj
vnoremap <silent> gj j
vnoremap <silent> k gk
vnoremap <silent> gk k
vnoremap <silent> $ g$
vnoremap <silent> g$ $

" JとDで半ページ移動
nnoremap J <C-D>
nnoremap K <C-U>

" <Space>h or <Space>lで行頭か行末に移動する
nnoremap [space]h ^
nnoremap [space]l $

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

set showtabline=2
" タブ移動を簡単にする
" <a href="http://doruby.kbmj.com/aisi/20091218/Vim__" target="_blank" rel="noreferrer" style="cursor:help;display:inline !important;">http://doruby.kbmj.com/aisi/20091218/Vim__</a>
nnoremap <silent> <leader>tf :<c-u>tabfirst<cr>
nnoremap <silent> <leader>tl :<c-u>tablast<cr>
nnoremap <silent> <leader>tn :<c-u>tabnext<cr>
nnoremap <silent> <S-Right>  :<C-u>tabnext<CR>
nnoremap <silent> <leader>tN :<c-u>tabNext<cr>
nnoremap <silent> <leader>tp :<c-u>tabprevious<cr>
nnoremap <silent> <S-Left>   :<C-u>tabprevious<CR>
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

" バッファ切替 {{{
nmap [space]n :<C-U>bnext<CR>
nmap [space]p :<C-U>bprevious<CR>
nnoremap <Leader>1   :e #1<CR>
nnoremap <Leader>2   :e #2<CR>
nnoremap <Leader>3   :e #3<CR>
nnoremap <Leader>4   :e #4<CR>
nnoremap <Leader>5   :e #5<CR>
nnoremap <Leader>6   :e #6<CR>
nnoremap <Leader>7   :e #7<CR>
nnoremap <Leader>8   :e #8<CR>
nnoremap <Leader>9   :e #9<CR>
" バッファ一覧
nmap ,b :buffers<CR>
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
" }}}

" .vimrcの編集を簡単にする{{{
" http://vim-users.jp/2009/09/hack74/

" .vimrcや.gvimrcを編集するためのKeymap
nnoremap <Space><Space>. :edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg :<C-u>edit $MYGVIMRC<CR>
" .vimrcや.gvimrcの変更を反映するためのKeymap
nnoremap <Space><Space>.. :<C-u>source $MYVIMRC<CR> 
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

" .vimrcや.gvimrcを変更すると、自動的に変更が反映されるようにする
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

" 検索設定
" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch
" インクリメンタルサーチを有効化
set incsearch
" 検索の時に大文字小文字を区別しない
" ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set ignorecase
set smartcase
" 検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
nohlsearch " reset hilghlight
nnoremap <silent> [space]/ :noh<CR>
map * <Plug>(visualstar-*)N
map # <Plug>(visualstar-#)N
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

" ~/.pyenv/shimsを$PATHに追加
function! IncludePath(path)
  " define delimiter depends on platform
  if has('win16') || has('win32') || has('win64')
    let delimiter = ";"
  else
    let delimiter = ":"
  endif
  let pathlist = split($PATH, delimiter)
  if isdirectory(a:path) && index(pathlist, a:path) == -1
    let $PATH=a:path.delimiter.$PATH
  endif
endfunction

"IncludePath(expand("~/.pyenv/shims"))
let $PATH = expand("~/.pyenv/shims") . ":" . $PATH


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

" conf.d/*.vim の読み込み
set rtp+=$HOME/dotfiles/.vim/
runtime! conf.d/*.vim

" colorschemeの設定
"{{{
set background=dark
syntax enable

if ($ft=='ruby')
  colorscheme Tomorrow-Night
else
  let g:hybrid_use_iTerm_colors = 1
  colorscheme hybrid
endif

" let tex_flavor = 'latex'
" set grepprg=grep\ -nH\ $*
" set shellslash
" let g:Tex_BibtexFlavor = '/usr/texbin/pbibtex'
" let g:Tex_BibtexFlavor = '/usr/texbin/upbibtex'
" let g:Tex_DefaultTargetFormat = 'pdf'
" let g:Tex_MultipleCompileFormats = 'pdf'
" let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
" let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
" let g:Tex_FormatDependency_pdf = 'dvi,pdf'
" let g:Tex_MakeIndexFlavor = ''
" let g:Tex_View_Rule_pdf = '/usr/bin/open -a Preview.app'
