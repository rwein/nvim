-- More powerful syntax highlighting
-- https://github.com/nvim-treesitter/nvim-treesitter
--
-- Some parsers get bundled with Neovim and can cause conflicts with treesitter. You may need to force install a
-- specific parser for tresitter to pick it up. e.g. see what parse is the issue with `:checkhealth treesitter` and
-- then reinstall with `:TSInstall! <lang>`
--
-- For more info, see: https://github.com/nvim-treesitter/nvim-treesitter/issues/3092
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        -- Start Blade support
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

        parser_config.blade = {
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade",
        }

        vim.filetype.add({
            pattern = {
                [".*%.blade%.php"] = "blade",
            },
        })
        -- End Blade support

        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
                "html",
                "css",
                "php",
                "php_only",
                "phpdoc",
                "blade",
                "javascript",
                "typescript",
                "tsx",
                "python",
                "go",
                "bash",
                "json",
                "ruby",
                "sql",
                "xml",
                "yaml",
                "dockerfile",
            },
            highlight = {
                enable = true,
            },
        })
    end,
}
