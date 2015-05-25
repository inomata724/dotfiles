if has('vim_starting')
	set nocompatible
	if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
		echo "Installing neobundle..."
		:call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
	endif
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
			\ 'build' : {
			\       'mac' : 'make -f make_mac.mak',
			\       'unix' : 'make -f make_unix.mak',
			\   },
			\ }

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'scrooloose/syntastic'
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'junegunn/vim-easy-align'

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tomasr/molokai'

NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'todesking/ruby_hl_lvar.vim'
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
set showtabline=1
set noswapfile
set cursorline
set scrolloff=10
set hlsearch
set noshowmode
set laststatus=2
set ignorecase
set smartcase
set clipboard+=unnamed
set backspace=indent,eol,start
syntax enable
filetype plugin indent on

" delete trailing spaces
autocmd BufWritePre * if index(['markdown', 'diff', 'sql'], &filetype) < 0 | :%s/\s\+$//e

" Color
set t_Co=256
let g:rehash256=1
colorscheme molokai

" Unite
let g:unite_split_rule="rightbelow"
let g:unite_winwidth=40

if neobundle#is_installed('neocomplete')
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_ignore_case = 1
	let g:neocomplete#enable_smart_case = 1
	let g:neocomplete#sources#syntax#min_keyword_length = 3
	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
	let g:neocomplete#max_list = 20

	if !exists('g:neocomplete#keyword_patterns')
		    let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default'] = '\h\w*'

	if !exists('g:neocomplete#force_omni_input_patterns')
		  let g:neocomplete#force_omni_input_patterns = {}
	endif
	let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
elseif neobundle#is_installed('neocomplcache')
	let g:neocomplcache_enable_at_startup=1
	let g:neocomplcache_enable_ignore_case=1
	let g:neocomplcache_enable_smart_case=1
	let g:neocomplcache_max_list=20
	let g:neocomplcache_manual_completion_start_length=3
	if !exists('g:neocomplcache_delimiter_patterns')
		let g:neocomplcache_delimiter_patterns={}
	endif
	function! s:my_crinsert()
		return pumvisible() ? neocomplcache#close_popup() : "\<Cr>"
	endfunction
	inoremap <silent> <CR> <C-R>=<SID>my_crinsert()<CR>
endif

" NERDTree
let NERDTreeWinSize=35

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" Plain Text
au BufRead,BufNewFile,BufReadPre *.txt set filetype=text
au FileType text set sw=2 ts=2 sts=2 expandtab

" HTML5
let g:html5_event_handler_attributes_complete=1
let g:html5_rdfa_attributes_complete=1
let g:html5_microdata_attributes_complete=1
let g:html5_aria_attributes_complete=1

" Ruby
au BufRead,BufNewFile *.rb set filetype=ruby
au BufRead,BufNewFile *.erb set filetype=eruby
au FileType ruby set sw=2 ts=2 sts=2 expandtab
au FileType eruby set sw=2 ts=2 sts=2 expandtab
let ruby_space_errors=1

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
let g:riv_disable_folding=1

" Go
au BufRead,BufNewFile,BufReadPre *.go set filetype=go
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_structs=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1
let g:go_fmt_command='goimports'
let g:go_fmt_autosave=1

" Search File
if executable('ag')
	let g:unite_source_history_yank_enable=1
	try
		let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
		call unite#filters#matcher_default#use(['matcher_fuzzy'])
	catch
	endtry
endif

" Encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

" GUI
set guifont=Ricty_For_Powerline:h18
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=e

" Custom Keymap
nnoremap tc :<C-u>tabnew<CR>
nnoremap tn gt
nnoremap tp gT
nmap ;n :NERDTreeToggle<CR>
nmap ; [unite]
nnoremap [unite]f :Unite -start-insert -toggle file_rec/async<CR>
nnoremap [unite]o :Unite -vertical -toggle outline<CR>
nnoremap [unite]r <Plug>(unite_restart)
nnoremap gb :Gblame<CR>
nnoremap gs :Gstatus<CR>
nnoremap gc :Gcommit<CR>
nnoremap gd :Gdiff<CR>
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap ft :echo &filetype<CR>

