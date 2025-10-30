-- ~/.config/nvim/lua/plugins/snipmate_loader.lua

return {
    -- This targets the friendly-snippets plugin's configuration
    -- as it is a dependency of LuaSnip and often the best place to add loaders.
    {
        "rafamadriz/friendly-snippets",
        config = function()
        local config_path = vim.fn.stdpath("config")
        local snipmate_path = config_path .. "/snippets"

        -- Load default VS Code snippets (keeps friendly-snippets working)
        require("luasnip.loaders.from_vscode").lazy_load()

        -- Load CUSTOM SnipMate snippets
        require("luasnip.loaders.from_snipmate").lazy_load({
            paths = { snipmate_path },
        })

        -- Optional: Load CUSTOM VS Code snippets if you still have them
        require("luasnip.loaders.from_vscode").lazy_load({
            paths = { config_path .. "/snippets" },
        })
        end,
    },
}
