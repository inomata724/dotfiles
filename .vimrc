if has('vim_starting')
		set nocompatible
		if !filereadable(expand("~/.vim/autoload/plug.vim"))
				echo "Installing vim-plug..."
				call system("curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")
		endif
endif

call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/nerdtree'
Plug 'EvanDotPro/nerdtree-chmod'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'dbakker/vim-projectroot'
Plug 'majutsushi/tagbar'
Plug 'dhruvasagar/vim-table-mode'
Plug 'elzr/vim-json'
"Plug 'cocopon/iceberg.vim'
"Plug 'whatyouhide/vim-gotham'
Plug 'ayu-theme/ayu-vim'
Plug 'yarisgutierrez/ayu-lightline'
Plug 'jiangmiao/auto-pairs'
Plug 'bronson/vim-trailing-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'

if v:version >= 800
		Plug 'Valloric/YouCompleteMe', { 'do': 'YCM_CORES=1 ./install.py --clang-completer --gocode-completer --tern-completer' }
end

Plug 'vim-ruby/vim-ruby',                      { 'for': 'ruby' }
Plug 'tpope/vim-rails',                        { 'for': 'ruby' }
Plug 'tpope/vim-endwise',                      { 'for': 'ruby' }
Plug 'fatih/vim-go',                           { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'othree/yajs.vim',                        { 'for': 'javascript' }
Plug 'jason0x43/vim-js-indent',                { 'for': ['javascript', 'typescript', 'html'] }
Plug 'HerringtonDarkholme/yats.vim',           { 'for': 'typescript' }
Plug 'kchmck/vim-coffee-script',               { 'for': 'coffee' }
Plug 'Rykka/riv.vim',                          { 'for': 'rst' }
Plug 'othree/html5.vim',                       { 'for': 'html' }
Plug 'alvan/vim-closetag',                     { 'for': 'html' }
Plug 'hashivim/vim-terraform',                 { 'for': 'terraform' }
Plug 'vim-scripts/tracwiki',                   { 'for': 'tracwiki' }
Plug 'saltstack/salt-vim',                     { 'for': 'sls' }
Plug 'glidenote/keepalived-syntax.vim',        { 'for': 'keepalived' }

call plug#end()

function s:is_plugged(name)
		if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
				return 1
		else
				return 0
		endif
endfunction

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
set sidescrolloff=16
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
set cpoptions+=d
set autoread
set nofoldenable
set re=0
set lazyredraw
set ttyfast
set tabstop=4
"set ambiwidth=double
set nobackup
set visualbell t_vb=
set completeopt=menuone
set updatetime=4000

" disable plugins
let g:loaded_gzip            = 1
let g:loaded_tar             = 1
let g:loaded_tarPlugin       = 1
let g:loaded_zip             = 1
let g:loaded_zipPlugin       = 1
let g:loaded_rrhelper        = 1
let g:loaded_2html_plugin    = 1
let g:loaded_vimball         = 1
let g:loaded_vimballPlugin   = 1
let g:loaded_getscript       = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_netrw           = 1
let g:loaded_netrwPlugin     = 1

" vim-json
let g:vim_json_syntax_conceal = 0

"set guicursor+=n-v-c:blinkon0
syntax enable
filetype plugin indent on

" auto read
augroup vimrc-checktime
		autocmd!
		autocmd WinEnter * checktime
augroup END

" AutoPairs
let g:AutoPairsMultilineClose=0

" NERDTree
autocmd BufEnter * silent! lcd %:p:h
let NERDTreeChDirMode                   = 0
let NERDTreeHijackNetrw                 = 0
let NERDTreeWinSize                     = 40
let NERDTreeShowHidden                  = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif"))"

" gitgutter
let g:gitgutter_max_signs = 2000

" Tagbar
let g:tagbar_sort = 0
let g:tagbar_type_ruby = {
						\ 'kinds' : [
						\ 'm:modules',
						\ 'c:classes',
						\ 'd:describes',
						\ 'C:contexts',
						\ 'f:methods',
						\ 'F:singleton methods'
						\ ]
						\ }
let g:tagbar_type_go = {
						\ 'ctagstype': 'go',
						\ 'kinds' : [
						\'p:package',
						\'f:function',
						\'v:variables',
						\'t:type',
						\'c:const'
						\]
						\}
let g:tagbar_type_markdown = {
						\ 'ctagstype' : 'markdown',
						\ 'kinds' : [
						\ 'h:Heading_L1',
						\ 'i:Heading_L2',
						\ 'k:Heading_L3'
						\ ]
						\ }

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level           = 2
let g:indent_guides_space_guides          = 1
let g:indent_guides_guide_size            = 1

" Encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

" Color
"set background=dark

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

if (s:is_plugged('iceberg.vim'))
		colorscheme iceberg
		hi NonText ctermbg=bg ctermfg=bg guibg=bg guifg=bg
		hi EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
endif

if (s:is_plugged('vim-gotham'))
		colorscheme gotham
endif

if (s:is_plugged('ayu-vim'))
		let g:ayucolor = 'mirage'
		colorscheme ayu
endif

" GUI
set guifont=Ricty:h15
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
nnoremap <Leader>n  :NERDTreeTabsToggle<CR>
nnoremap <Leader>f  :<C-u>CtrlP<CR>
nnoremap <Leader>jf :call FormatJson()<CR>
nnoremap <Leader>b  :Gblame<CR>
nnoremap <Leader>s  :Gstatus<CR>
nnoremap <Leader>c  :Gcommit<CR>
nnoremap <Leader>d  :Gdiff<CR>
nnoremap <Leader>u  :UpdateTags -R .<CR>
nnoremap <Leader>t  :TagbarToggle<CR>
nnoremap <Leader>h  :noh<CR>
nnoremap <Leader>tm :TableModeToggle<CR>
nnoremap <C-]>      :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
nnoremap <Leader>i  :IndentGuidesToggle<CR>
vmap     <Enter>    <Plug>(EasyAlign)

" YouCompleteMe
let g:ycm_min_num_of_chars_for_completion         = 1
let g:ycm_seed_identifiers_with_syntax            = 1
let g:ycm_collect_identifiers_from_tags_files     = 0
let g:ycm_filetype_blacklist                      = {
						\ 'html':     1,
						\ 'tagbar':   1,
						\ 'qf':       1,
						\ 'notes':    1,
						\ 'markdown': 1,
						\ 'unite':    1,
						\ 'text':     1,
						\ 'vimwiki':  1,
						\ 'pandoc':   1,
						\ 'infolog':  1,
						\ 'mail':     1,
						\ 'nerdtree': 1
						\ }
let g:ycm_language_server                         = []
if executable('solargraph')
let rubylsp = {
						\   'name': 'ruby',
						\   'cmdline': [ 'solargraph', 'stdio' ],
						\   'filetypes': [ 'ruby' ]
						\ }
	call add(g:ycm_language_server, rubylsp)
endif

" CtrlP
let g:ctrlp_map                 = '<Nop>'
let g:ctrlp_use_caching         = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden         = 1
let g:ctrlp_jump_to_buffer      = 2
let g:ctrlp_match_window        = 'bottom,order:btt,min:1,max:10'
if executable('ag')
		let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ".git" --ignore ".svn" --ignore ".hg" --hidden -g ""'
		let g:ctrlp_max_depth    = 10
else
		let g:ctrlp_max_depth = 5
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

" vim-rooter
let g:rooter_disable_map  = 1
let g:rooter_silent_chdir = 1

" lightline
if s:is_plugged('lightline.vim')
		let g:lightline = {
								\ 'colorscheme': g:colors_name,
								\ 'active': {
								\ 	'left':  [ [ 'mode', 'paste' ], [ 'current_branch' ], [ 'filepath', 'modified', 'readonly' ] ],
								\ 	'right': [ [ 'rows' ], [ 'filetype' ], [ 'fileformat', 'fileencoding', 'indentation' ] ]
								\ },
								\ 'inactive': {
								\ 	'left':  [ [ 'mode', 'paste' ], [ 'current_branch' ], [ 'filepath', 'modified', 'readonly' ] ],
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
								\ 	'filepath': 'Filepath'
								\ },
								\ 'component_expand': {
								\ 	'indentation': 'MixedIndentationWarning',
								\ 	'readonly': 'ReadOnly',
								\ },
								\ 'component_type': {
								\ 	'indentation': 'error',
								\ 	'readonly': 'error',
								\ },
								\ 'tabline': {
								\ 	'left': [ [ 'tabs' ] ],
								\ 	'right': [ [] ]
								\ },
								\ 'tab': {
								\ 	'active': [ 'title' ],
								\ 	'inactive': [ 'title' ]
								\ },
								\ 'tab_component_function': {
								\ 	"title": "TabTitle"
								\ }
								\ }

		function! ReadOnly()
				return &ft !~? 'help' && &ro ? 'RO' : ''
		endfunction

		function! CurrentBranch()
				try
						if exists('*fugitive#head')
								let _ = fugitive#head()
								return strlen(_) ? _ : ''
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
				return expand('%:t')
		endfunction

		function! Filepath()
				return expand('%')
		endfunction

		function! TabFilePath(n)
				let buflist = tabpagebuflist(a:n)
				let winnr = tabpagewinnr(a:n)
				let _ = expand('#'.buflist[winnr - 1].':p')
				return strlen(_) ? _ : '[No Name]'
		endfunction

		function! TabProjectName(n)
				return fnamemodify(ProjectRootGet(TabFilePath(a:n)), ':t')
		endfunction

		function! TabTitle(n)
				let projectname = TabProjectName(a:n)
				let filename = lightline#tab#filename(a:n)

				if ( projectname == filename )
						return projectname
				elseif( projectname != '' )
						return projectname . ":" . filename
				endif

				return filename
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
au BufRead,BufNewFile *.txt                           setl filetype=text
au BufRead,BufNewFile *.rb                            setl filetype=ruby
au BufRead,BufNewFile *.erb                           setl filetype=eruby
au BufRead,BufNewFile *.md,*.markdown,*.md.*          setl filetype=markdown
au BufRead,BufNewFile *.go                            setl filetype=go
au BufRead,BufNewFile *.tracwiki                      setl filetype=tracwiki
au BufRead,BufNewFile *.tf,*.tfstate,*.tfstate.backup setl filetype=terraform
au BufRead,BufNewFile *etc/httpd/conf/*,*etc/httpd/conf.d/*,/etc/apache2/apache2.conf setl filetype=apache
au BufRead,BufNewFile keepalived.conf setl ft=keepalived
au BufRead,BufNewFile *.case setl ft=case
au BufRead,BufNewFile *.rule setl ft=rule

" Plain Text
au FileType text setl sw=2 sts=2 ts=2 et

" HTML
au FileType html setl sw=2 sts=2 ts=2 et

let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete          = 1
let g:html5_microdata_attributes_complete     = 1
let g:html5_aria_attributes_complete          = 1

" Ruby
au FileType ruby,eruby setl sw=2 ts=2 sts=2 et
let ruby_space_errors                   = 1
let g:ruby_indent_block_style           = 'do'
let g:rubycomplete_buffer_loading       = 1
let g:rubycomplete_classes_in_global    = 1
let g:rubycomplete_include_object       = 1
let g:rubycomplete_include_object_space = 1

" Python
au FileType python setl smartindent sw=4 sts=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class

" JavaScript
au FileType javascript setl sw=2 sts=2 ts=2 et

" CSS/SCSS
au FileType css setl sw=2 sts=2 ts=2 et
au FileType scss setl sw=2 sts=2 ts=2 et

" JSON
au FileType json setl sw=2 sts=2 ts=2 et

" CoffeeScript
au FileType coffeescript setl sw=2 sts=2 ts=2 et

" TypeScript
au FileType typescript setl sw=2 sts=2 ts=2 et
let g:js_indent_typescript=1

" Yaml
au FileType yaml setl sw=2 sts=2 ts=2 et

" SLS
au FileType sls setl sw=2 sts=2 ts=2 et

" Markdown
au FileType markdown setl sw=2 sts=2 ts=2 et

" reStructuredText
let g:riv_disable_folding = 1

" liquid
au FileType liquid setl sw=2 ts=2 sts=2 et

" Go
au FileType go setl sw=8 sts=8 ts=8 noet
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_fields            = 1
let g:go_highlight_types             = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command                 = 'goimports'
let g:go_fmt_autosave                = 1

" Terraform
au FileType terraform setl sw=2 ts=2 sts=2 et
