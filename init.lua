-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set a guide at 120 characters in the editor to help indicate a reasonable cut-off
vim.opt.colorcolumn="120"

-- Add relative and absolute line numbers to editor
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Configure softabs & tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Insert characters for tabs and trailing spaces for better visibility
vim.opt.list = true
vim.opt.listchars = { tab = '▸ ', trail = '·' }

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable 24 bit colors
vim.opt.termguicolors = true

-- Map 'jk' to <Esc> in insert mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Disable netrw, we'll use a different explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Customize nvim-tree key bindings
local function customize_nvim_tree_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Import default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Override with custom mappings
  vim.keymap.set('n', '<C-e>', ':NvimTreeToggle<CR>', opts('Toggle'))
end

-- Open nvim tree with ctrl e
vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Set custom key mappings for switching windows
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Install material theme
    'marko-cerovac/material.nvim',
    -- Install Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- Install lsp-zero
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'}, {'L3MON4D3/LuaSnip'},
    -- nvim tree
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- Lazy git
    {
      "kdheepak/lazygit.nvim",
      cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
      },
      -- optional for floating window border decoration
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      -- setting the keybinding for LazyGit with 'keys' is recommended in
      -- order to load the plugin when the command is run for the first time
      keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
      }
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Load material theme
vim.cmd 'colorscheme material'

-- Load Lualine
require('lualine').setup({
    options = {
        disabled_filetypes = {
            -- Don't show lualine on nvim-tree
            'NvimTree'
        }
    }
})

-- Load nvim-tree
require("nvim-tree").setup({
    on_attach = customize_nvim_tree_on_attach,
})

-- Open nvim-tree on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Only open nvim-tree if no files were specified on command line
    if #vim.fn.argv() == 0 then
      require("nvim-tree.api").tree.open()
    end
  end,
})
