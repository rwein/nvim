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
            direction = "horizontal",
            size = 20,
        })

        -- Open Terminals
        vim.keymap.set("n", "<leader>t1", ":1ToggleTerm<CR>", {})
        vim.keymap.set("n", "<leader>t2", ":2ToggleTerm<CR>", {})
        vim.keymap.set("n", "<leader>t3", ":3ToggleTerm<CR>", {})

        -- Rerun the last command
        vim.keymap.set("n", "<leader>tr", function()
            -- Get the first active terminal
            local terminal = require("toggleterm.terminal").get(1)

            if terminal then
                terminal:send("!!")
            else
                print("No active terminal found")
            end
        end, {})

        -- Send the current line to the terminal under the cursor
        vim.keymap.set("n", "<leader>ts", ":ToggleTermSendCurrentLine<CR>", {})
        -- Send the current lines under visual selection
        vim.keymap.set("v", "<leader>ts", ":ToggleTermSendVisualLines<CR>", {})
        -- Send just the characters highlighted
        vim.keymap.set("v", "<leader>tsv", ":ToggleTermSendVisualSelection<CR>", {})

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
    end,
}
