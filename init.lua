-- Change the mapleader to space
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable netrw, we'll use a different explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set a guide at 120 characters in the editor to help indicate a reasonable cut-off
vim.opt.colorcolumn="120"

-- Add relative and absolute line numbers to editor
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

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

-- Set Font for Neovide
vim.o.guifont = "Operator Mono Book:h15" 

-- Map 'jk' to <Esc> in insert mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Set custom key mappings for switching windows
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- If Neovide is opened up via spotlight and the cwd is root, change it to /code
if vim.g.neovide then
    if vim.fn.getcwd() == '/' then
        vim.cmd('cd ~/code')
    end
end

-- Load up lazy.nvim
require("config.lazy")
