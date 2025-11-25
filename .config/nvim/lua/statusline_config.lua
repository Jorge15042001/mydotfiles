local statusline = require('statusline')
statusline.setup({
    match_colorscheme = true, -- Enable colorscheme inheritance (Default: false)
    tabline = true, -- Enable the tabline (Default: true)
    lsp_diagnostics = true, -- Enable Native LSP diagnostics (Default: true)
    ale_diagnostics = true, -- Enable ALE diagnostics (Default: false)
  })
-- statusline.lsp_diagnostics = true
-- statusline.ale_diagnostics = true
-- This setting will mean that you have one single statusline drawn accross the entire display
-- vim.o.laststatus=3
