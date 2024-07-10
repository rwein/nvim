function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    -- Exit terminal mode with c-space or esc
    vim.keymap.set("t", "<C-Space>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    -- Allow movement as expected in terminal
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            open_mapping = "<C-t>",
            direction = "vertical",
            size = 60,
        })

        -- Send the current line to the terminal under the cursor
        vim.keymap.set("n", "<leader>ts", ":ToggleTermSendCurrentLine<CR>", {})
        -- Send the current lines under visual selection
        vim.keymap.set("v", "<leader>tsl", ":ToggleTermSendVisualLines<CR>", {})
        -- Send just the characters highlighted
        vim.keymap.set("v", "<leader>tsv", ":ToggleTermSendVisualSelection<CR>", {})

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
    end,
}
