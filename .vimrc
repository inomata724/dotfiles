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
call neobundle#end()

NeoBundle 'Shougo/vimproc', {
			\ 'build' : {
			\       'mac' : 'make -f make_mac.mak',
			\       'unix' : 'make -f make_unix.mak',
			\   },
			\ }
NeoBundle 'rails.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/neocomplcache-rsense.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'fatih/vim-go'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Rykka/riv.vim'
NeoBundle 'fatih/molokai'
NeoBundle 'Shougo/unite-outline'

NeoBundleCheck

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
set hlsearch
syntax enable
filetype on
filetype plugin indent on
autocmd BufWritePre * if index(['markdown'], &filetype) < 0 | :%s/\s\+$//e

" Color
set t_Co=256
let g:molokai_original=1
let g:rehash256=1
colorscheme molokai

" Unite
let g:unite_split_rule="rightbelow"
let g:unite_winwidth=40

" Neocomplecache
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

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" Highlight em space"
syn sync fromstart
function! ActivateInvisibleIndicator()
	syntax match InvisibleJISX0208Space "　" display containedin=ALL
	highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
endfunction
augroup invisible
	autocmd! invisible
	autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
augroup END

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
let g:vim_markdown_folding_disabled=1

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
let g:unite_source_history_yank_enable=1
try
	let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
	call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry

" Encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

" GUI
set guifont=Ricty_Diminished:h18
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
nnoremap [unite]f :Unite -start-insert file_rec/async<CR>
nnoremap [unite]o :Unite -vertical -no-quit -toggle outline<CR>
nnoremap [unite]r <Plug>(unite_restart)
