
-- Some parsers get bundled with Neovim and can cause conflicts with treesitter. You may need to force install a
-- specific parser for tresitter to pick it up. e.g. see what parse is the issue with `:checkhealth treesitter` and
-- then reinstall with `:TSInstall! <lang>`
--
-- For more info, see: https://github.com/nvim-treesitter/nvim-treesitter/issues/3092
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
}
