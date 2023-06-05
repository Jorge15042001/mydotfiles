local cmp = require('cmp')
local lsp = require('lsp-zero')
local map = require('map').map
require('luasnip.loaders.from_snipmate').lazy_load()

require('mason.settings').set({
  ui = {
    border = 'rounded'
  }
})

lsp.preset('recommended')

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})


lsp.setup_nvim_cmp({
  select_behavior = 'insert',
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 0},
    {name = 'buffer', keyword_length = 0},
    {name = 'luasnip', keyword_length = 0},
  },
  formatting = {
    -- changing the order of fields so the icon is the first
    fields = {'menu', 'abbr', 'kind'},

    -- here is where the change happens
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
        nvim_lua = 'Π',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})


lsp.setup()

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true}),
  }
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = true,
})


map("n","<leader>rn", ":lua vim.lsp.buf.rename()<CR>" ,{silent=true})
map("n","<leader>ac", ":lua vim.lsp.buf.code_action()<CR>" ,{silent=true})
