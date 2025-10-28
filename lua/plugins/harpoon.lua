-- ~/.config/nvim/lua/plugins/harpoon.lua

return {
    {
        -- 🎣 Harpoon Plugin Definition
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },

        -- Configuration runs after the plugin is loaded
        config = function()
            local harpoon = require("harpoon")

            -- ⚙️ Setup (Required by Harpoon)
            harpoon.setup({})

            -- 🔑 Keymaps
            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add file to list" })
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Toggle menu" })

            -- Mappings for navigating the first 4 files
            vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon: Go to file 1" })
            vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "Harpoon: Go to file 2" })
            vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "Harpoon: Go to file 3" })
            vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "Harpoon: Go to file 4" })

            --require("telescope").load_extension('harpoon')

            --vim.keymap.set("n", "<leader>e", function() 
	    --	require("telescope.builtin").extensions.harpoon.marks() 
	    --end, { desc = "Telescope Harpoon Marks" })		
            
        end,
    },
}
