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
set nowrap                          " Wrap the lines longer than window width
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
set matchtime=1
set hidden                          " Enable opening files while unsaved
set switchbuf=useopen               " Behavior for switching buffers
set splitbelow                      " New buffer show up right

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

" Keymappings
" ===========
" Disable Unused keys
map ZQ <Nop>
map Q <Nop>
map s <Nop>
" Set <Leader>
let g:mapleader = "\<Space>"
" Escape
noremap  <c-j>  <Esc>
noremap! <c-j>  <Esc>
cnoremap <c-j>  <Esc>
nnoremap  r<c-j> r<Esc>
" Go and Back
inoremap <c-f> <Right>
inoremap <c-b> <Left>
inoremap <c-e> <Esc>$a
inoremap <c-a> <Esc>^i
" Delete to end
inoremap <c-c> <Esc>c$
inoremap <c-d> <Esc>d$
" Never skip folded lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
vnoremap j gj
vnoremap gj j
vnoremap k gk
vnoremap gk k
vnoremap <Leader>s :sort<CR>
" Yank until end of line
nnoremap Y y$
" Jump to matched pairs **Use 'map'**
map <Tab> %
" Increment / Decreament
nnoremap + <c-a>
nnoremap - <c-x>
" Expand brackets
inoremap {<CR> {}<Left><CR><Esc><S-o>
inoremap [<CR> []<Left><CR><Esc><S-o>
inoremap (<CR> ()<Left><CR><Esc><S-o>
" Save
nnoremap <Leader>w :w<CR>
" Create new buffer
nnoremap <silent><Leader>N :enew<CR>
" Move between buffers
nnoremap <silent><c-h> :bprevious<CR>
nnoremap <silent><c-l> :bnext<CR>
" Split pane
nnoremap <silent><Leader>v :vsplit<CR>
" Clear hilight
nnoremap <silent><Leader>l :nohl<CR>
" Close quickfix
nnoremap <silent><Leader>c :cclose<CR>
" Open quickfix again
nnoremap <silent><Leader>C :copen<CR>
" Copy the opening file's path
nnoremap <silent><Leader>y :let @+=expand("%:p")<CR>
" Command
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

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

autocmd FileType scss set iskeyword+=-

" Disable auto comment in markdown
augroup disableAutoComment
  autocmd!
  autocmd FileType markdown setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" ==============
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

" vimfiler
NeoBundle 'Shougo/vimfiler'
" neocomplete.vim
NeoBundle 'Shougo/neocomplete.vim'
" neosnippet
NeoBundle 'Shougo/neosnippet'
" unite.vim
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'basyura/unite-rails'
" yankround
NeoBundle 'LeafCage/yankround.vim'
" incsearch.vim
NeoBundle 'haya14busa/incsearch.vim'
" syntastic
NeoBundle 'scrooloose/syntastic'
" vim-auto-save
NeoBundle 'vim-scripts/vim-auto-save'
" vim-bufkill
NeoBundle 'vim-scripts/bufkill.vim'
NeoBundle 'vim-scripts/BufOnly.vim'
" vim-operator-surround
NeoBundle 'rhysd/vim-operator-surround'
NeoBundle 'kana/vim-operator-user'
" vim-easy-align
NeoBundle 'junegunn/vim-easy-align'
" Git
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
" Utilities
NeoBundle 'danro/rename.vim'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tyru/open-browser.vim'
" Document
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" Ruby and Rails
" ==============
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-endwise'
" g S : split / g J : join
NeoBundle 'AndrewRadev/splitjoin.vim'
" necomplete-rsense.vim
NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', {
      \ 'insert' : 1,
      \ 'autoload': {'filetypes': ['ruby']}
      \ }
NeoBundle 'tpope/vim-dispatch'
" vim-rspec
NeoBundleLazy 'thoughtbot/vim-rspec', {
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
      \ "autoload": {"filetypes":['javascript','css','sass','scss']}
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
NeoBundle 'mattn/emmet-vim'
NeoBundleLazy 'hail2u/vim-css3-syntax', {
      \ "autoload": {"filetypes":['css']}
      \ }
NeoBundle "cakebaker/scss-syntax.vim"
NeoBundleLazy 'cakebaker/scss-syntax.vim', {
      \ "autoload": {"filetypes":['sass','scss']}
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

" Appearance
" ==========
NeoBundle 'sheerun/vim-polyglot'
" vim-better-whitespace
NeoBundle 'ntpeters/vim-better-whitespace'
" vim-indent-guide
NeoBundle 'nathanaelkane/vim-indent-guides'
" vim-airline
NeoBundle 'bling/vim-airline'
NeoBundle 'nanotech/jellybeans.vim'
call neobundle#end()
" Required:
filetype plugin indent on
NeoBundleCheck
" =============
" NeoBundle END
" =============

" vimfiler
" --------
" open automatically on startup
autocmd VimEnter * if &filetype !=# 'gitcommit' | VimFiler -explorer -no-focus -winwidth=25 | endif
nnoremap <silent><c-e> :VimFiler -explorer -no-focus -winwidth=25 -toggle<CR>
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
" close vimfiler automatically when only vimfiler opening
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
imap <c-k>     <Plug>(neosnippet_expand_or_jump)
smap <c-k>     <Plug>(neosnippet_expand_or_jump)
xmap <c-k>     <Plug>(neosnippet_expand_target)
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
  autocmd!  BufEnter *_test.rb NeoSnippetSource ~/.vim/snippet/rails.test.snip
  autocmd!  BufEnter routes.rb NeoSnippetSource ~/.vim/snippet/rails.route.snip
  autocmd!  BufEnter *rb       call s:LoadRailsSnippet()
augroup END

function! s:LoadRailsSnippet()
  " get current directory's path
  let s:current_file_path = expand("%:p:h")

  " Ignore if path is not in app directory
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

" Unite.vim
" ---------
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_rec_max_cache_files = 5000
let g:unite_source_file_mru_limit      = 200
augroup unite
  autocmd!
  autocmd FileType unite nmap <buffer><c-j> <Plug>(unite_exit)
augroup END
call unite#custom#profile('default', 'context', {
  \ 'winwidth':  '90'
  \ })
" The prefix key.
nnoremap [unite]  <Nop>
nmap     <space>  [unite]
" Directory
nnoremap <silent> [unite]u :<c-u>call DispatchUniteFileRecAsyncOrGit()<CR>
nnoremap <silent> [unite]b :<c-u>UniteWithBufferDir file file/new<CR>
" history
nnoremap <silent> [unite]h :<c-u>Unite file_mru<CR>
" Opening buffers
nnoremap <silent> [unite]C :<c-u>Unite buffer<CR>
" Grep
nnoremap <silent> [unite]G :<c-u>Unite grep: -buffer-name=search-buffer<CR>

" Use 'ag'(the_silver_searcher) for Unite grep
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --hidden'
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

" unite-rails
" -----------
nnoremap <silent> [unite]ra :<c-u>Unite rails/asset<CR>
nnoremap <silent> [unite]rb :<c-u>Unite rails/bundled_gem<CR>
nnoremap <silent> [unite]rc :<c-u>Unite rails/controller<CR>
nnoremap <silent> [unite]rC :<c-u>Unite rails/config<CR>
nnoremap <silent> [unite]rd :<c-u>Unite rails/db<CR>
nnoremap <silent> [unite]rg :<c-u>Unite rails/gemfile<CR>
nnoremap <silent> [unite]rh :<c-u>Unite rails/helper<CR>
nnoremap <silent> [unite]rj :<c-u>Unite rails/javascript<CR>
nnoremap <silent> [unite]rl :<c-u>Unite rails/log<CR>
nnoremap <silent> [unite]rL :<c-u>Unite rails/lib<CR>
nnoremap <silent> [unite]rm :<c-u>Unite rails/model<CR>
nnoremap <silent> [unite]rM :<c-u>Unite rails/mailer<CR>
nnoremap <silent> [unite]rr :<c-u>Unite rails/route<CR>
nnoremap <silent> [unite]rs :<c-u>Unite rails/stylesheet<CR>
nnoremap <silent> [unite]rt :<c-u>Unite rails/spec<CR>
nnoremap <silent> [unite]rv :<c-u>Unite rails/view<CR>

" yankround
" ---------
nnoremap <silent> [unite]p :<c-u>Unite yankround<CR>
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <expr><c-p> yankround#is_active() ? "\<Plug>(yankround-prev)" : "<SID>(GitGutterPrevHunk)"
nmap <expr><c-n> yankround#is_active() ? "\<Plug>(yankround-next)" : "<SID>(GitGutterNextHunk)"
let g:yankround_use_region_hl = 1

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
    IncSearchNoreMap <c-k>  <Over>(incsearch-scroll-f)
    IncSearchNoreMap <c-d>  <Over>(incsearch-scroll-b)
    IncSearchNoreMap <c-j>  <Esc>
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
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_scss_checkers	    = ['scss_lint']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers 	    = ['rubocop']
nnoremap <silent><Leader>e :SyntasticToggleMode<CR>
nnoremap <silent><Leader>E :Errors<CR>

" vim-auto-save
" -------------
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_in_insert_mode = 0

" bufkill.vim
" -----------
nnoremap <Leader>d :BD<CR>

" BufOnly.vim
" -----------
nnoremap <Leader>z :BufOnly<CR>

" vim-operator-surround
" ---------------------
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)
let g:operator#surround#blocks =
  \ {
  \   '-' : [
  \	    { 'block' : [" ", " "], 'motionwise' : ['char', 'line', 'block'], 'keys' : ['s'] }
  \   ],
  \   'ruby' : [
  \     { 'block' : ["{ ", " }"], 'motionwise' : ['char'], 'keys' : ['{', '}']}
  \   ],
  \   'markdown' : [
  \	    { 'block' : ["```\n", "\n```"],       'motionwise' : ['line'], 'keys' : ['`'] },
  \	    { 'block' : ["---\ntitle: ", "\n---"], 'motionwise' : ['line'], 'keys' : ['-'] }
  \   ],
  \ }

" vim-easy-align
" --------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
vmap <c-m> <Plug>(EasyAlign)

" vim-fugitive
" -------------
set previewheight=40 " set height of Gstatus
nnoremap <silent><Leader>ga :Gwrite<CR>
nnoremap <silent><Leader>gb :Gbrowse master<CR>
nnoremap <silent><Leader>gB :Gblame<CR>
nnoremap <silent><Leader>gc :Gcommit -v<CR>
nnoremap <silent><Leader>gC :Gcommit -v --amend<CR>
nnoremap <silent><Leader>gd :Gdiff<CR>
" Checkout current file
nnoremap <silent><Leader>go :Gread<CR>
nnoremap <silent><Leader>gp :Gpush<CR>
nnoremap <silent><Leader>gr :Git reset HEAD %<CR>
nnoremap <silent><Leader>gs :Gstatus<CR>

" gitv
" ---
nnoremap <silent><Leader>gl :Gitv<CR>
nnoremap <silent><Leader>gL :Gitv!<CR>

" vim-gitgutter
" -------------
nnoremap <silent><SID>(GitGutterPrevHunk) :<c-u>GitGutterPrevHunk<CR>zz
nnoremap <silent><SID>(GitGutterNextHunk) :<c-u>GitGutterNextHunk<CR>zz
let g:gitgutter_sign_column_always = 1
nmap <c-a> <Plug>GitGutterStageHunk
nmap <c-x> <Plug>GitGutterRevertHunk

" vim-smartinput
" --------------
call smartinput#map_to_trigger('i', '<Space>', '<Space>', '<Space>')
call smartinput#define_rule({
\   'at': '[^#]\%#',
\   'char': '{',
\   'input': '{<Space><Space>}<Left><Left>',
\   'filetype': ['ruby', 'slim'],
\ })

" Ruby and Rails
" ==============
" neocomplete-rsense.vim
" ----------------------
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'

" vim-rspec
" ---------
" run nearest line's spec
nnoremap <Leader>tn :call RunNearestSpec()<CR>
nnoremap <Leader>tc :call RunCurrentSpecFile()<CR>
nnoremap <Leader>tl :call RunLastSpec()<CR>
nnoremap <Leader>ta :call RunAllSpecs()<CR>
let g:rspec_command = 'Dispatch bundle exec rspec {spec}'
let g:dispatch_quickfix_height = 30
let g:dispatch_tmux_height = 3
" let s:bundle = neobundle#get('vim-rspec')
" function! s:bundle.hooks.on_source(bundle)
"    let g:rspec_command = 'Dispatch! bundle exec rspec {spec}'
" endfunction

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
if !exists('loaded_matchit')
  runtime macros/matchit.vim " enable matchit
endif
let b:match_ignorecase = 1
augroup matchit
  au!
  au FileType ruby let b:match_words = '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:
	\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
augroup END

" JavaScript
" ==========
" vim-better-javascript-completion
" --------------------------------
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
" emmet-vim
" ---------
let g:user_emmet_install_global = 0
autocmd FileType html,eruby,css,sass,scss,liquid EmmetInstall
let g:user_emmet_settings = {
  \ 'variables': {
  \ 'lang' : 'ja'
  \ }
\}
augroup emmet
  autocmd!
  autocmd FileType html,eruby,css,sass,scss call s:map_emmet()
augroup END
function! s:map_emmet()
  " expand neosnippet snippet if possible, falling back to emmet expansion
  imap <buffer> <expr> <c-k> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : "\<Plug>(emmet-expand-abbr)"
endfunction

" open-browser.vim
" ----------------
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <Leader>O <Plug>(openbrowser-open)
vmap <Leader>O <Plug>(openbrowser-open)
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

" Appearance
" ==========
" vim-better-whitespace
" ---------------------
let g:better_whitespace_filetypes_blacklist = ['unite', 'vimfiler']

" vim-indent-guides
" -----------------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

" vim-airline
" -------
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set guifont=Inconsolate\ Regular\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set t_Co=256
let g:airline_theme='jellybeans'
let g:airline_left_sep = '⮀'
let g:airline_right_sep = '⮂'
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮀'
let g:airline_symbols = {}
let g:airline_symbols.space = ' '
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_section_y=''
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#checks = []

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
nnoremap <silent><Leader>D :Dash<CR>

" STYLE
" =====
syntax on
colorscheme jellybeans
highlight Normal ctermbg=NONE
highlight Visual ctermbg=Black
" Make comment italic
highlight Comment cterm=italic gui=italic
