" =======================
" Neovim Configuration File
" Anvesh G. Jhuboo
" PATH: ~/.config/nvim/init.vim
"
" Install Neovim Plugin manager:
"   curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Open Neovim and run: :UpdatePlugins
" =======================

" Set leader to space
let mapleader = "\<Space>"


" Set up Vim Plug (plugin manager)
call plug#begin(stdpath('data') . '/plugged')

" Plugins
Plug 'neovim/nvim-lspconfig'    " Language Server Protocol configurations
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Tree-sitter for better syntax highlighting
Plug 'hrsh7th/nvim-compe'       " Autocompletion
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'junegunn/fzf.vim'         " Fzf.vim for Neovim integration
Plug 'preservim/nerdtree'       " File explorer
Plug 'tpope/vim-fugitive'       " Git integration
Plug 'airblade/vim-gitgutter'   " Show git diff in the gutter
Plug 'itchyny/lightline.vim'    " Lightweight status line
Plug 'nvim-telescope/telescope.nvim' " Modern file picker
Plug 'norcalli/nvim-colorizer.lua' " Colorize hex codes, etc.
Plug 'rebelot/kanagawa.nvim'    " Dark Coloscheme, inspired by Kanagawa

call plug#end()

" General settings
set number                    " Enable line numbers
set relativenumber            " Enable relative line numbers
set tabstop=4                 " Set tab width to 4 spaces
set shiftwidth=4              " Set indentation width to 4 spaces
set expandtab                 " Use spaces instead of tabs
set smartindent               " Enable smart indentation
set ignorecase                " Case insensitive searching
set smartcase                 " Case-sensitive when expression contains a capital letter
set wrap                      " Enable line wrapping
set linebreak                 " Wrap lines at convenient points
set scrolloff=5               " Keep at least 5 lines above/below cursor when scrolling
set clipboard+=unnamedplus    " Use system clipboard

" Colorscheme
syntax enable
set background=dark
set termguicolors
colorscheme kanagawa-dragon      " -wave (default), -dragon (dark), -lotus (light)

" Language Server Protocol configuration
lua << EOF
require'lspconfig'.tsserver.setup{}
EOF

" Autocompletion
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.allow_prefix_unmatch = v:false

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:false
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:false
let g:compe.source.ultisnips = v:false
let g:compe.source.luasnip = v:false

" FZF configuration
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

" NERDTree configuration
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeAutoDeleteBuffer=1

" Lightline configuration
let g:lightline = {
\ 'colorscheme': 'default',
\ 'active': {
\ 'left': [ [ 'mode', 'paste' ],
\ [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\ 'gitbranch': 'FugitiveHead'
\ },
\ }

" Telescope configuration
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-b> :Telescope buffers<CR>
nnoremap <C-g> :Telescope live_grep<CR>

" Treesitter configuration
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
EOF

" Colorizer configuration
lua << EOF
require'colorizer'.setup()
EOF

" Enable filetype plugins and indentation
filetype plugin indent on

" Custom key mappings
nnoremap <leader>w :w<CR> " Save current file
nnoremap <leader>q :q<CR> " Close current window
nnoremap <leader>Q :qa<CR> " Close all windows and quit
nnoremap <leader>x :x<CR> " Save and close current window
nnoremap <leader>d :bd<CR> " Delete current buffer
nnoremap <leader>h :noh<CR> " Clear search highlight
nnoremap <leader>ev :vsplit $MYVIMRC<CR> " Open Neovim configuration
nnoremap <leader>sv :source $MYVIMRC<CR> " Reload Neovim configuration

" Quick window resizing
nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Down> :resize +2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Terminal mode key mappings
tnoremap <Esc> <C-><C-n>
tnoremap <C-h> <C-><C-n><C-w>h
tnoremap <C-j> <C-><C-n><C-w>j
tnoremap <C-k> <C-><C-n><C-w>k
tnoremap <C-l> <C-><C-n><C-w>l

" Create custom command for updating plugins
command! UpdatePlugins :PlugUpdate | :PlugUpgrade | :PlugClean! | :PlugInstall

