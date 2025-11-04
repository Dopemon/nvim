return{
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                tsserver = { enabled = false },
                ts_ls = { enabled = false },
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
                                    only = { "source.addMissingImports.ts", "source.removeUnused.ts", "source.fixAll.ts", "typescript.restartTsServer"
                                    },
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
