-- Automatically format code on save
-- https://github.com/stevearc/conform.nvim

return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "never",
            },
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
                -- Use a sub-list to run only the first available formatter
                php = { { "pint", "php-cs-fixer" } },
            },
        })
    end,
}
