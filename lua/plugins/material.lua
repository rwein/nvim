-- Material Theme
-- https://github.com/marko-cerovac/material.nvim
return {
    "marko-cerovac/material.nvim",
    config = function()
        -- Setup Material theme
        require("material").setup({
            styles = {
                comments = { italic = true },
            },
        })

        -- Load material theme
        vim.cmd("colorscheme material")
    end,
}
