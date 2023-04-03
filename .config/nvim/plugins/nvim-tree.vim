Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'

autocmd User PlugLoaded ++nested luafile ~/.config/nvim/lua/nvim_tree.lua

:nnoremap <Leader>ntt :NvimTreeToggle<CR>
:nnoremap <Leader>ntf :NvimTreeFindFile<CR>
