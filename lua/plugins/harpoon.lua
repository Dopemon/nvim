-- ~/.config/nvim/lua/plugins/harpoon.lua
return {
    {
        -- 🎣 Harpoon Plugin Definition
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },

        -- Configuration runs after the plugin is loaded
        config = function()
            -- Define local harpoon variable for cleaner keymaps
            local harpoon = require("harpoon")
            local harpoon_ui = require("harpoon.ui")

            harpoon.setup({})

            -- Use vim.keymap.set for critical keymaps to ensure precedence and non-recursion

            -- Add and show Menu
            -- Note the 'n' mode and the 'noremap = true' (default in vim.keymap.set)
            vim.keymap.set("n", "<leader>hh", function()
                harpoon:list():add()
            end, { desc = "Harpoon: Add file to list" })

            vim.keymap.set("n", "<leader>he", function()
                harpoon_ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Harpoon: Toggle menu" })

            -- Navigation - This also overrides the default C-w movement maps
            vim.keymap.set("n", "<leader>ha", function() harpoon:list():select(1) end, { desc = "Harpoon: Go to file 1" })
            vim.keymap.set("n", "<leader>hs", function() harpoon:list():select(2) end, { desc = "Harpoon: Go to file 2" })
            vim.keymap.set("n", "<leader>hd", function() harpoon:list():select(3) end, { desc = "Harpoon: Go to file 3" })
            vim.keymap.set("n", "<leader>hf", function() harpoon:list():select(4) end, { desc = "Harpoon: Go to file 4" })
        end,
    },
}
