augroup MyAutoCmd
  autocmd!
augroup END

" --------------------
" NEOBUNDLE
" --------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'gmake',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
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
NeoBundleLazy 'Shougo/neosnippet', {
  \ "autoload": {"insert": 1}}
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'whatyouhide/vim-gotham'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'ntpeters/vim-better-whitespace'
let g:better_whitespace_filetypes_blacklist = ['unite', 'vimfiler']
NeoBundle 'grep.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'danro/rename.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'lfilho/cosco.vim'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'rhysd/vim-operator-surround'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'moll/vim-node'
NeoBundle '1995eaton/vim-better-javascript-completion'
let g:vimjs#casesensitive = 0
let g:vimjs#smartcomplete = 1
" NeoBundle 'mattn/jscomplete-vim'
" autocmd FileType javascript
"     \ :setl omnifunc=jscomplete#CompleteJS
" let g:jscomplete_use = ['dom', 'moz', 'es6th']
NeoBundle 'tpope/vim-endwise'
NeoBundle 'szw/vim-tags'
NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', { 'autoload' : {
      \ 'insert' : 1,
      \ 'filetypes': 'ruby',
      \ }}
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'
NeoBundle 'hwartig/vim-seeing-is-believing'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown
NeoBundleLazy 'mattn/emmet-vim', {
  \ "autoload": {"filetypes":['html','css']}}
let g:user_emmet_install_global = 0
autocmd FileType html,css,php,erb EmmetInstall
autocmd Filetype html,css imap <buffer><expr><tab>
      \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
      \ "\<tab>"
NeoBundle 'vim-scripts/vim-auto-save'
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
let g:auto_save = 1
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

NeoBundleCheck
call neobundle#end()
" Required:
filetype plugin indent on

" --------------------
" BASIC SETTINGS
" --------------------
" insertモード時のカーソルをVertical Barに
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
set ruler
set number
" set showcmd
set wrap "長いテキストの折り返し
set hlsearch
set incsearch
set ignorecase
set smartcase
set shiftround 
set infercase " 補完時に大文字小文字を区別しない
set laststatus=2
set clipboard=unnamedplus,unnamed
set helplang=ja "日本語のヘルプをデフォルトに設定
set wrapscan
set ambiwidth=double " 全角文字をきれいに表示
set pumheight=10 " コマンド補完候補の数
set wildmenu " コマンド補完を強化
set wildmode=longest:full,full " 閉じ括弧入力時に対応する括弧にジャンプ。0.1秒
set showmatch "対応括弧を表示
set formatoptions+=j "コメント行でJしたとき途中のシンボルを削除
set matchtime=1
set display=lastline
set nf=hex " インクリメント・デクリメントを16進数に
set mouse=a " マウスの使用
set helpheight=999 " helpの高さを設定
set hidden " バッファ切替の際、保存していなくても警告しない
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set t_vb=
set novisualbell
set noswapfile " スワップファイルをつくらない
set nobackup
set nowritebackup
set nofoldenable " 折込を禁止
let g:vim_markdown_folding_disabel = 1
autocmd FileType html,css,javascript,ruby setlocal formatoptions-=ro " 改行時に自動コメント挿入しない
set matchpairs& matchpairs+=<:> " 対応括弧に'<'と'>'のペアを追加
" 前回のポインタの位置を記憶
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif
" カラムを追加
augroup mine
    au BufWinEnter * sign define mysign
    au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
augroup END
if has('unnamedplus')
  " set clipboard& clipboard+=unnamedplus " 2013-07-03 14:30 unnamed 追加
  set clipboard& clipboard+=unnamedplus,unnamed 
else
  " set clipboard& clipboard+=unnamed,autoselect 2013-06-24 10:00 autoselect 削除
  set clipboard& clipboard+=unnamed
endif
" matchit.vim
source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1
" ruby
augroup matchit
  au!
  au FileType ruby let b:match_words = '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
augroup END
" マークダウンのファイルタイプ
autocmd MyAutoCmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" マークダウンでイタリックのハイライトをしない
autocmd MyAutoCmd FileType markdown hi! def link markdownItalic LineNr
" --------------------
" KEYMAPPINGS
" --------------------
" <Space>を<Leader>に
nmap <Space> <Leader>
let mapleader = "\<Space>"
" vim-operator-surround等で使うため
map s <Nop>
" <ZQ> / <Q> を無効に
nnoremap ZQ <Nop>
nnoremap Q <Nop>
" esc
noremap <C-j> <esc>
noremap! <C-j> <esc>
cnoremap <C-j> <Esc>
" すすむ/もどる
inoremap <C-f> <Right>
inoremap <C-b> <Left>
" 移動を表示行単位に変える。
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
" vを二回で行末まで選択
vnoremap v $h
" Yを行末までのヤンクに
nnoremap Y y$
" <C-h><C-l> : バッファ移動
noremap <silent><C-h> :bprevious<CR>
noremap <silent><C-l> :bnext<CR>
" ,w : バッファを閉じる
nnoremap <silent><c-z> :bd<CR>
" TABで対応ペアにジャンプk
nmap <Tab> %
vmap <Tab> %
" + / - でインクリメント・デクリメント
nnoremap + <C-a>
nnoremap - <C-x>
" ハイライトをクリア
nnoremap <silent><Leader>l  :nohl<CR>
" 画面分割
nnoremap <silent><Leader>v :split<CR>
nnoremap <silent><Leader>s :vsplit<CR>
" コマンドライン
nnoremap <silent><Leader>c :shell<CR>
" ブラウザプレビュー
nnoremap <silent><Leader>o :!open %<CR>
" cp : いま開いているファイルのパスをコピー
noremap <silent>cp :let @+=expand("%:p")<CR>

" --------------------
" INDENT
" --------------------
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

if has("autocmd")
  filetype plugin on
  filetype indent on

  " et = expandtab
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 noet
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType sass        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType stylus      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType eruby      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType slim       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType markdown   setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 noet
endif " has("autocmd")

inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" --------------------
" Appearance
" --------------------
colorscheme gotham
syntax enable
set t_Co=256

" --------------------
" PLUGIN SETTINGS
" --------------------
" unite
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
nnoremap <silent><Leader>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --hidden --ignore'
  let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <silent><Leader>h :<C-u>Unite file_mru<CR>
nnoremap <silent><Leader>b :<C-u>Unite buffer<CR>
nnoremap <silent><Leader>y :<C-u>Unite yankround<CR>

" neocomplete
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'

" neosnippet
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
let s:my_snippet = '~/.vim/snippet/'
let g:neosnippet#snippets_directory = s:my_snippet

" vimfiler
nnoremap <silent><C-e> :VimFilerBufferDir -explorer -winwidth=25 -toggle<CR>
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
" close vimfiler automatically when there are only vimfiler open
autocmd MyAutoCmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif
let s:hooks = neobundle#get_hooks("vimfiler")

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
augroup incsearch-keymap
    autocmd!
    autocmd VimEnter * call s:incsearch_keymap()
augroup END
function! s:incsearch_keymap()
    IncSearchNoreMap <C-f>  <Over>(incsearch-scroll-f)
    IncSearchNoreMap <C-d>  <Over>(incsearch-scroll-b)
    IncSearchNoreMap <C-j>  <Esc>
endfunction

" vim-operator-surround
map <silent>sc <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" airline
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" set guifont=Inconsolate\ Regular\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set t_Co=256
let g:airline_theme='gotham'
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮀'
let g:airline_symbols = {}
let g:airline_symbols.space = ' '
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" quickrun
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config._={ 'runner':'vimproc',
      \       "runner/vimproc/updatetime" : 10,
      \       "outputter/buffer/close_on_empty" : 1,
      \       'outputter/buffer/split': ':botright'
      \ }
let g:quickrun_config={'_': {'split': 'vertical'}}
set splitright

" yankround
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
" noremap <Leader>p :Unite yankround <CR>
let g:yankround_use_region_hl = 1

" syntastic
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
highlight SyntasticErrorSign ctermbg=000
let g:syntastic_loc_list_height=7
let g:syntastic_mode_map = {
      \  'mode': 'active',
      \ 'active_filetypes' : [],
      \ 'passive_filetypes' : [] }
let g:syntastic_javascript_checkers = ['jshint']
let g:syntstic_ruby_checkers = ["rubocop"]
nnoremap <silent><Leader>e :Errors<CR>
nnoremap <silent><Leader>q :lclose<CR>

" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" cosco.vim
autocmd FileType css,javascript,coffee,db,sql nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>

" vim-seeing-is-believing
autocmd FileType ruby nmap <silent>mm <Plug>(seeing-is-believing-mark)
autocmd FileType ruby vmap <silent>mm <Plug>(seeing-is-believing-mark)
autocmd FileType ruby nmap <silent>mr <Plug>(seeing-is-believing-run)
autocmd FileType ruby vmap <silent>mr <Plug>(seeing-is-believing-run)

" dash from vim
function! s:dash(...)
  let ft = &filetype
  if &filetype == 'python'
    let ft = ft.'2'
  endif
  let ft = ft.':'
  let word = len(a:000) == 0 ? input('Dash search: ', ft.expand('<cword>')) : ft.join(a:000, ' ')
  call system(printf("open dash://'%s'", word))
endfunction
command! -nargs=* Dash call <SID>dash(<f-args>)

highlight Comment cterm=italic gui=italic
