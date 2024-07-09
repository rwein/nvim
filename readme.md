# My Neovim Setup

To use, install this at ~/.config/nvim

# Use

## Formatting code

To reformat all code in the configuration, run `stylua init.lua lua/` (requires stylua, `brew install stylua`).

https://github.com/stevearc/conform.nvim will automatically reformat saved code if a formatter is set up. See
`lua/config/plugins/conform.lua`
