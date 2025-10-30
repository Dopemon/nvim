return{
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                vtsls = {
                    keys = {
                        { "<leader>co", function()
                            vim.lsp.buf.code_action({
                                apply = true,
                                context = {
                                    only = { "source.addMissingImports.ts" },
                                    diagnostics = {},
                                },
                            })
                            end, desc = "Add Missing Imports"
                        },
                        { "<leader>ci", function()
                            vim.lsp.buf.code_action({
                                apply = true,
                                context = {
                                    only = { "source.addMissingImports.ts" },
                                    diagnostics = {},
                                },
                            })
                            end, desc = "Favorites"
                        },
                    },
                },
            },
        },
    }
}
