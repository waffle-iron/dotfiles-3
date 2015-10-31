" Initialize autocmd
augroup vimrc
  autocmd!
augroup END

" --------------------
" NEOBUNDLE
" --------------------
 if has('vim_starting')
   if &compatible
     set nocompatible " Be iMproved
   endif

   " Required:
   set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
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

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

" Completion
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

" Snippets
NeoBundleLazy 'Shougo/neosnippet', {
  \ "autoload": {"insert": 1}}
NeoBundle 'Shougo/neosnippet-snippets'

" Filer
NeoBundle 'Shougo/vimfiler'

" Rename file
NeoBundle 'danro/rename.vim'

" Copy and Paste
NeoBundle 'LeafCage/yankround.vim'

" Auto save
NeoBundle 'vim-scripts/vim-auto-save'

" Searching
NeoBundle 'haya14busa/incsearch.vim'

" Input matched pairs
NeoBundle 'kana/vim-smartinput'

" Expand text-object
NeoBundle 'rhysd/vim-operator-surround'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'tomtom/tcomment_vim'

" Git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

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

" Linter
NeoBundle 'scrooloose/syntastic'

" Run Script
NeoBundle 'thinca/vim-quickrun'

" Document
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
NeoBundle 'AndrewRadev/splitjoin.vim'

" Style
NeoBundle 'bling/vim-airline'
NeoBundle 'whatyouhide/vim-gotham'
NeoBundle 'ntpeters/vim-better-whitespace'
let g:better_whitespace_filetypes_blacklist = ['unite', 'vimfiler']

" Ruby and Rails
NeoBundle 'hwartig/vim-seeing-is-believing'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'szw/vim-tags'
NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', { 'autoload' : {
      \ 'insert' : 1,
      \ 'filetypes': 'ruby',
      \ }}
let g:neocomplete#sources#rsense#home_directory = '/usr/local/bin/rsense'

" JavaScript
NeoBundle 'lfilho/cosco.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle '1995eaton/vim-better-javascript-completion'
let g:vimjs#casesensitive = 0
let g:vimjs#smartcomplete = 1
NeoBundle 'moll/vim-node'

" Markup
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'wavded/vim-stylus'
NeoBundle 'othree/html5.vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'KabbAmine/vCoolor.vim'
NeoBundleLazy 'mattn/emmet-vim', {
  \ "autoload": {"filetypes":['html','css','eruby','sass','scss']}}
let g:user_emmet_install_global = 0
autocmd vimrc FileType html,css,eruby,scss EmmetInstall
autocmd vimrc Filetype html,css,eruby,scss imap <buffer><expr><tab>
      \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
      \ "\<tab>"

" Markdown
autocmd vimrc BufRead,BufNewFile *.md  set filetype=markdown
autocmd vimrc BufRead,BufNewFile *.mkd  set filetype=markdown
let g:previm_show_header = 0
NeoBundle 'suan/vim-instant-markdown'
let g:instant_markdown_autostart = 0
NeoBundle 'kannokanno/previm'

call neobundle#end()
" Required:
filetype plugin indent on
NeoBundleCheck


" --------------------
" BASIC SETTINGS
" --------------------
" No bell
set novisualbell
" No backup
set noswapfile
set nobackup
set nowritebackup
" No foldings
set nofoldenable
set ruler
set number
set wrap
set hlsearch
set incsearch
set ignorecase
set smartcase
set shiftround
set infercase
set laststatus=2
set clipboard=unnamedplus,unnamed
set wrapscan
set ambiwidth=double
" Height for completion
set pumheight=10
set wildmenu
set wildmode=longest:full,full
set showmatch
set formatoptions+=j
set matchtime=1
set display=lastline
set nf=hex
set mouse=a
set helpheight=999
set hidden
set switchbuf=useopen
set t_vb=
" Use Japanese doc
set helplang=ja
let g:vim_markdown_folding_disabel = 1
" Disable auto comment out
autocmd vimrc FileType * setlocal formatoptions-=ro
" Add to pair matches
set matchpairs& matchpairs+=<:>
" Remember the last cursor position
if has("autocmd")
  autocmd vimrc BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif
augroup mine
    au BufWinEnter * sign define mysign
    au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
augroup END
if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus,unnamed 
else
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
" Hilight erb files properly
autocmd vimrc BufRead,BufNewFile *.erb set filetype=eruby.html
" Filetype for markdown
autocmd vimrc BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" Never hilight itailc in markdown
autocmd vimrc FileType markdown hi! def link markdownItalic LineNr

" --------------------
" KEYMAPPINGS
" --------------------
" Disable Unused keys
map ZQ <Nop>
map Q <Nop>
map s <Nop>
" Set <Space> as <Leader>
nnoremap <Space> <Leader>
let g:mapleader = "\<Space>"
" Escape
noremap <C-j> <esc>
noremap! <C-j> <esc>
cnoremap <C-j> <Esc>
" Go and Back
inoremap <C-f> <Right>
inoremap <C-b> <Left>
" Never skip folded lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
vnoremap j gj
vnoremap gj j
vnoremap k gk
vnoremap gk k
" Select to end of line
vnoremap v $h
" Yank until end of line
nnoremap Y y$
" Move between buffers
noremap <silent><C-h> :bprevious<CR>
noremap <silent><C-l> :bnext<CR>
" Close buffer
nnoremap <silent><c-z> :bd<CR>
" Jump to matched pairs
nnoremap <Tab> %
vnoremap <Tab> %
" Increment / Decreament
nnoremap + <C-a>
nnoremap - <C-x>
" Divide screen
nnoremap <silent><Leader>v :split<CR>
nnoremap <silent><Leader>s :vsplit<CR>
" Open shell
nnoremap <silent><Leader>c :shell<CR>
" Preview in browsers
nnoremap <silent><Leader>o :!open %<CR>
" Copy the opening file's path
noremap <silent>cp :let @+=expand("%:p")<CR>

" --------------------
" INDENTATION
" --------------------
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

if has("autocmd")
  filetype plugin on
  filetype indent on
  autocmd vimrc FileType html       setlocal sw=2 sts=2 ts=2 noet
  autocmd vimrc FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd vimrc FileType css        setlocal sw=4 sts=4 ts=4 noet
  autocmd vimrc FileType scss       setlocal sw=2 sts=2 ts=2 et
  autocmd vimrc FileType sass       setlocal sw=2 sts=2 ts=2 et
  autocmd vimrc FileType stylus     setlocal sw=2 sts=2 ts=2 et
  autocmd vimrc FileType javascript setlocal sw=4 sts=4 ts=4 noet
  autocmd vimrc FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd vimrc FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd vimrc FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd vimrc FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd vimrc FileType eruby      setlocal sw=2 sts=2 ts=2 et
  autocmd vimrc FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd vimrc FileType slim       setlocal sw=2 sts=2 ts=2 et
  autocmd vimrc FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd vimrc FileType xml        setlocal sw=4 sts=4 ts=4 noet
  autocmd vimrc FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd vimrc FileType sh         setlocal sw=2 sts=2 ts=2 et
  autocmd vimrc FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd vimrc FileType zsh        setlocal sw=2 sts=2 ts=2 et
  autocmd vimrc FileType markdown   setlocal sw=2 sts=2 ts=2 noet
  autocmd vimrc FileType diff       setlocal sw=4 sts=4 ts=4 noet
endif

inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" --------------------
" STYLE
" --------------------
colorscheme gotham
syntax enable
set t_Co=256
set cursorline
hi CursorLine ctermbg=232
" make cusor vertical in insert mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" Make comment italic
highlight Comment cterm=italic gui=italic

" --------------------
" PLUGINS
" --------------------
" unite.vim
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
autocmd vimrc FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
autocmd vimrc FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
autocmd vimrc FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
autocmd vimrc FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" History
nnoremap <silent><Leader>h :<C-u>Unite file_mru<CR>
" Opening buffers
nnoremap <silent><Leader>b :<C-u>Unite buffer<CR>
" Copy history
nnoremap <silent><Leader>p :<C-u>Unite yankround<CR>
" Grep
nnoremap <silent><Leader>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --hidden --ignore'
  let g:unite_source_grep_recursive_opt = ''
endif
" Current directory
let s:unite_ignore_patterns = '\.\(gif\|jpe\?g\|png\|webp\)$'
call unite#custom#source('file_rec/git', 'ignore_pattern', s:unite_ignore_patterns)
function! DispatchUniteFileRecAsyncOrGit()
  " If current directory is git repo
  if isdirectory(getcwd()."/.git")
    Unite file_rec/git:--cached:--others:--exclude-standard
  else
    Unite file_rec/async
  endif
endfunction
nnoremap <silent><Leader>r :<C-u>call DispatchUniteFileRecAsyncOrGit()<CR>

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
autocmd vimrc BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') | q | endif
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
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" vim-gitgutter
nnoremap <silent><SID>(GitGutterPrevHunk) :<C-u>GitGutterPrevHunk<CR>
nnoremap <silent><SID>(GitGutterNextHunk) :<C-u>GitGutterNextHunk<CR>

" vim-auto-save
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
let g:auto_save = 1
nnoremap <Leader>a :AutoSaveToggle<CR>

" vim-operator-surround
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sc <Plug>(operator-surround-replace)

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
nmap <expr><C-p> yankround#is_active() ? "\<Plug>(yankround-prev)" : "<SID>(GitGutterPrevHunk)"
nmap <expr><C-n> yankround#is_active() ? "\<Plug>(yankround-next)" : "<SID>(GitGutterNextHunk)"
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
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['rubocop']
nnoremap <silent><Leader>e :Errors<CR>
nnoremap <silent><Leader>q :lclose<CR>

" cosco.vim
autocmd vimrc FileType css,scss,javascript,coffee,db,sql nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>

" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim-seeing-is-believing
autocmd vimrc FileType ruby nmap <silent>mm <Plug>(seeing-is-believing-mark)
autocmd vimrc FileType ruby vmap <silent>mm <Plug>(seeing-is-believing-mark)
autocmd vimrc FileType ruby nmap <silent>mr <Plug>(seeing-is-believing-run)
autocmd vimrc FileType ruby vmap <silent>mr <Plug>(seeing-is-believing-run)


" --------------------
" USER
" --------------------

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

