return{
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "lua", "vim", "vimdoc", "html", "css", "javascript", "json", "typescript" },
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
        },
        config = function(_, opt)
            require("nvim-treesitter.configs").setup(opts)
        end,
    }
}
