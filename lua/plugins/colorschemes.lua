return{
    -- 🖼️ Colorscheme: TokyoNight
--     {
--         "folke/tokyonight.nvim",
--         lazy = false, -- Load immediately
--         priority = 1000, -- Load early
--         config = function()
--             vim.cmd.colorscheme("tokyonight-night")
--         end,
--     },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("kanagawa-dragon")
        end,
        theme = "dragon",
        background = {
            dark="dragon",
            light="lotus"
        }
    },
}
