let s:NVIMROOT = $HOME."/.config/nvim"
"set nocompatible
filetype off

call plug#begin(s:NVIMROOT.'/plugged')

function! DoRemote(arg)
	UpdateRemotePlugins
endfunction

Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-sneak'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'sjl/gundo.vim' " undo tree
Plug 'tpope/vim-fugitive' " git
Plug 'yssl/QFEnter' " Open quickfix items in previouslty focused window
Plug 'kshenoy/vim-signature' " shows marks
Plug 'christoomey/vim-tmux-navigator'
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'janko-m/vim-test'
Plug 'derekwyatt/vim-fswitch' " switch to/from header file
Plug 'tpope/vim-sleuth' " Detect indentation
Plug 'jaawerth/nrun.vim' " use local node_modules binaries (eg. eslint)

" Filetype plugins
Plug 'leafgarland/typescript-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'wavded/vim-stylus'
Plug 'mustache/vim-mustache-handlebars'
Plug 'digitaltoad/vim-jade'
Plug 'jplaut/vim-arduino-ino'
Plug 'wting/rust.vim'
Plug 'cespare/vim-toml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
"Plug 'hsanson/vim-android'
"Plug 'artur-shaik/vim-javacomplete2'
Plug 'kelwin/vim-smali'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'
Plug 'tikhomirov/vim-glsl'
Plug 'pangloss/vim-javascript'
Plug 'zah/nim.vim'

Plug 'zivyangll/git-blame.vim'

" Syntax
Plug 'vim-syntastic/syntastic'

" Arduino
Plug 'tclem/vim-arduino'


" Instant Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
filetype plugin on
let g:instant_markdown_slow = 1

call plug#end()

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

" Changing Leader Key
let mapleader = ","

" Supertab settings
"let g:SuperTabDefaultCompletionType = "context"

" Neosnipet
let g:neosnippet#enable_completed_snippet = 1

" vim-javascript
let g:javascript_plugin_flow = 1

" CtrlP settings
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_map = '<Leader>o'
nnoremap <Leader>l :CtrlPBuffer<CR>
"let g:ctrlp_match_window_bottom = 0
"let g:ctrlp_match_window_reversed = 0
if executable('ag')
	let g:ctrlp_user_command = 'pushd %s && ag -l --nocolor && popd'
	let g:ctrlp_use_caching = 0
endif

" fzf settings
"nnoremap <leader>o :FZF<cr>

" Vim-android settings
"let g:android_sdk_path = '/usr/local/android-sdk'
"let g:gradle_path = '/usr/local/bin/gradle'

" sneak settings
let g:sneak#s_next = 1

" Air-line settings
"set guifont=Menlo\ for\ Powerline
"let g:Powerline_symbols = 'fancy'
"let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" Vim-grepper settings
set grepprg=ag\ --vimgrep
set grepformat=%f:%l:%c:%m
command -nargs=1 Find :execute 'noautocmd silent grep! "'.expand('<args>').'"' | copen
command -nargs=1 FindWord :execute 'noautocmd silent grep! -w "'.expand('<args>').'"' | copen
"command -nargs=1 Find execute 'noautocmd silent grep! "<args>"' | copen
nnoremap <leader>f :Find 
nnoremap <leader>* :FindWord <cword><CR>
" nnoremap <leader>f :Grepper<cr>
" nnoremap <leader>* :Grepper -cword -noprompt<cr>

" NERDTree settings
nnoremap <C-n> :NERDTreeToggle<cr>

" Indent guides settings
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 0

" Gundo settings
nnoremap <Leader>u :GundoToggle<cr>

" Signature settings
nnoremap <Leader>m :SignatureToggleSigns<cr>

" Tagbar settings
nnoremap <C-t> :TagbarToggle<cr>

" Go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_term_width = 30
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <leader>r <Plug>(go-rename)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>v <Plug>(go-def)
au FileType go nmap <Leader>V <Plug>(go-def-tab)
au FileType go nmap <Leader><space> <Plug>(go-run-vertical)

" nim settings
au FileType nim nnoremap <Leader>v :call GotoDefinition_nim()<cr>

" C++ settings
au FileType cpp nmap <Leader>v :exec("cs find g ".expand("<cword>"))<CR>
au FileType cpp nmap <Leader>c :exec("cs find c ".expand("<cword>"))<CR>
au FileType cpp nmap <Leader>h :FSHere<CR>

" Tern for vim settings
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType javascript nmap <Leader>v :TernDef<CR>

" Vim-test settings
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>

" TAB settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" Wildmenu completion
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls
"set wildignore+=*/tmp/* " Contents of tmp folders
"set wildignore+=*/log/* " Contents of log folders
"set wildignore+=*/gen/* " Contents of log folders
"set wildignore+=*/build/* " Contents of log folders
"set wildignore+=*/node_modules/* " NPM package data
"set wildignore+=*/public/* " Contents of the public folders
"set wildignore+=*/bower_components/* " Bower package contents
set wildignore+=*.aux,*.out,*.toc " Latex Indermediate files
"set wildignore+=*.min.js " Minified js files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " Binary Imgs
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled Object files
set wildignore+=*.spl " Compiled speolling world list
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.DS_Store " OSX SHIT
set wildignore+=*.luac " Lua byte code
set wildignore+=migrations " Django migrations
set wildignore+=*.pyc " Python Object codes
set wildignore+=*.orig " Merge resolution files

set modelines=0
set encoding=utf-8
set scrolloff=1
set autoindent
set nosmartindent
set showmode
set showcmd
set hidden
set visualbell
set ruler
set laststatus=2
"set undofile
set incsearch
set list listchars=tab:\|\ ,trail:·
set scs
set gdefault
set showmatch
set history=100
set autoread
set backspace=eol,start,indent
set whichwrap+=<,>,[,]
set ignorecase
set smartcase
set hlsearch
set lazyredraw
set magic
"set nowrap
set wrap
set breakindent " indent wrapped lines
set number
set cursorline
set nobackup
set noswapfile
set timeoutlen=1000
set ttimeoutlen=0
"set esckeys
"set foldmethod=indent
set mouse=c
set exrc
set secure
set tags=./tags;/

" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

syntax on

" Map ctrl-movement keys to window switching
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
if has('nvim')
	tnoremap <C-k> <C-\><C-n><C-w>k
	tnoremap <C-j> <C-\><C-n><C-w>j
	tnoremap <C-l> <C-\><C-n><C-w>l
	tnoremap <C-h> <C-\><C-n><C-w>h
	tnoremap <Esc> <C-\><C-n>
endif

" Better wrapped lines navigation
nnoremap k gk
nnoremap j gj

" Faster save
nnoremap <Leader>w :w<CR>
"
" Faster new tab
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>T :tabonly<CR>

" Faster tab navigation
nnoremap t1 1gt
nnoremap t2 2gt
nnoremap t3 3gt
nnoremap t4 4gt
nnoremap t5 5gt
nnoremap t6 6gt

" Alternate file
nnoremap <C-p> :e#<CR>

" faster new vsplit 
nnoremap <leader>vv :vsplit<cr>
nnoremap <leader>hh :split<cr>

" Copy & paste to system clipboard
vmap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Next/Prev quickfix
nnoremap <Leader>n :cn<CR>
nnoremap <Leader>N :cp<CR>

" Next/Prev error (loclist)
nnoremap <Leader>e :NextErr<CR>
nnoremap <Leader>E :PrevErr<CR>

command NextErr call s:NextErr()
function s:NextErr()
	for item in getloclist(0)
		if item.lnum > line('.')
			call cursor(item.lnum, item.col)
			break
		endif
	endfor
endfunction

command PrevErr call s:PrevErr()
function s:PrevErr()
	let list = getloclist(0)
	let i = len(list)
	while i > 0
		let i -= 1
		let item = list[i]
		if item.lnum < line('.')
			call cursor(item.lnum, item.col)
			break
		endif
	endwhile
endfunction

" Disable syntax highliting on double esc
nnoremap <Leader><ESC> :noh<CR><ESC>

" Make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" Map [ and ] to é and à
set langmap=é[,à]

" Select previously pasted text
noremap gV `[v`]

" Show registers
noremap <Leader>r :reg<CR>

" Resize Split When the window is resized
"au VimResized * :wincmd =

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
	au!
	au BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\ execute 'normal! g`"zvzz' |
		\ endif
augroup END

colorscheme wombat256mod
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.ino set filetype=arduino
au BufNewFile,BufRead *.pde set filetype=arduino
au BufNewFile,BufRead *.ejs set filetype=ejs
au BufNewFile,BufRead *.jsonconf set filetype=json

" Git blame
" Plug 'zivyangll/git-blame.vim'
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" Change cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

