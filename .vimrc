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

NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'xolox/vim-misc'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'EvanDotPro/nerdtree-chmod'
NeoBundle 'dbakker/vim-projectroot'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'elzr/vim-json'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'rhysd/try-colorscheme.vim'
NeoBundle 'itchyny/vim-cursorword'
NeoBundle 'itchyny/lightline.vim'

NeoBundle 'Valloric/YouCompleteMe', {
						\ 'build': {
						\	'mac': 'sh -c "cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --gocode-completer --tern-completer"',
						\	'unix': 'sh -c "cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --gocode-completer --tern-completer"',
						\ },
						\}

NeoBundleLazy 'vim-ruby/vim-ruby', {
						\ "autoload": {"filetypes": ["ruby"]}
						\ }

NeoBundleLazy 'todesking/ruby_hl_lvar.vim', {
						\ "autoload": {"filetypes": ["ruby"]}
						\ }

NeoBundleLazy 'tpope/vim-rails', {
						\ "autoload": {"filetypes": ["ruby"]}
						\ }

NeoBundleLazy 'tpope/vim-endwise', {
						\ "autoload": {"filetypes": ["ruby"]}
						\ }

NeoBundleLazy 'fatih/vim-go', {
						\ 'autoload': {
						\ 	'filetypes': 'go',
						\ 	'commands': ['GoInstallBinaries', 'GoUpdateBinaries'],
						\ }
						\ }

NeoBundleLazy 'othree/yajs.vim', {
						\ "autoload": {"filetypes": ["javascript"]}
						\ }

"NeoBundleLazy 'Quramy/vim-js-pretty-template', {
"						\ "autoload": {"filetypes": ["javascript", "typescript"]}
"						\ }

NeoBundleLazy 'jason0x43/vim-js-indent', {
						\ "autoload": {"filetypes": ["javascript", "typescript", "html"]}
						\ }

NeoBundleLazy 'kchmck/vim-coffee-script', {
						\ "autoload": {"filetypes": ["coffeescript"]}
						\ }

NeoBundleLazy 'HerringtonDarkholme/yats.vim', {
						\ "autoload": {"filetypes": ["typescript"]}
						\ }

NeoBundleLazy 'Rykka/riv.vim', {
						\ "autoload": {"filetypes": ["rst"]}
						\ }

NeoBundleLazy 'othree/html5.vim', {
						\ "autoload": {"filetypes": ["html"]}
						\ }

NeoBundleLazy 'gregsexton/MatchTag', {
						\ "autoload": {"filetypes": ["html"]}
						\ }

NeoBundleLazy 'hashivim/vim-terraform', {
						\ "autoload": {"filetypes": ["terraform"]}
						\ }

NeoBundleLazy 'vim-scripts/tracwiki', {
						\ "autoload": {"filetypes": ["tracwiki"]}
						\ }

NeoBundleLazy 'saltstack/salt-vim', {
						\ "autoload": {"filetypes": ["sls"]}
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
set tags=./tags;
set autoread
set nofoldenable
set re=0
set lazyredraw
set ttyfast
set tabstop=4
set ambiwidth=double
set nobackup
set visualbell t_vb=
set completeopt=menuone
set cursorline

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

" delete trailing spaces
au BufWritePre * if index(['markdown', 'diff', 'sql'], &filetype) < 0 | :%s/\s\+$//e

" auto read
augroup vimrc-checktime
		autocmd!
		autocmd WinEnter * checktime
augroup END

" EasyTags
let g:easytags_always_enabled = 0
let g:easytags_auto_update    = 0
let g:easytags_async          = 1
let g:easytags_dynamic_files  = 2
let g:easytags_autorecurse    = 1
let g:easytags_auto_highlight = 0
let g:easytags_on_cursorhold  = 0

" NERDTree
autocmd BufEnter * silent! lcd %:p:h
let NERDTreeChDirMode   = 0
let NERDTreeHijackNetrw = 0
let NERDTreeWinSize     = 40
let NERDTreeShowHidden  = 1
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif"))"

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

" Encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932

" Color
set t_Co=256
set background=dark
colorscheme iceberg
if ($TERM_PROGRAM == 'iTerm.app')
		set termguicolors
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum""]"
endif
hi NonText ctermbg=bg ctermfg=bg guibg=bg guifg=bg
hi EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

" GUI
set guifont=Ricty\ Regular\ For\ Powerline:h17
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
nnoremap <Leader>u  :UpdateTags -R .<CR>
nnoremap <Leader>t  :TagbarToggle<CR>
nnoremap <Leader>h  :noh<CR>
nnoremap <Leader>tm :TableModeToggle<CR>
nnoremap <C-]>      :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
vmap     <Enter>    <Plug>(EasyAlign)

" YouCompleteMe
let g:ycm_min_num_of_chars_for_completion     = 1
let g:ycm_seed_identifiers_with_syntax        = 1
let g:ycm_collect_identifiers_from_tags_files = 0

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

" Syntastic
let g:syntastic_enable_signs            = 1
let g:syntastic_auto_loc_list           = 2
let g:syntastic_mode_map                = { 'mode': 'active',
						\ 'active_filetypes': [],
						\ 'passive_filetypes': ['html']
						\ }
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng-']
let g:syntastic_go_checkers             = ['go', 'errcheck']
let g:syntastic_typescript_checkers     = ['tslint']

" vim-rooter
let g:rooter_disable_map  = 1
let g:rooter_silent_chdir = 1

" lightline
if neobundle#is_installed('lightline.vim')
		let g:lightline = {
								\ 'colorscheme': 'iceberg',
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
								\ 'separator': {
								\ 	'left': "\u2b80", 'right': "\u2b82"
								\ },
								\ 'subseparator': {
								\ 	'left': "\u2b81", 'right': "\u2b83"
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
au BufRead,BufNewFile *.txt                           set filetype=text
au BufRead,BufNewFile *.rb                            set filetype=ruby
au BufRead,BufNewFile *.erb                           set filetype=eruby
au BufRead,BufNewFile *.coffee                        set filetype=coffeescript
au BufRead,BufNewFile *.md,*.markdown,*.md.*          set filetype=markdown
au BufRead,BufNewFile *.go                            set filetype=go
au BufRead,BufNewFile *.tracwiki                      set filetype=tracwiki
au BufRead,BufNewFile *.tf,*.tfstate,*.tfstate.backup set filetype=terraform
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
au FileType ruby,eruby set sw=2 ts=2 sts=2 et
let ruby_space_errors                   = 1
let g:ruby_indent_block_style           = 'do'
let g:rubycomplete_buffer_loading       = 1
let g:rubycomplete_classes_in_global    = 1
let g:rubycomplete_include_object       = 1
let g:rubycomplete_include_object_space = 1

" Python
au FileType python setl smartindent sw=4 sts=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class

" JavaScript
au FileType javascript setlocal sw=2 sts=2 ts=2 et

" JSON
au FileType json setlocal sw=2 sts=2 ts=2 et

" CoffeeScript
au FileType coffeescript setlocal sw=2 sts=2 ts=2 et

" TypeScript
au FileType typescript setlocal sw=2 sts=2 ts=2 et
"au FileType typescript JsPreTmpl html
"au FileType typescript syn clear foldBraces
let g:js_indent_typescript = 1

" Yaml
au FileType yaml set sw=2 sts=2 ts=2 et

" SLS
au FileType sls set sw=2 sts=2 ts=2 et

" Markdown
au FileType markdown set sw=2 sts=2 ts=2 et

" reStructuredText
let g:riv_disable_folding = 1

" liquid
au FileType liquid set sw=2 ts=2 sts=2 et

" Go
au FileType go set sw=8 sts=8 ts=8 noet
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_fields            = 1
let g:go_highlight_types             = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command                 = 'goimports'
let g:go_fmt_autosave                = 1

" Terraform
au FileType terraform set sw=2 ts=2 sts=2 et
