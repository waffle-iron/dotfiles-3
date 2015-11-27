" General
" =======
if v:version > 740                  " Never show undofile
  set noundofile
endif
set visualbell t_vb=                " Never flash
set nofoldenable                    " Never fold
set noswapfile                      " Never backup
set nobackup
set nowritebackup
set backspace=indent,eol,start

set mouse=a                         " Enable mouse
set clipboard+=unnamed              " Copy to clipboard
set helplang=ja                     " Use Japanese doc
set helpheight=999
set encoding=utf-8
set fileencodings=utf-8
set synmaxcol=300
set lazyredraw
set ttyfast

set laststatus=2                    " Always show status line
set ruler                           " Show cursor position
set number                          " Show line number
set wrap                            " Wrap the lines longer than window width
set display=lastline                " Show the last lines as long as possible

set hlsearch                        " Hilight the searched words
set incsearch                       " Hilight matched words while typing
set ignorecase                      " Search ignoring case
set smartcase                       " Case sensitive if search contains upper case
set wrapscan                        " Searches wrap around the end of the file

set shiftround                      " Round indent to multiple of 'shiftwidth'
set ambiwidth=double                " Use twice the width of ASCII characters
set pumheight=10                    " Height for completion
set matchpairs& matchpairs+=<:>     " Add to pair matches
set showmatch                       " Jump to matched pair when bleckets inserted
set matchtime=1
set hidden                          " Enable opening files while unsaved
set switchbuf=useopen               " Behavior for switching buffers

set wildmenu                        " Turn on wildmenu
set wildmode=longest:full,full
set formatoptions+=j                " Support for numbered/bullet lists
set nrformats=hex

set autoindent
set smartindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set tags+=.git/tags

augroup disableAutoComment
  autocmd!
  autocmd FileType markdown setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" Keymappings
" ===========
" Disable Unused keys
map ZQ <Nop>
map Q <Nop>
map s <Nop>
" Set <Leader>
let g:mapleader = "\<Space>"
" Escape
noremap <C-j> <esc>
noremap! <C-j> <esc>
cnoremap <C-j> <Esc>
" Go and Back
inoremap <C-f> <Right>
inoremap <C-b> <Left>
" Delete to end
inoremap <silent> <C-d> <Esc>lc$
" Never skip folded lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
vnoremap j gj
vnoremap gj j
vnoremap k gk
vnoremap gk k
" Yank until end of line
nnoremap Y y$
" Jump to matched pairs
nnoremap <Tab> %
vnoremap <Tab> %
" Increment / Decreament
nnoremap + <C-a>
nnoremap - <C-x>
" Expand brackets
inoremap {<CR> {}<Left><CR><ESC><S-o>
inoremap [<CR> []<Left><CR><ESC><S-o>
inoremap (<CR> ()<Left><CR><ESC><S-o>
" Save
nnoremap <Leader>w :w<CR>
" Create new buffer
nnoremap <silent><Leader>n :enew<CR>
" Move between buffers
nnoremap <silent><c-h> :bprevious<CR>
nnoremap <silent><c-l> :bnext<CR>
" Close buffer and pane
nnoremap <silent><Leader>d :bd<CR>
" Clear hilight
nnoremap <silent><Leader>l :nohl<CR>
" Copy the opening file's path
nnoremap <silent><Leader>y :let @+=expand("%:p")<CR>

" FileType
" ===========
augroup fileTypeSettings
  autocmd!
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scss       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sass       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType stylus     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType javascript setlocal sw=4 sts=4 ts=4 et
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType eruby      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType slim       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType markdown   setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
augroup END


" NeoBundle FROM
" ==============
 if has('vim_starting')
   if &compatible
     set nocompatible " Be iMproved
   endif
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'linux' : 'make',
    \     'unix' : 'gmake',
    \    },
    \ }

" unite.vim
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'basyura/unite-rails'
" vimfiler
NeoBundle 'Shougo/vimfiler'
" neocomplete.vim
NeoBundle 'Shougo/neocomplete.vim'
" neosnippet
NeoBundle 'Shougo/neosnippet'
" incsearch.vim
NeoBundle 'haya14busa/incsearch.vim'
" syntastic
NeoBundle 'scrooloose/syntastic'
" yankround
NeoBundle 'LeafCage/yankround.vim'
" vim-auto-save
NeoBundle 'vim-scripts/vim-auto-save'
" vim-bufkill
NeoBundle 'vim-scripts/bufkill.vim'
" vim-operator-surround
NeoBundle 'rhysd/vim-operator-surround'
NeoBundle 'kana/vim-operator-user'
" vim-easy-align
NeoBundle 'junegunn/vim-easy-align'
" tagbar
NeoBundle 'majutsushi/tagbar'
" Git
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'

" Substite with ':S/{pattern}/{string}/[flags]', Replace with'/c' options
" ctr: snake_case / crm: MixedCase / src: camelCase / crs: snake_case / cru: UPPER_CASE
NeoBundle 'tpope/vim-abolish'
" ae : entire content / ie : excluding empty lines
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tyru/open-browser.vim'

" Document
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" Ruby and Rails
" ==============
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-endwise'
" g S : split / g J : join
NeoBundle 'AndrewRadev/splitjoin.vim'
" necomplete-rsense.vim
NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', {
      \ 'insert' : 1,
      \ 'autoload': {'filetypes': ['ruby']}
      \ }
" vim-seeing-is-believing
NeoBundleLazy 'hwartig/vim-seeing-is-believing', {
      \ 'autoload': {
      \   'filetypes': ['ruby']}
      \ }

" JavaScript
" ==========
NeoBundleLazy 'lfilho/cosco.vim', {
      \ "autoload": {"filetypes":['javascript','css','scss']}
      \ }
NeoBundleLazy 'pangloss/vim-javascript', {
      \ 'autoload' : {'filetypes': ['javascript']}
      \ }
NeoBundleLazy 'jelera/vim-javascript-syntax', {
      \ 'autoload':{'filetypes':['javascript']}
      \ }
NeoBundleLazy '1995eaton/vim-better-javascript-completion', {
      \ 'autoload': {'filetypes':['javascript']}
      \ }
NeoBundleLazy 'moll/vim-node', {
      \ 'autoload': {'filetypes':['javascript']}
      \ }

" Markup
" ======
NeoBundleLazy 'hail2u/vim-css3-syntax', {
      \ "autoload": {"filetypes":['css','sass','scss']}
      \ }
NeoBundleLazy 'cakebaker/scss-syntax.vim', {
      \ "autoload": {"filetypes":['sass','scss']}
      \ }
NeoBundleLazy 'gorodinskiy/vim-coloresque', {
      \ "autoload": {"filetypes":['css','sass','scss']}
      \ }
NeoBundleLazy 'KabbAmine/vCoolor.vim', {
      \ "autoload": {"filetypes":['css','sass','scss']}
      \ }

" Markdown
" ========
NeoBundleLazy 'suan/vim-instant-markdown', {
      \ "autoload": {"filetypes":['markdown']}
      \ }
NeoBundle 'kannokanno/previm', {
      \ "autoload": {"filetypes":['markdown']}
      \ }

" Gist
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

" Appearance
" ==========
" Includes ruby, es6, slim, html5 etc..
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'vim-scripts/AfterColors.vim'
" vim-better-whitespace
NeoBundle 'ntpeters/vim-better-whitespace'
" Yggdroot/indentLine
NeoBundle 'Yggdroot/indentLine'
" vim-airline
NeoBundle 'bling/vim-airline'
NeoBundle 'whatyouhide/vim-gotham'

call neobundle#end()
" Required:
filetype plugin indent on
NeoBundleCheck
" NeoBundle END
" =============

" Unite.vim
" ---------
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_rec_max_cache_files = 5000
let g:unite_source_file_mru_limit      = 200
augroup unite
  autocmd!
  autocmd FileType unite nmap <buffer><C-J> <Plug>(unite_exit)
augroup END
" The prefix key.
nnoremap [unite]  <Nop>
nmap     <space>  [unite]

" Directory
nnoremap <silent> [unite]u :<c-u>call DispatchUniteFileRecAsyncOrGit()<CR>
nnoremap <silent> [unite]n :<c-u>UniteWithBufferDir file file/new<CR>
" history
nnoremap <silent> [unite]h :<c-u>Unite file_mru<CR>
" Opening buffers
nnoremap <silent> [unite]b :<c-u>Unite buffer<CR>
" Copy history
nnoremap <silent> [unite]p :<c-u>Unite yankround<CR>
" Outline
nnoremap <silent> [unite]o :<c-u>Unite outline:. -buffer-name=search-buffer<CR>
" Grep
nnoremap <silent> [unite]g :<c-u>Unite grep:. -buffer-name=search-buffer<CR>
" Tag
nnoremap <silent> [unite]c :<c-u>Unite tag<CR>

" Use 'ag' for Unite grep
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --hidden --ignore'
  let g:unite_source_grep_recursive_opt = ''
endif
" Check if directory is git project
let s:ignore_patterns = 'vendor/\|.bundle/\|\.\(gif\|jpe\?g\|png\|webp\)$'
" let s:unite_ignore_patterns = '.\(gif\|jpe\?g\|png\|webp\)$'
call unite#custom#source('file_rec/git', 'ignore_pattern', s:ignore_patterns)
function! DispatchUniteFileRecAsyncOrGit()
  " If current directory is git repo
  if isdirectory(getcwd()."/.git")
    Unite file_rec/git:--cached:--others:--exclude-standard
  else
    Unite file_rec/async
  endif
endfunction

" vimfiler
" --------
nnoremap <silent><C-e> :VimFiler -explorer -winwidth=25 -toggle<CR>
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
" close vimfiler automatically when there are only vimfiler open
augroup vimfiler
  autocmd!
  autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif
augroup END
let s:hooks = neobundle#get_hooks("vimfiler")

" neocomplete.vim
" ---------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'

" neosnippet
" ----------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#disable_runtime_snippets = {
		\   '_' : 1,
		\ }
let g:neosnippet#snippets_directory='~/.vim/snippet'

" Detect filetype
augroup filetypedetect
  autocmd!  BufEnter *rb call s:LoadRailsSnippet()
augroup END

function! s:LoadRailsSnippet()
  " get current directory's path
  let s:current_file_path = expand("%:p:h")

  " Ignore if path is in app directory
  if ( s:current_file_path !~ "app/")
    return
  elseif ( s:current_file_path =~ "app/models" )
    NeoSnippetSource ~/.vim/snippet/rails.model.snip
  elseif ( s:current_file_path =~ "app/controllers" )
    NeoSnippetSource ~/.vim/snippet/rails.controller.snip
  elseif ( s:current_file_path =~ "app/views" )
    NeoSnippetSource ~/.vim/snippet/rails.view.snip
  elseif ( s:current_file_path =~ "app/helpers" )
    NeoSnippetSource ~/.vim/snippet/rails.helper.snip
  elseif ( s:current_file_path =~ "app/assets" )
    NeoSnippetSource ~/.vim/snippet/rails.asset.snip
  endif
endfunction

autocmd User Rails.view*                 NeoSnippetSource ~/.vim/snippet/ruby.rails.view.snip
autocmd User Rails.controller*           NeoSnippetSource ~/.vim/snippet/ruby.rails.controller.snip
autocmd User Rails/db/migrate/*          NeoSnippetSource ~/.vim/snippet/ruby.rails.migrate.snip
autocmd User Rails/config/routes.rb      NeoSnippetSource ~/.vim/snippet/ruby.rails.route.snip

" incsearch.vim
" -------------
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
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" syntastic
" ---------
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
highlight SyntasticErrorSign ctermbg=000
let g:syntastic_loc_list_height=5
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes' : [],
      \ 'passive_filetypes' : [] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_scss_checkers = ['scss_lint']
nnoremap <silent><Leader>e :Errors<CR>
nnoremap <silent><Leader>c :lclose<CR>

" yankround
" ---------
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <expr><C-p> yankround#is_active() ? "\<Plug>(yankround-prev)" : "<SID>(GitGutterPrevHunk)"
nmap <expr><C-n> yankround#is_active() ? "\<Plug>(yankround-next)" : "<SID>(GitGutterNextHunk)"
let g:yankround_use_region_hl = 1

" vim-auto-save
" -------------
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
let g:auto_save = 1
nnoremap ,a :AutoSaveToggle<CR>

" bufkill.vim
" -----------
nnoremap <c-d> :BD<CR>

" vim-operator-surround
" ---------------------
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sc <Plug>(operator-surround-replace)

" vim-easy-align
" --------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
vmap <c-m> <Plug>(EasyAlign)

" switch.vim
" ----------
nnoremap ! :Switch<CR>
let s:switch_definition = {
      \ '*': [
      \   ['is', 'are']
      \ ],
      \ 'ruby,eruby,haml,slim' : [
      \   ['if', 'unless'],
      \   ['while', 'until'],
      \   ['.blank?', '.present?'],
      \   ['include', 'extend'],
      \   ['class', 'module'],
      \   ['.inject', '.delete_if'],
      \   ['.map', '.map!'],
      \   ['attr_accessor', 'attr_reader', 'attr_writer'],
      \ ],
      \ 'ruby.application_template' : [
      \   ['yes?', 'no?'],
      \   ['lib', 'initializer', 'file', 'vendor', 'rakefile'],
      \   ['controller', 'model', 'view', 'migration', 'scaffold'],
      \ ],
      \ 'erb,html,php' : [
      \   { '<!--\([a-zA-Z0-9 /]\+\)--></\(div\|ul\|li\|a\)>' : '</\2><!--\1-->' },
      \ ]
      \ }

" tagbar
" ------
nnoremap <silent><Leader>t :TagbarToggle<CR>
" let g:tagbar_sort = 0

" vim-fugitive
" -------------
nnoremap <silent><Leader>gb :Gblame<CR>
nnoremap <silent><Leader>gc :Gcommit -v<CR>
nnoremap <silent><Leader>gd :Gdiff<CR>
" Checkout current file
nnoremap <silent><Leader>gx :Gread<CR>
nnoremap <silent><Leader>gp :Gpush<CR>
nnoremap <silent><Leader>gs :Gstatus<CR>
nnoremap <silent><Leader>ga :Gwrite<CR>
nnoremap <silent><Leader>gu :Git reset HEAD %<CR>

" gitv
" ---
nnoremap <silent><Leader>gl :Gitv<CR>
nnoremap <silent><Leader>gf :Gitv!<CR>

" vim-gitgutter
" -------------
nnoremap <silent><SID>(GitGutterPrevHunk) :<C-u>GitGutterPrevHunk<CR>zz
nnoremap <silent><SID>(GitGutterNextHunk) :<C-u>GitGutterNextHunk<CR>zz
let g:gitgutter_sign_column_always = 1
nmap <c-a> <Plug>GitGutterStageHunk
nmap <c-x> <Plug>GitGutterRevertHunk

" Ruby and Rails
" ==============
" unite-rails
nnoremap <silent> [unite]rc :<C-u>Unite rails/controller<CR>
nnoremap <silent> [unite]rm :<C-u>Unite rails/model<CR>
nnoremap <silent> [unite]rv :<C-u>Unite rails/view<CR>
nnoremap <silent> [unite]rh :<C-u>Unite rails/helper<CR>
nnoremap <silent> [unite]rd :<C-u>Unite rails/db<CR>
nnoremap <silent> [unite]rj :<C-u>Unite rails/javascript<CR>
nnoremap <silent> [unite]rs :<C-u>Unite rails/stylesheet<CR>
nnoremap <silent> [unite]rr :<C-u>Unite rails/route<CR>
nnoremap <silent> [unite]rg :<C-u>Unite rails/gemfile<CR>
" neocomplete-rsense.vim
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'
" vim-seeing-is-believing
" -----------------------
augroup sib
  autocmd!
  autocmd FileType ruby nmap <silent>mm <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby vmap <silent>mm <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby nmap <silent>mr <Plug>(seeing-is-believing-run)
  autocmd FileType ruby vmap <silent>mr <Plug>(seeing-is-believing-run)
augroup END

" Add pair words
source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1
augroup matchit
  au!
  au FileType ruby let b:match_words = '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
augroup END
" Hilight erb files properly
augroup erb
    autocmd!
  autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
augroup END

" JavaScript
" ==========
" vim-better-javascript-completion
let g:vimjs#casesensitive = 0
let g:vimjs#smartcomplete = 1
" cosco.vim
" ---------
augroup cosco
  autocmd!
  autocmd FileType css,scss,javascript nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
  autocmd FileType css,scss,javascript inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>
augroup END

" Markup
" ======
" open-browser.vim
" ----------------
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" Markdown
" ========
" vim-instant-markdown
" --------------------
let g:instant_markdown_autostart = 0
nnoremap <silent><Leader>m :InstantMarkdonwPreview<CR>

" previm
" ------
let g:previm_show_header = 0

let g:vim_markdown_folding_disabel = 1
augroup markdown
  autocmd!
  " Filetype for markdown
  autocmd markdown BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  " Never hilight itailc in markdown
  autocmd markdown FileType markdown hi! def link markdownItalic LineNr
augroup END

" vim-better-whitespace
" ---------------------
let g:better_whitespace_filetypes_blacklist = ['unite', 'vimfiler']
" indentLine
" Disable by default
let g:indentLine_enabled = 0
let g:indentLine_faster = 1
let g:indentLine_char = '¦'
let g:indentLine_color_term = 232
nnoremap <silent><Leader>i :IndentLinesToggle<CR>
" vim-airline
" -------
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set guifont=Inconsolate\ Regular\ for\ Powerline:h15
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

" USER
" ====
" dash from vim
function! s:dash(...)
  let ft = &filetype
  if &filetype == 'ruby'
    let ft = 'rb'
  elseif &filetype == 'javascript'
    let ft = 'js'
  endif
  let ft = ft.':'
  let word = len(a:000) == 0 ? input('Dash search: ', ft.expand('<cword>')) : ft.join(a:000, ' ')
  call system(printf("open dash://'%s'", word))
endfunction
command! -nargs=* Dash call <SID>dash(<f-args>)

" STYLE
" =====
syntax on
colorscheme gotham
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" Make comment italic
highlight Comment cterm=italic gui=italic
