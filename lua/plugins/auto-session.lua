-- Provides persistent sessions per cwd
-- https://github.com/rmagatti/auto-session
return {
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
                post_restore_cmds = { "NvimTreeOpen" },
            })
        end,
    },
}
