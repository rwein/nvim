-- Tree File Explorer
-- https://github.com/nvim-tree/nvim-tree.lua:w

-- Customize nvim-tree key bindings
local function customize_nvim_tree_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Import default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Override with custom mappings
  -- When we're inside of nvim tree, we still want C-e to toggle
  vim.keymap.set('n', '<C-e>', ':NvimTreeToggle<CR>', opts('Toggle'))
end

return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require("nvim-tree").setup({
            on_attach = customize_nvim_tree_on_attach,
            view = {
              adaptive_size = true, -- Adjusts size to fit content
            },
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            update_focused_file = {
              enable = true,
              update_root = true
            }
        })

        -- Open nvim-tree automatically on vim startup
        vim.api.nvim_create_autocmd("VimEnter", {
          callback = function()
            -- Only open nvim-tree if no files were specified on command line
            if #vim.fn.argv() == 0 then
              require("nvim-tree.api").tree.open()
            end
          end,
        })

        -- Open nvim tree with C-e
        vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end
}

