local config = require 'nvim-treesitter.configs'
config.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
  }
