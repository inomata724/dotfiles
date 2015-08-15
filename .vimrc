if has('vim_starting')
	set nocompatible
	if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		echo "Installing neobundle..."
		call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
	endif
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
	\'build': {
	\	'mac': 'make -f make_mac.mak',
	\	'unix': 'make -f make_unix.mak',
	\},
\}

NeoBundle 'scrooloose/syntastic'
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'kana/vim-tabpagecd'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'cocopon/iceberg.vim'

NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'todesking/ruby_hl_lvar.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'fatih/vim-go'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'othree/html5.vim'
NeoBundle 'Rykka/riv.vim'

NeoBundleCheck
call neobundle#end()

set nocompatible
set nowrap
set number
set autoindent
set list
set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:%
set colorcolumn=80
set display=lastline
set showmatch
set matchtime=1
set showtabline=2
set noswapfile
set cursorline
set scrolloff=10
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
"set guicursor+=n-v-c:blinkon0
syntax enable
filetype plugin indent on

" delete trailing spaces
autocmd BufWritePre * if index(['markdown', 'diff', 'sql'], &filetype) < 0 | :%s/\s\+$//e

" disable netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" Encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

" Color
set t_Co=256
colorscheme iceberg

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
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	let g:neocomplete#lock_buffer_name_pattern          = '\*ku\*'
	let g:neocomplete#max_list                          = 20

	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'

	if !exists('g:neocomplete#force_omni_input_patterns')
		let g:neocomplete#force_omni_input_patterns = {}
	endif
elseif neobundle#is_installed('neocomplcache')
	let g:neocomplcache_enable_at_startup              = 1
	let g:neocomplcache_enable_ignore_case             = 1
	let g:neocomplcache_enable_smart_case              = 1
	let g:neocomplcache_max_list                       = 20
	let g:neocomplcache_manual_completion_start_length = 3
	if !exists('g:neocomplcache_delimiter_patterns')
		let g:neocomplcache_delimiter_patterns = {}
	endif
	function! s:my_crinsert()
		return pumvisible() ? neocomplcache#close_popup() : "\<Cr>"
	endfunction
	inoremap <silent> <CR> <C-R>=<SID>my_crinsert()<CR>
endif

" NERDTree
let NERDTreeChDirMode   = 0
let NERDTreeHijackNetrw = 0
let NERDTreeWinSize     = 35
let NERDTreeShowHidden  = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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

" vim-rooter
let g:rooter_disable_map  = 1
let g:rooter_silent_chdir = 1

" vim-easytags
let g:easytags_always_enabled = 1
let g:easytags_auto_update    = 1
let g:easytags_auto_highlight = 0
let g:easytags_dynamic_files  = 1
let g:easytags_async          = 1
let g:easytags_on_cursorhold  = 1

" lightline
let g:lightline = {
	\ 'colorscheme': 'powerline',
	\ 'active': {
	\ 	'left':  [ [ 'mode', 'paste' ], [ 'current_branch', 'readonly', 'filename', 'modified' ] ],
	\ 	'right': [ [ 'rows' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype', 'indentation' ] ]
	\ },
	\ 'component': {
	\ 	'rows'    : '%L',
	\ 	'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
	\ 	'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
	\ },
	\ 'component_vsible_condition': {
	\ 	'readonly': '(&filetype!="help"&& &readonly)',
	\ 	'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
	\ },
	\ 'component_function': {
	\ 	'current_branch': 'ShowCurrentBranch',
	\ },
	\ 'component_expand': {
	\ 	'indentation': 'MixedIndentationWarning',
	\ },
	\ 'component_type': {
	\ 	'indentation': 'warning',
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

function! ShowCurrentBranch()
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

function! UpdateExpandComponents()
	call MixedIndentationWarning()
	call lightline#update()
endfunction

augroup AutoUpdateExpandComponents
	autocmd BufWritePost * call UpdateExpandComponents()
augroup END

" JSON formatter
if executable('jq')
	function! FormatJson()
		execute "%!jq '.'"
	endfunction
endif

" Plain Text
au BufRead,BufNewFile,BufReadPre *.txt set filetype=text
au FileType text set sw=2 ts=2 sts=2 expandtab

" HTML5
let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete          = 1
let g:html5_microdata_attributes_complete     = 1
let g:html5_aria_attributes_complete          = 1

" Ruby
au BufRead,BufNewFile *.rb set filetype=ruby
au BufRead,BufNewFile *.erb set filetype=eruby
au FileType ruby set sw=2 ts=2 sts=2 expandtab
au FileType eruby set sw=2 ts=2 sts=2 expandtab
let ruby_space_errors = 1

" Python
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" CoffeeScript
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

" Apache config file
au BufRead,BufNewFile,BufReadPre *etc/httpd/conf/*,*etc/httpd/conf.d/*,/etc/apache2/apache2.conf set filetype=apache

" Yaml
au FileType yaml set expandtab ts=2 sw=2

" Markdown
au BufRead,BufNewFile,BufReadPre *.md,*.markdown,*.md.* set filetype=markdown

" reStructuredText
let g:riv_disable_folding = 1

" Go
au BufRead,BufNewFile,BufReadPre *.go set filetype=go
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_structs           = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command                 = 'goimports'
let g:go_fmt_autosave                = 1
