return{
    -- 🌳 File Explorer: Neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- Required for icons
            "MunifTanjim/nui.nvim",
        },
        opts = {
            window = {
                position = "left",
                width = 30,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true, -- Show dotfiles
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
            },
        },
        keys = {
            -- Keymap to toggle Neo-tree
            {"<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree"},
        }
    },
}
