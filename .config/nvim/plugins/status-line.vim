Plug 'beauwilliams/statusline.lua'
Plug 'nvim-lua/lsp-status.nvim'

autocmd User PlugLoaded ++nested luafile ~/.config/nvim/lua/statusline_config.lua
