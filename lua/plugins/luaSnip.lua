-- ~/.config/nvim/lua/plugins/snippets_custom.lua

return {
    {
        "rafamadriz/friendly-snippets",
        config = function()
        -- Load all default snippets from friendly-snippets first
        require("luasnip.loaders.from_vscode").lazy_load()

        -- 2. Load your CUSTOM VS Code snippets (optional, if you have any JSON files)
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/vscode-snippets" },
        })

        -- Load your CUSTOM snippets from ~/.config/nvim/snippets
        -- The path is relative to vim.fn.stdpath("config"), which is ~/.config/nvim
        require("luasnip.loaders.from_snipmate").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
        })
        end,
    },
}
