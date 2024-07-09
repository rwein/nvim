-- Show buffers as tabs
-- https://github.com/romgrk/barbar.nvim

return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false
        vim.keymap.set("n", "<leader>bc", "<Cmd>BufferClose<CR>", {})
        vim.keymap.set("n", "<leader>bc", "<Cmd>BufferClose<CR>", {})
        vim.keymap.set("n", "<leader>bp", "<Cmd>BufferPick<CR>", {})
        vim.keymap.set("n", "<leader>bh", "<Cmd>BufferPrev<CR>", {})
        vim.keymap.set("n", "<leader>bl", "<Cmd>BufferNext<CR>", {})
        vim.keymap.set("n", "<leader>b1", "<Cmd>BufferGoto 1<CR>", {})
        vim.keymap.set("n", "<leader>b2", "<Cmd>BufferGoto 2<CR>", {})
        vim.keymap.set("n", "<leader>b3", "<Cmd>BufferGoto 3<CR>", {})
        vim.keymap.set("n", "<leader>b4", "<Cmd>BufferGoto 4<CR>", {})
        vim.keymap.set("n", "<leader>b5", "<Cmd>BufferGoto 5<CR>", {})
        vim.keymap.set("n", "<leader>b6", "<Cmd>BufferGoto 6<CR>", {})
        vim.keymap.set("n", "<leader>b7", "<Cmd>BufferGoto 7<CR>", {})
        vim.keymap.set("n", "<leader>b8", "<Cmd>BufferGoto 8<CR>", {})
        vim.keymap.set("n", "<leader>b9", "<Cmd>BufferGoto 9<CR>", {})
    end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
        clickable = false,
        sidebar_filetypes = {
            NvimTree = true,
        },
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
