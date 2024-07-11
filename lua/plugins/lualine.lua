-- Stylized prompt and status bar
-- https://github.com/nvim-lualine/lualine.nvim
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                disabled_filetypes = {
                    -- Don't show on file explorer
                    "NeoTree",
                },
            },
        })
    end,
}
