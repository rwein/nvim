-- Tree File Explorer
-- https://github.com/nvim-tree/nvim-tree.lua:w

-- Customize nvim-tree key bindings
local function customize_nvim_tree_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Import default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- Override with custom mappings
    -- When we're inside of nvim tree, we still want C-e to toggle
    vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", opts("Toggle"))

    -- Ensure we can toggle the terminal from nvim tree.
    vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>", opts("Terminal"))
end

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
                update_root = true,
            },
        })

        -- Open nvim-tree automatically on vim startup
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                -- Only open nvim-tree if no files were specified on command line
                if #vim.fn.argv() == 0 then
                    require("nvim-tree.api").tree.open()
                    -- https://github.com/romgrk/barbar.nvim/issues/421#issuecomment-1502473406
                    vim.api.nvim_exec_autocmds("BufWinEnter", { buffer = vim.fn.bufnr("#") })
                end
            end,
        })

        -- Open nvim tree with C-e
        vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

        -- Allow opening Telescope from within nvim tree so we don't need to switch back to the file buffer to use.
        -- There's probably a better way of doing this without copying these over from nvim-telescope.lua but for now,
        -- this is okay with me.
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", function()
            builtin.buffers({ sort_mru = true, ignore_current_buffer = true })
        end, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>fs", require("session-lens").search_session, {})
        vim.keymap.set("n", "<leader>fp", require("telescope").extensions.project.project, {})
    end,
}
