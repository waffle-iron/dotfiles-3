" General
" --------------------
set visualbell t_vb=                " Never flash
set nofoldenable                    " Never fold
set noswapfile                      " Never backup
set nobackup
set nowritebackup

set mouse=a                         " Enable mouse
set clipboard+=unnamed,autoselect   " Copy to clipboard
set helplang=ja                     " Use Japanese doc
set helpheight=999
set encoding=utf-8
set fileencodings=utf-8

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
set softtabstop=2
set tabstop=2

augroup DisableAutoComment
  autocmd!
  " Disable auto comment out
  autocmd FileType * setlocal formatoptions-=ro
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
nnoremap <silent>cp :let @+=expand("%:p")<CR>

" Load vimrc
nnoremap <silent>,s :<C-u>source ~/.vimrc<CR>
" Clear hilight
nnoremap <silent>,l :nohl<CR>

" Expand brackets
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" FileType
" ===========
augroup FileTypeSettings
  autocmd!
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 noet
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType scss       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sass       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType stylus     setlocal sw=2 sts=2 ts=2 et
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
  autocmd FileType markdown   setlocal sw=2 sts=2 ts=2 noet
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 noet
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
" vimfiler
NeoBundle 'Shougo/vimfiler'
" neocomplete.vim
NeoBundle 'Shougo/neocomplete.vim'
" neosnippet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" incsearch.vim
NeoBundle 'haya14busa/incsearch.vim'
" syntastic
NeoBundle 'scrooloose/syntastic'
" yankround
NeoBundle 'LeafCage/yankround.vim'
" vim-auto-save
NeoBundle 'vim-scripts/vim-auto-save'
" vim-expand-region
NeoBundle 'terryma/vim-expand-region'
" vim-operator-surround
NeoBundle 'rhysd/vim-operator-surround'
NeoBundle 'kana/vim-operator-user'
" vim-quickrun
NeoBundle 'thinca/vim-quickrun'
" vim-gitgutter
NeoBundle 'airblade/vim-gitgutter'
" vim-fugitive
NeoBundle 'tpope/vim-fugitive'

" ae : entire content / ie : excluding empty lines
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'danro/rename.vim'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'tomtom/tcomment_vim'

" Document
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" Ruby and Rails 
" ==============
NeoBundle 'hwartig/vim-seeing-is-believing'
NeoBundle 'szw/vim-tags'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
" g S : split / g J : join 
NeoBundle 'AndrewRadev/splitjoin.vim'
" necomplete-rsense.vim
NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', {
      \ 'insert' : 1,
      \ 'autoload': {'filetypes': ['ruby']}
      \ }
" vim-seeing-is-believing
NeoBundleLazy 'vim-ruby/vim-ruby', {
      \ 'autoload': {'filetypes': ['ruby']}
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
NeoBundleLazy 'mattn/emmet-vim', {
      \ "autoload": {"filetypes":['html','css','eruby','sass','scss']}
      \ }
NeoBundleLazy 'hail2u/vim-css3-syntax', {
      \ "autoload": {"filetypes":['css','sass','scss']}
      \ }
NeoBundleLazy 'cakebaker/scss-syntax.vim', {
      \ "autoload": {"filetypes":['sass','scss']}
      \ }
NeoBundleLazy 'wavded/vim-stylus', {
      \ "autoload": {"filetypes":['stylus']}
      \ }
NeoBundleLazy 'othree/html5.vim', {
      \ "autoload": {"filetypes":['html','eruby']}
      \ }
NeoBundleLazy 'tpope/vim-haml', {
      \ "autoload": {"filetypes":['haml']}
      \ }
NeoBundleLazy 'slim-template/vim-slim', {
      \ "autoload": {"filetypes":['haml']}
      \ }
NeoBundleLazy 'tyru/open-browser.vim', {
      \ "autoload": {"filetypes":["html"]}
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
" vim-better-whitespace
NeoBundle 'ntpeters/vim-better-whitespace'
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
augroup unite
  autocmd!
  autocmd FileType unite nmap <buffer> <C-J> <Plug>(unite_exit)
augroup END
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

" vimfiler
" --------
nnoremap <silent><C-e> :VimFilerBufferDir -explorer -winwidth=25 -toggle<CR>
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
let g:syntastic_loc_list_height=7
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes' : [],
      \ 'passive_filetypes' : [] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_scss_checkers = ['scss_lint']
nnoremap <silent><Leader>e :Errors<CR>
nnoremap <silent><Leader>q :lclose<CR>

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
nnoremap <Leader>a :AutoSaveToggle<CR>

" vim-expand-region
" -----------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" vim-operator-surround
" ---------------------
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sc <Plug>(operator-surround-replace)


" vim-quickrun
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config._={ 'runner':'vimproc',
      \       "runner/vimproc/updatetime" : 10,
      \       "outputter/buffer/close_on_empty" : 1,
      \       'outputter/buffer/split': ':botright'
      \ }
let g:quickrun_config={'_': {'split': 'vertical'}}
set splitright


" vim-gitgutter
" -------------
nnoremap <silent><SID>(GitGutterPrevHunk) :<C-u>GitGutterPrevHunk<CR>
nnoremap <silent><SID>(GitGutterNextHunk) :<C-u>GitGutterNextHunk<CR>

" Ruby and Rails 
" ==============
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
augroup END

" Markup
" ======
" open-browser.vim
" ----------------
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" emmet-vim
" ---------
let g:user_emmet_install_global = 0
augroup emmet
  autocmd!
  autocmd FileType html,css,eruby,scss EmmetInstall
  autocmd Filetype html,css,eruby,scss imap <buffer><expr><tab>
        \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
        \ "\<tab>"
augroup END

" Markdown
" ========
" vim-instant-markdown
" --------------------
let g:instant_markdown_autostart = 0
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
set t_Co=256
colorscheme gotham
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
