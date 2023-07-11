" =========== General Settings =============
" Enable line numbers
set number

" Set to auto read when a file is changed from the outside
set autoread

" Set line break
set linebreak

" Use spaces instead of tabs
set expandtab

" Set spaces count for a tab
set tabstop=4
set shiftwidth=4

" Enable syntax highlighting
syntax enable

" Set encoding to UTF-8
set encoding=utf8

" Enable mouse support
set mouse=a

" Enable clipboard support
set clipboard+=unnamedplus

" =========== Plugins =============
" Assuming you are using vim-plug for plugin management
call plug#begin('~/.vim/plugged')

" NERDTree, a file explorer plugin
Plug 'preservim/nerdtree'

" Airline, a status line plugin
Plug 'vim-airline/vim-airline'

" ctrlp.vim, a file search plugin
Plug 'ctrlpvim/ctrlp.vim'

" Close brackets completion
Plug 'jiangmiao/auto-pairs'

call plug#end()

" =========== Key Mappings =============
" Map :NERDTreeToggle to <C-n>(Control + n)
map <C-n> :NERDTreeToggle<CR>

" Map :CtrlP to <C-p>(Control + p)
map <C-p> :CtrlP<CR>

" =========== Plugin Config =============
" NERDTree settings
let NERDTreeIgnore=['\~$', '\.pyc$', '\.o$']
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" ctrlp.vim settings
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = 'ra'

" =========== Appearance =============
" Set color scheme
colorscheme default

