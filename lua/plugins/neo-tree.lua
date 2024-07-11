-- If no file has been selected, open up Neotree on startup
local function open_neotree_on_boot()
    -- Only open nvim-tree if no files were specified on command line
    if vim.fn.argc() == 0 then
        require("neo-tree").setup()
        vim.api.nvim_command("Neotree")
        -- https://github.com/romgrk/barbar.nvim/issues/421#issuecomment-1502473406
        vim.api.nvim_exec_autocmds("BufWinEnter", { buffer = vim.fn.bufnr("#") })
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
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
}
