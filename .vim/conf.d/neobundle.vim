"-----------
" NeoBundle
"-----------
filetype off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))
endif


NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'basyura/bitly.vim'
NeoBundleLazy 'basyura/twibill.vim'
NeoBundleLazy 'basyura/TweetVim', 'dev', {
      \ 'depends' : [ 'basyura/twibill.vim', 'tyru/open-browser.vim' ],
      \ 'autoload' : {
      \   'commands' : [ "TweetVimHomeTimeline", "TweetVimSay", "TweetvimUserStream", "TweetVimUserTimeline" ]
      \ }}
NeoBundleLazy 'basyura/unite-rails' "{{{
NeoBundle 'rhysd/accelerated-jk' "{{{
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/emmet-vim' "{{{
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite.vim', {
      \ 'autoload' : {
      \     'commands' : [ "Unite", "UniteWithBufferDir", "UniteWithCurrentDir" ]
      \ }}
NeoBundle 'Shougo/context_filetype.vim'
if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
  \  'depends' : ['Shougo/neosnippet', 'Shougo/context_filetype.vim', 'kana/vim-smartinput'],
  \  'autoload' : {
  \    'insert' : 1,
  \  }
  \}
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
NeoBundle 'Shougo/vimfiler', {
      \ 'depends' : ["Shougo/unite.vim"],
      \ 'autoload' : {
      \     'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplore", "VimFilerBufferDir" ],
      \     'mappings' : ['<Plug>(vimfiler_switch)'],
      \     'explorer' : 1,
      \   }
      \ }
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
NeoBundleLazy 'mattn/gist-vim', {
      \ 'autoload' : {
      \     'commands' : [ "Gist" ]
      \ }}
NeoBundle 'AndrewRadev/switch.vim' "{{{
NeoBundle 'scrooloose/syntastic' "{{{
NeoBundle 'tpope/vim-surround' "{{{
" NeoBundle 'tpope/vim-markdown'
NeoBundle 'godlygeek/tabular'
NeoBundle 'joker1007/vim-markdown-quote-syntax'
"NeoBundle 'rcmdnk/vim-markdown-quote-syntax'
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'tpope/vim-bundler'
" NeoBundle 'tpope/vim-endwise' "{{{
"   let g:endwise_no_mappings=1
" "}}}
NeoBundle 'tpope/vim-fugitive' "{{{
NeoBundle 'tpope/vim-rails', {
      \ 'autoload': {
      \     'filetypes' : ['haml', 'ruby', 'eruby']
      \ }}
NeoBundle 'thinca/vim-quickrun' "{{{
NeoBundleLazy 'thinca/vim-ref'
NeoBundle 'thinca/vim-threes'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'taka84u9/vim-ref-ri'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'tomtom/tcomment_vim' "{{{
NeoBundle 'vim-scripts/closetag.vim' "{{{
NeoBundle 'vim-scripts/ruby-matchit'
NeoBundle 'vim-scripts/Align'
NeoBundle 'kana/vim-submode'
NeoBundle 'osyo-manga/vim-over' "{{{
NeoBundle 'osyo-manga/vim-anzu' "{{{
NeoBundle 'LeafCage/yankround.vim' "{{{
NeoBundleLazy 'kien/ctrlp.vim'
NeoBundle 'itchyny/lightline.vim' "{{{
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
NeoBundle 'itchyny/calendar.vim' "{{{
NeoBundle 'rhysd/neco-ruby-keyword-args'
NeoBundle 'rhysd/unite-ruby-require.vim' "{{{
NeoBundle 'rhysd/unite-codic.vim'
NeoBundle 'koron/codic-vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'aharisu/vim_goshrepl' "{{{
NeoBundle 'aharisu/vim-gdev' "{{{
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-operator-user'
NeoBundleLazy 'nelstrom/vim-textobj-rubyblock'
NeoBundleLazy 'kana/vim-smartchr' " {{{
NeoBundleLazy 'kana/vim-smartinput'
NeoBundle 'kana/vim-smartword' "{{{
NeoBundleLazy 'cohama/vim-smartinput-endwise'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'mkitt/tabline.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bonsaiben/bootstrap-snippets'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'moro/vim-review'
NeoBundleLazy 'moll/vim-node' "{{{
NeoBundle 't9md/vim-textmanip' "{{{
NeoBundleLazy 'Simple-Javascript-Indenter', {
      \ 'autoload' : {
      \   'filetype' : ['js', 'html'],
      \   },
      \ }
" NeoBundle 'nathanaelkane/vim-indent-guides' "{{{
"   let g:indent_guides_auto_colors=0
"   autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkred   ctermbg=235
"   autocmd VimEnter,ColorScheme * :hi IndentGuidesEven guibg=darkgreen ctermbg=236
"   let g:indent_guides_enable_on_vim_startup=1
"   let g:indent_guides_start_level=1
"   let g:indent_guides_guide_size=1
"}}}
NeoBundle 'Yggdroot/indentLine' "{{{
NeoBundle 'Lokaltog/vim-easymotion' "{{{
NeoBundle 'mattn/emoji-vim'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'amdt/vim-niji' "{{{
" NeoBundle 'todesking/ruby_hl_lvar.vim' "{{{
"   " Highlight group name for Local variable
"   " Default: 'Identifier'
"   let g:ruby_hl_lvar_hl_group = 'RubyLocalVariable'
"
"   " Auto enable and refresh highlight when when text is changed. Useful but
"   " bit slow.
"   " Default: 1
"   let g:ruby_hl_lvar_auto_enable = 0
"
"   nmap <leader>he <Plug>(ruby_hl_lvar-enable)
"   nmap <leader>hd <Plug>(ruby_hl_lvar-disable)
"   nmap <leader>hr <Plug>(ruby_hl_lvar-refresh)
" "}}}
NeoBundleLazy 'majutsushi/tagbar', {
      \ "autoload" : {
      \   "commands" : [ "TagbarToggle" ],
      \ }}
" NeoBundleLazy "lambdalisue/vim-django-support", {
"       \ "autoload": {
"       \   "filetypes": ["python", "python3", "djangohtml"]
"       \ }}
NeoBundleLazy "davidhalter/jedi-vim", {
      \ "depends": ['Shougo/neocomplete.vim'],
      \ "autoload" : {
      \   "filetypes" : ["python", "python3", "djangohtml"],
      \ }}
NeoBundleLazy "lambdalisue/vim-pyenv", {
      \ "depends": ['davidhalter/jedi-vim'],
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
NeoBundle 'fatih/vim-go'
NeoBundle 'vim-jp/vim-go-extra'
NeoBundleLazy 'sjl/gundo.vim', {
      \ "autoload" : {
      \   "commands" : [ 'GundoToggle' ],
      \ }}

" NeoBundle 'http://git.code.sf.net/p/vim-latex/vim-latex.git'
NeoBundle 'https://bitbucket.org/kovisoft/slimv'
NeoBundle 'thinca/vim-scouter'
"NeoBundleLocal ~/.vim/bundle/taglist

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

