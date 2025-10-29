return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",  -- Manages language servers
            "williamboman/mason-lspconfig.nvim", -- Bridges mason and lspconfig
        },
        config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            -- Automatically install these language servers
            ensure_installed = { "lua_ls", "jsonls", "html", "cssls", "vtsls" },
        })

        -- Global LSP keymaps
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP Go to Definition' })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover Documentation' })

        -- IMPORTANT: You will need to setup individual LSPs here later, e.g.:
        -- require("lspconfig").lua_ls.setup {}
        -- use vim.lsp.config instead
        --require("lspconfig").vtsls.setup({
        --	capabilities = cmp_nvim_lsp.default_capabilities()
        --})
        end,
    },
}
