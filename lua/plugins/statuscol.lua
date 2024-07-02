
return {
    "luukvbaal/statuscol.nvim",
    config = function()
        require("statuscol").setup({
            -- Right align line numbers
            relculright = true,
        })
    end
}
