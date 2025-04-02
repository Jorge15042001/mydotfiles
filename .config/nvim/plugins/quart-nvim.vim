Plug 'quarto-dev/quarto-nvim'
Plug 'jmbuhr/otter.nvim'
Plug 'jpalardy/vim-slime'
Plug 'ekickx/clipboard-image.nvim'

autocmd User PlugLoaded ++nested luafile ~/.config/nvim/lua/quarto.config.lua
