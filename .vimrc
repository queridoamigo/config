syntax on
set number
set wrap
set tabstop=2
set nobackup
set linebreak
set showcmd 
set hlsearch
set mousehide
"set cursorline
set autoindent
set ignorecase
set smartcase
set mouse=
set shiftwidth:2
set shell=bash\ --login
:let g:airline_theme='bubblegum'
:let g:gitgutter_enabled = 0
:let g:vim_tags_auto_generate = 1
set updatetime=250

if version >= 700
    set history=64
    set undolevels=128
    set undodir=~/.vim/undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

set colorcolumn=80
highlight ColorColumn ctermbg=grey

:colorscheme vimnicedark 

"IF VUNDLE
	set nocompatible
	filetype off

	set rtp+=~/.vim/bundle/Vundle.vim/

	call vundle#rc()

	filetype plugin indent on
"FI VUNDLE

"IF plugins
	Bundle 'scrooloose/nerdtree'
	Bundle 'scrooloose/nerdcommenter'
	Bundle 'Xuyuanp/nerdtree-git-plugin'
	Bundle 'vim-airline/vim-airline'
	Bundle 'vim-airline/vim-airline-themes'
	Bundle 'alvan/vim-php-manual'
	Bundle 'Shougo/vimproc'
	Bundle 'Shougo/unite.vim'
	"Bundle 'tomtom/checksyntax_vim'
	Bundle 'mbbill/undotree'
	Bundle 'tpope/vim-fugitive'
	Bundle 'gregsexton/gitv'
	"Bundle 'vim-scripts/dbext.vim'
	"Bundle 'vim-scripts/SQLComplete.vim'
	"Bundle 'vim-scripts/SearchComplete'
	Bundle 'kshenoy/vim-signature'
	Bundle 'queridoamigo/vimnicedark'
	Bundle 'szw/vim-tags'
	Bundle 'majutsushi/tagbar'
	Bundle 'rlue/vim-getting-things-down'
	"Bundle 'johngrib/vim-game-code-break'
	"Bundle 'junegunn/fzf.vim'
	Bundle 'airblade/vim-gitgutter'
	Bundle 'ervandew/supertab'
"FI plugins

"IF maps
	"let maplocalleader = ","
	let mapleader = "'"
	nnoremap <F5> :UndotreeToggle<CR>
	nnoremap <F8> :TagbarToggle<CR>
	nnoremap <F4> :GitGutterToggle<CR>
	map <C-n> :NERDTreeToggle<CR>
	map <F7> :NERDTreeFind<CR>
	nnoremap <silent> <Leader>1 :resize +10<CR>
	nnoremap <silent> <Leader>2 :resize -10<CR>
	nnoremap <silent> <Leader>3 :call clearmatches()<CR>
"FI maps

"IF abbrevs
	ab tpi echo "<br />TY PIDOR!!!!<br />";
	ab tmy echo "<br />TY MYDAK!!!!<br />";
	ab que echo "<div class='dbg mysql'>".quickHighlight($query)."</div>";
	ab tdl <Tab>* TODO
	ab ech echo "<br /> -".$."<br />";
"FI abbrevs

"IF PHP autocomplete plugin 
	autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
"FI PHP autocomplete plugin 

"IF NERDTree
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	"let g:NERDTreeBookmarksFile = "~/.vim/bundle/nerdtree/bookmarks"
"FI NERDTree

"IF vim-getting-things-down
	"Defines the TODO keywords will cycle through.
	let g:gtdown_cycle_states = ['DONE', 'WAIT', 'HELP', 'TODO']
	" Sets the default fold level when opening a new Markdown file
	let g:gtdown_default_fold_level = 2
	" Should multi-line list items collapse too, or only headings?
	let g:gtdown_fold_list_items = 1
	" Display progress bar for folded headings/list items?
	let g:gtdown_show_progress = 0
	augroup gtDown
			autocmd!
				autocmd BufReadPre TODO.md let b:gtdown_show_progress = 1
			augroup END

	" Quick-switch between current file and `TODO.md` of project root
	nnoremap <Leader>t :call getting_things_down#show_todo()<CR>
	" " Cycle through TODO keywords
	nnoremap <Leader>c :call getting_things_down#cycle_status()<CR>
"FI vim-getting-things-down
