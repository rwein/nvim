-- Set up LSPs & Autocomplete
local lspconfig = require("lspconfig")
local cmp = require("cmp")
local lsp_zero = require("lsp-zero")

-- Set default keymaps when an LSP attaches to a buffer
lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
end)

-- PHPActor is an opensource LSP for PHP, but it didn't work as well as Intelephense for me (as of Jul 2024). Keeping
-- It here in case I want to try it again in the future.
-- lspconfig.phpactor.setup({})
lspconfig.intelephense.setup({}) -- Closed source and some features pay walled but works well for php
lspconfig.lua_ls.setup({})
lspconfig.gopls.setup({})
-- For more LSP configs, see this resource
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

cmp.setup({
    -- Preselect first autocompletion
    preselect = "item",
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    mapping = cmp.mapping.preset.insert({
        -- Allow tabbing through completions
        ["<S-Tab>"] = lsp_zero.cmp_action().luasnip_supertab(),
        -- Confirm with 'enter' key
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),
})
