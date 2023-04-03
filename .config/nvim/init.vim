
" basic default configuration
" Set encoding
set encoding=utf-8

"disable clicking
set mouse=

set backspace=indent,eol,start

set number
set autoindent
set nohlsearch

set hidden
set noerrorbells

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab

set smartindent
set ignorecase

set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8


" set completeopt=menuone,noinsert,noselect

let mapleader = "\<space>"


nmap <silent> <leader>w :w<cr>
nmap <silent> <leader>wq :wq<cr>


nmap <silent> <leader>nhs :set nohlsearch<cr>
nmap <silent> <leader>hs :set hlsearch<cr>

" allow gf to open non-existing files
nmap <silent> gf :edit <cfile><cr>


" reselect for indentaion
vnoremap < <gv
vnoremap > >gv


" open files in default programs
nmap <silent> <leader>o :!xdg-open %<cr><cr>


let plugins_dir = "~/.config/nvim/plugins"
let data_dir = has("nvim") ? stdpath("data") . "/site" : "~/.vim"

if empty(glob(data_dir . '/autoload/plug.vim'))
  execute '!sh -c \'curl -fLo \"${XDG_DATA_HOME:-$HOME/.local/share}\"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim\''
  autocmd VimEnter * PlugInstall --sync
endif

call plug#begin (data_dir . "/plugins")

source ~/.config/nvim/plugins/vim-airline.vim
source ~/.config/nvim/plugins/ondark.vim "colorscheme
source ~/.config/nvim/plugins/oneNeoVim.vim "colorscheme
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/onebody.vim "colorscheme
source ~/.config/nvim/plugins/gitgutter.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/nerdcommenter.vim
source ~/.config/nvim/plugins/nerdtree.vim

source ~/.config/nvim/plugins/splits.vim
source ~/.config/nvim/plugins/vimdebug.vim
source ~/.config/nvim/plugins/table_mode.vim
" source ~/.config/nvim/plugins/vim-pandoc.vim
source ~/.config/nvim/plugins/vim_markdown.vim
source ~/.config/nvim/plugins/vim-pencil.vim
source ~/.config/nvim/plugins/which-key.vim
source ~/.config/nvim/plugins/tailwindcss3.vim
source ~/.config/nvim/plugins/mergetool.vim
source ~/.config/nvim/plugins/harpoon.vim

call plug#end ()

doautocmd User PlugLoaded

" color scheme
" colorscheme onedark
" let g:airline_theme='onedark'
" let g:onedark_config = {
"   \ 'style': 'darker',
" \}
"
"

colorscheme one-nvim
let g:airline_theme='onedark'
let g:onedark_config = {
  \ 'style': 'darker',
\}


