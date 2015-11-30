if has('vim_starting')
	set nocompatible
	if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		echo "Installing neobundle..."
		call system("git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim")
	endif
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
	\ 'build': {
	\ 	'mac': 'make -f make_mac.mak',
	\ 	'unix': 'make -f make_unix.mak',
	\ },
\}

NeoBundle 'scrooloose/syntastic'
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'xolox/vim-misc'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

if has('gui_running')
	NeoBundle 'itchyny/lightline.vim'
endif
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'tomasr/molokai'

NeoBundleLazy 'vim-ruby/vim-ruby', {
	\ "autoload" : {"filetypes" :["ruby"]}
\ }

NeoBundleLazy 'tpope/vim-rails', {
	\ "autoload" : {"filetypes" :["ruby"]}
\ }

NeoBundleLazy 'tpope/vim-endwise', {
	\ "autoload" : {"filetypes" :["ruby"]}
\ }

if has('ruby')
	NeoBundleLazy 'todesking/ruby_hl_lvar.vim', {
		\ "autoload" : {"filetypes" :["ruby"]}
	\ }
endif

NeoBundleLazy 'fatih/vim-go', {
	\ 'autoload' : {
	\ 	'filetypes' : 'go',
	\ 	'commands' : ['GoInstallBinaries', 'GoUpdateBinaries'],
	\ }
\ }

NeoBundleLazy 'pangloss/vim-javascript', {
	\ "autoload" : {"filetypes" :["javascript"]}
\ }

NeoBundleLazy 'jelera/vim-javascript-syntax', {
	\ 'autoload': {'filetypes':['javascript']}
\ }

NeoBundleLazy 'kchmck/vim-coffee-script', {
	\ "autoload" : {"filetypes" :["coffeescript"]}
	\ }

NeoBundleLazy 'Rykka/riv.vim', {
	\ "autoload" : {"filetypes" :["rst"]}
\ }

NeoBundle 'othree/html5.vim', {
	\ "autoload" : {"filetypes" :["html"]}
\ }

NeoBundle 'gregsexton/MatchTag', {
	\ "autoload" : {"filetypes" :["html"]}
\ }


NeoBundleCheck
call neobundle#end()

set nocompatible
set nowrap
set number
set autoindent
set list
set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:%
set display=lastline
set showmatch
set matchtime=1
set showtabline=2
set noswapfile
set scrolloff=10
set sidescrolloff=10
set noshowmode
set laststatus=2
set hlsearch
set incsearch
set ignorecase
set smartcase
set clipboard+=unnamed
set backspace=indent,eol,start
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set timeout timeoutlen=1000 ttimeoutlen=75
set shortmess+=I
set tags=./tags,tags,~/.vimtags
set autoread
set nofoldenable
set re=0
set lazyredraw
set ttyfast
set tabstop=4
set cursorline
set ambiwidth=double

"set guicursor+=n-v-c:blinkon0
syntax enable
filetype plugin indent on

" delete trailing spaces
au BufWritePre * if index(['markdown', 'diff', 'sql'], &filetype) < 0 | :%s/\s\+$//e

" auto read
augroup vimrc-checktime
	autocmd!
	autocmd BufEnter * checktime
augroup END

" netrw
let g:netrw_liststyle = 3

let g:last_bufnr = ''
function ExploreToggle()
	if &filetype == 'netrw'
		if g:last_bufnr != ''
			exe ':b' . g:last_bufnr
		endif
	else
		let g:last_bufnr = bufnr('%')
		Explore .
	endif
endfunction

" NERDTree
let NERDTreeChDirMode   = 0
let NERDTreeHijackNetrw = 0
let NERDTreeWinSize     = 35
let NERDTreeShowHidden  = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif"))"

" Encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

" Color
set t_Co=256
let g:rehash256=1
if neobundle#is_installed('iceberg.vim')
	colorscheme iceberg
endif

" GUI
set guifont=Ricty\ Regular\ For\ Powerline:h18
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=e

" Custom Keymap
let mapleader = ";"
nnoremap tc         :<C-u>tabnew<CR>
nnoremap tn         gt
nnoremap tp         gT
nnoremap <Leader>e  :call ExploreToggle()<CR>
nnoremap <Leader>n  :NERDTreeToggle<CR>
nnoremap <Leader>f  :<C-u>CtrlP<CR>
nnoremap <Leader>jf :call FormatJson()<CR>
nnoremap <Leader>b  :Gblame<CR>
nnoremap <Leader>s  :Gstatus<CR>
nnoremap <Leader>c  :Gcommit<CR>
nnoremap <Leader>d  :Gdiff<CR>
nnoremap <Leader>t  :UpdateTags -R .<CR>
nnoremap <C-]> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
vmap     <Enter>    <Plug>(EasyAlign)

" neocomplete / neocomplcache
if neobundle#is_installed('neocomplete')
	let g:neocomplete#enable_at_startup                 = 1
	let g:neocomplete#enable_ignore_case                = 1
	let g:neocomplete#enable_smart_case                 = 1
	let g:neocomplete#manual_completion_start_length    = 0
	let g:neocomplete#lock_buffer_name_pattern          = '\*ku\*'
	let g:neocomplete#max_list                          = 20
	let g:neocomplete#enable_prefetch                   = 1

	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'

	if !exists('g:neocomplete#sources#omni#input_patterns')
		let g:neocomplete#sources#omni#input_patterns = {}
	endif
	let g:neocomplete#sources#omni#input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
	let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'
elseif neobundle#is_installed('neocomplcache')
	let g:neocomplcache_enable_at_startup              = 1
	let g:neocomplcache_enable_ignore_case             = 1
	let g:neocomplcache_enable_smart_case              = 1
	let g:neocomplcache_manual_completion_start_length = 0
	let g:neocomplcache_lock_buffer_name_pattern       = '\*ku\*'
	let g:neocomplcache_max_list                       = 20
	let g:neocomplcache_enable_prefetch                = 1

	if !exists('g:neocomplcache_keyword_patterns')
		let g:neocomplcache_keyword_patterns = {}
	endif
	let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

	if !exists('g:neocomplcache_force_omni_patterns')
		let g:neocomplcache_force_omni_patterns = {}
	endif
	let g:neocomplcache_force_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
	let g:neocomplcache_force_omni_patterns.go = '\h\w\.\w*'
endif

" CtrlP
let g:ctrlp_map             = '<Nop>'
let g:ctrlp_use_caching     = 0
let g:ctrlp_show_hidden     = 1
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ".git" --ignore ".svn" --ignore ".hg" --hidden -g ""'
	let g:ctrlp_max_depth    = 40
else
	let g:ctrlp_max_depth = 10
endif
let g:ctrlp_prompt_mappings = {
	\ 'PrtBS()':              ['<bs>'],
	\ 'PrtDeleteWord()':      ['<del>'],
	\ 'PrtCurEnd()':          ['<c-e>'],
	\ 'PrtCurLeft()':         ['<c-b>'],
	\ 'PrtCurRight()':        ['<c-f>'],
	\ 'PrtSelectMove("j")':   ['<c-n>'],
	\ 'PrtSelectMove("k")':   ['<c-p>'],
	\ 'PrtHistory(-1)':       ['nop'],
	\ 'PrtHistory(1)':        ['nop'],
	\ 'AcceptSelection("e")': ['<cr>'],
	\ 'ToggleRegex()':        ['<c-r>'],
	\ 'ToggleByFname()':      ['<c-d>'],
	\ 'PrtExit()':            ['<c-l>', '<esc>', '<c-c>'],
	\ 'ToggleFocus()':        ['<nop>'],
	\ 'PrtExpandDir()':       ['<nop>'],
	\ 'AcceptSelection("h")': ['<nop>'],
	\ 'AcceptSelection("t")': ['<nop>'],
	\ 'AcceptSelection("v")': ['<nop>'],
	\ 'ToggleType(1)':        ['<nop>'],
	\ 'ToggleType(-1)':       ['<nop>'],
	\ 'PrtInsert()':          ['<nop>'],
	\ 'PrtCurStart()':        ['<nop>'],
	\ 'PrtClearCache()':      ['<nop>'],
	\ 'PrtDeleteEnt()':       ['<nop>'],
	\ 'CreateNewFile()':      ['<nop>'],
	\ 'MarkToOpen()':         ['<nop>'],
	\ 'OpenMulti()':          ['<nop>'],
	\ 'PrtDelete()':          ['<nop>'],
	\ 'PrtSelectMove("t")':   ['<nop>'],
	\ 'PrtSelectMove("b")':   ['<nop>'],
	\ 'PrtSelectMove("u")':   ['<nop>'],
	\ 'PrtSelectMove("d")':   ['<nop>'],
\ }

" Syntastic
let g:syntastic_enable_signs  = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_mode_map      = { 'mode': 'active',
	\ 'active_filetypes': [],
	\ 'passive_filetypes': ['html']
\ }
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-']

" vim-rooter
let g:rooter_disable_map  = 1
let g:rooter_silent_chdir = 1

" lightline
if neobundle#is_installed('lightline.vim')
	let g:lightline = {
		\ 'colorscheme': 'powerline',
		\ 'active': {
		\ 	'left':  [ [ 'mode', 'paste' ], [ 'current_branch' ], [ 'filename', 'modified', 'readonly' ] ],
		\ 	'right': [ [ 'rows' ], [ 'filetype' ], [ 'fileformat', 'fileencoding', 'indentation' ] ]
		\ },
		\ 'component': {
		\ 	'rows'    : '%L',
		\ 	'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
		\ },
		\ 'component_visible_condition': {
		\ 	'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
		\ },
		\ 'component_function': {
		\ 	'current_branch': 'CurrentBranch',
		\ 	'filename': 'Filename',
		\ },
		\ 'component_expand': {
		\ 	'indentation': 'MixedIndentationWarning',
		\ 	'readonly': 'ReadOnly',
		\ },
		\ 'component_type': {
		\ 	'indentation': 'error',
		\ 	'readonly': 'error',
		\ },
		\ 'separator': {
		\ 	'left': "\u2b80", 'right': "\u2b82"
		\ },
		\ 'subseparator': {
		\ 	'left': "\u2b81", 'right': "\u2b83"
		\ },
		\ 'tabline': {
		\ 	'left': [ [ 'tabs' ] ],
		\ 	'right': [ [] ]
		\ }
		\ }

	function! ReadOnly()
		return &ft !~? 'help' && &ro ? '⭤' : ''
	endfunction

	function! CurrentBranch()
		try
			if exists('*fugitive#head')
				let _ = fugitive#head()
				return strlen(_) ? '⭠ '._ : ''
			endif
		catch
		endtry
		return ''
	endfunction

	function! MixedIndentationWarning()
		if (search('^\t', 'nw') != 0) && (search('^ ', 'nw') != 0)
			return 'MixedIndentation'
		else
			return ''
		endif
	endfunction

	function! Filename()
			return expand('%')
	endfunction

	function! UpdateExpandComponents()
		call MixedIndentationWarning()
		call lightline#update()
	endfunction

	augroup AutoUpdateExpandComponents
		au BufWritePost * call UpdateExpandComponents()
	augroup END
endif

" JSON formatter
if executable('jq')
	function! FormatJson()
		execute "%!jq '.'"
	endfunction
endif

" FileTypes Definition
au BufRead,BufNewFile *.txt                  set filetype=text
au BufRead,BufNewFile *.rb                   set filetype=ruby
au BufRead,BufNewFile *.erb                  set filetype=eruby
au BufRead,BufNewFile *.coffee               set filetype=coffeescript
au BufRead,BufNewFile *.md,*.markdown,*.md.* set filetype=markdown
au BufRead,BufNewFile *.go                   set filetype=go
au BufRead,BufNewFile *etc/httpd/conf/*,*etc/httpd/conf.d/*,/etc/apache2/apache2.conf set filetype=apache

" Plain Text
au FileType text set sw=2 sts=2 ts=2 et

" HTML
au FileType html set sw=2 sts=2 ts=2 et

let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete          = 1
let g:html5_microdata_attributes_complete     = 1
let g:html5_aria_attributes_complete          = 1

" Ruby
au FileType ruby set sw=2 ts=2 sts=2 et
au FileType eruby set sw=2 ts=2 sts=2 et
let ruby_space_errors = 1

" Python
au FileType python setl smartindent sw=4 sts=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class

" JavaScript
au FileType javascript setlocal sw=2 sts=2 ts=2 et

" CoffeeScript
au FileType coffeescript setlocal sw=2 sts=2 ts=2 et

" Yaml
au FileType yaml set sw=2 sts=2 ts=2 et

" Markdown
au FileType markdown set sw=2 sts=2 ts=2 et

" reStructuredText
let g:riv_disable_folding = 1

" Go
au FileType go set sw=8 sts=8 ts=8 noet
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_structs           = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command                 = 'goimports'
let g:go_fmt_autosave                = 1
