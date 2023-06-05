" load main config from lua
luafile ~/.config/nvim/lua/init.lua

set undodir=~/.vim/undodir

let plugins_dir = "~/.config/nvim/plugins"
let data_dir = has("nvim") ? stdpath("data") . "/site" : "~/.vim"

call plug#begin (data_dir . "/plugins")

source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/status-line.vim
source ~/.config/nvim/plugins/transparent.vim
source ~/.config/nvim/plugins/oneNeoVim.vim "colorscheme
" source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/lsp_zero.vim
source ~/.config/nvim/plugins/lsp_arduino.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/gitgutter.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/nerdcommenter.vim


source ~/.config/nvim/plugins/splits.vim
source ~/.config/nvim/plugins/vimdebug.vim
source ~/.config/nvim/plugins/table_mode.vim
source ~/.config/nvim/plugins/vim_markdown.vim
source ~/.config/nvim/plugins/which-key.vim
source ~/.config/nvim/plugins/tailwindcss3.vim
source ~/.config/nvim/plugins/mergetool.vim
source ~/.config/nvim/plugins/harpoon.vim
source ~/.config/nvim/plugins/startupsnvim.vim

call plug#end ()

doautocmd User PlugLoaded

luafile ~/.config/nvim/lua/final.lua
