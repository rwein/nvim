local function open_neotree_on_boot()
    -- Only open nvim-tree if no files were specified on command line
    if vim.fn.argc() == 0 then
        vim.defer_fn(function()
            vim.api.nvim_command("Neotree toggle")
        end, 100)
    end
end

-- Set up an auto-command to trigger the function when Neovim starts
vim.api.nvim_create_autocmd("VimEnter", { callback = open_neotree_on_boot })

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    keys = {
        { "<C-e>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        require("neo-tree").setup({
            -- Your NeoTree configuration options go here
            -- window = {
            --     position = "right",
            -- },
            filesystem = {
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
            },
            source_selector = {
                winbar = true,
                sources = {
                    {
                        source = "filesystem",
                        display_name = " 󰉓 Files ",
                    },
                    {
                        source = "buffers",
                        display_name = " 󰈚 Buffers ",
                    },
                    {
                        source = "git_status",
                        display_name = " 󰊢 Git ",
                    },
                    {
                        source = "document_symbols",
                        display_name = " ⧉ Symbols ",
                    },
                },
            },
            sources = {
                "filesystem",
                "buffers",
                "git_status",
                "document_symbols",
            },
        })
    end,
}
