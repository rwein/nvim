-- Set up LSPs & Autocomplete
local lspconfig = require('lspconfig')
local cmp = require('cmp')
local lsp_zero = require('lsp-zero')

-- Set default keymaps when an LSP attaches to a buffer
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

lspconfig.phpactor.setup({})
lspconfig.lua_ls.setup({})
