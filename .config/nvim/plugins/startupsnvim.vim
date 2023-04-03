Plug 'startup-nvim/startup.nvim'

" dependencies
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

autocmd User PlugLoaded ++nested luafile ~/.config/nvim/lua/startup.config.lua
