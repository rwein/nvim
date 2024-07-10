-- Fuzzy finder
-- https://github.com/nvim-telescope/telescope.nvim
return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        -- Customize telescope shortcuts. Note this are copied over in nvim-tree.lua so they also work when we're
        -- in file explorer.
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", function()
            builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
        end, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
}
