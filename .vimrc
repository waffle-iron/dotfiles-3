" ====================
" Basic Settings
" ====================
" インデントの設定
" augroup : autocmdでvimが自動的に読み込む処理をグループ化し重複を避ける
" shiftwidth = vimが自動でインデントを行った際に設定する空白数
" tabstap = tabを含むファイルを開いた際、タブが空白いくつ分に相当するか
" softtabstop = tabを何文字の空白に変換するかを設定

" デフォルトの設定
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" ファイルタイプごとの設定
augroup vimrc
  autocmd!
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType javascript setlocal shiftwidth=4
  autocmd FileType html setlocal shiftwidth=4
  autocmd FileType css  setlocal shiftwidth=2
  autocmd FileType php setlocal shiftwidth=4
  autocmd FileType markdown setlocal shiftwidth=2
augroup END

" 自動でインデント
set autoindent

" 改行時にスマートにインデント
set smarttab

" ポインタ位置を表示
set ruler

" 行番号を表示
set number

" コマンド表示
set showcmd

" ハイライトサーチする
set hlsearch

" 大文字検索以外では小文字と大文字の区別をしない
set ignorecase
set smartcase

" 検索時にファイルの最後まで行ったら最初に戻る
set wrapscan

" コマンド補完の強化
set wildmenu

" ステータスの表示
set laststatus=2

" クリップボードを共有
set clipboard=unnamed

" 折込を禁止
set nofoldenable
let g:vim_markdown_folding_disabel = 1

" インクリメント・デクリメントを16進数に
set nf=hex

" マウスの使用
set mouse=a

" 前回のポインタの位置を記憶
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif

" スワップファイルをつくらない
set noswapfile

" ====================
" KEY MAPPINGS
" ====================
" <C-l> : clear hilight
nnoremap <silent>,l  :nohl<CR><C-l>

" <C-j> : <ESC>
noremap <C-j> <esc>
noremap! <C-j> <esc>

" <C-f>/<C-b> : すすむ/もどる
imap <c-f> <right>
imap <c-b> <left>

" jkの移動を表示行単位に変える。
nnoremap j gj
nnoremap gk j
nnoremap k gk
nnoremap gk k

" <ZQ> / <Q> を無効に
nnoremap ZQ <Nop>
nnoremap Q <Nop>

" <C-h><C-l> : バッファ移動
noremap <C-h> :bprevious<CR>
noremap <C-l> :bnext<CR>

" ,w : バッファを閉じる
nnoremap <silent>,w :bd<CR>

" cp : いま開いているファイルのパスをコピー
noremap <silent>cp :let @+=expand("%:p")<CR>

" 括弧を挿入したときいい感じにインデントする
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>


" ====================
" PLUGIN
" ====================
" Start NeoBudle Settings
" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

"-------------------------
" My Bundles here
"-------------------------
" vimproc.vim : 非同期実行
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'gmake',
\    },
\ }

" unite.vim
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
" <C-p> : バッファ一覧
" <C-n> : カレントディレクトリのファイル一覧
" <C-z> : 履歴一覧
" insert modeではじめる
" let g:unite_enable_start_insert=1
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
" make sources the editing file's directory
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" open with spliting window
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" open with vertically splitting window
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" quit when <ESC><ESC> is typed
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" レジスタ履歴をさかのぼって貼り付け候補をさがす
let g:unite_source_history_yank_enable = 1
nnoremap <silent>,p :Unite history/yank<CR>

" neocompelete
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
""""""""""""""""""""""""""""""
if neobundle#is_installed('neocomplete')
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_ignore_case = 1
    let g:neocomplete#enable_smart_case = 1
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
 elseif neobundle#is_installed('neocomplcache')
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
 endif
 inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
 inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" neosnippet.vim
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" airline.vim
NeoBundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set guifont=Inconsolate\ Regular\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set t_Co=256
let g:airline_theme='laederon'
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'
" let g:airline_linecolumn_prefix = '⭡'
" let g:airline_branch_prefix = '⭠'
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮀'

" NERDTree
NeoBundle 'scrooloose/nerdtree'
" <C-E> : NerdTreeを開く
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" vim-auto-save
NeoBundle 'vim-scripts/vim-auto-save'
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
" デフォルトで有効にする
let g:auto_save = 1

" vim-fugitive
NeoBundle 'tpope/vim-fugitive'
" `:Gstatus`  : 新しいウィンドウでgit statusを表示
"     Gstatus上の変更のあったファイルにカーソルを合わせた状態で
"     D    : `:Gdeff`(差分表示)
"     -    : addとresetの切り替え
"     p    : パッチを表示
"     <CR> : ファイル表示
" `:Gwrite`  : 現在のソースをgit add(引数にパスを指定できる)
" `:Gwq`     : `:Gwrite`のあとに`:wq`が呼ばれる
" `:Gread`   : 現在のソースの直前のコミットの時のソースを表示
"             (表示されたファイルは上書きされたのではなくバッファに展開されただけ）
" `:Gmove` : 現在のソースをgit mvする(移動先のディレクトリを引数に指定）
" `:Gremove` : 現在開いているソースをgit rmする
" `:Gcommit` : git commit
" `:Gdiff`   : 現在のソースに加えられた変更をvimdiffで見せる
"              (引数にrevisionを指定できる。例えばmasterを指定すればmasterブランチとの差分が見れる)
"              変更をインデクスに含めたい部分のみ選択してdpで反映できる(git add -pをグラフィカルに行える)
" `:Gblame`  : 現在のソースをgit blame(履歴をたどる)

" Preview : PrevimOpenでマークダウンプレビュー
NeoBundle 'kannokanno/previm'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'tyru/open-browser.vim'
autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown

" vim-gista
NeoBundleLazy 'lambdalisue/vim-gista', {
    \ 'depends': [
    \    'Shougo/unite.vim',
    \    'tyru/open-browser.vim',
    \ ],
    \ 'autoload': {
    \    'commands': ['Gista'],
    \    'mappings': '<Plug>(gista-',
    \    'unite_sources': 'gista',
    \}}
let g:gista#github_user = 'ystkme'

" vim-autoclose : 閉じ括弧の自動挿入
NeoBundle 'Townk/vim-autoclose'

" emmet("<C-y>,"がトリガー)
NeoBundle 'mattn/emmet-vim'
" enabele emmet only for html/css
 let g:user_emmet_install_global = 0
 autocmd FileType html,css,php,erb EmmetInstall
" redefine trigger key to <TAB>
" html<Plug>(emmet-expand-abbr)
autocmd Filetype html,css imap <buffer><expr><tab>
    \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
    \ "\<tab>"

" quickran : コマンド実行
NeoBundle 'thinca/vim-quickrun'
" 非同期実行
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config._={ 'runner':'vimproc',
\       "runner/vimproc/updatetime" : 10,
\       "outputter/buffer/close_on_empty" : 1,
\       'outputter/buffer/split': ':botright'
\ }
" 右側のペインで開く
let g:quickrun_config={'_': {'split': 'vertical'}}
set splitright

" rename.vim : `:Rename`でカレントファイルの名前を変える
NeoBundle 'danro/rename.vim'

" grep.vim : 検索の強化
NeoBundle 'grep.vim'

" syntastic : シンタクスチェック
NeoBundle 'scrooloose/syntastic'
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_mode_map = {
      \  'mode': 'passive',
      \ 'active_filetypes' : [],
      \ 'passive_filetypes' : [] }
let g:syntastic_javascript_checkers = ['jshint']
let g:syntstic_ruby_checkers = ["rubocop"]
nnoremap <silent>,e :SyntasticToggleMode<CR>

" vim-endwise : Rubyでendを自動挿入
NeoBundle 'tpope/vim-endwise'

" vim-trailing-whitespace : 行末の空白をハイライト
NeoBundle 'bronson/vim-trailing-whitespace'

" <C--><C--> : コメントアウト
NeoBundle 'tomtom/tcomment_vim'

" vim-surround : 範囲選択して置換
NeoBundle 'tpope/vim-surround'
" s[範囲][記号] -> 記号で範囲を囲む
" cs[記号] -> 記号を置換
" ds[記号] -> 記号を削除
" S[記号] -> 選択範囲を記号で囲む

" rsense-vim : Ruby
NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', { 'autoload' : {
   \ 'insert' : 1,
   \ 'filetypes': 'ruby',
   \ }}
" activate omni complete when . or :: is typed
 if !exists('g:neocomplete#force_omni_input_patterns')
   let g:neocomplete#force_omni_input_patterns = {}
 endif
 let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

 " settings for rsense
 let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'

call neobundle#end()
" Required:
filetype plugin indent on

" ====================
" COLOR SCHEME
" ====================
NeoBundle 'altercation/vim-colors-solarized'
syntax enable
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans = 1
" let g:solarized_visibility="high"
" let g:solarized_contrast="high"
colorscheme solarized

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"-------------------------
" End NeoBundle Settings
"-------------------------
