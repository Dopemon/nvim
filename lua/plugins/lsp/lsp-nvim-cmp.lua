return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP source
            "hrsh7th/cmp-buffer", -- Buffer text source
            "L3MON4D3/LuaSnip", -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- Snippet source
            "onsails/lspkind.nvim", -- Add icons to completion menu
        },
        config = function()
        local cmp = require('cmp')

        local luasnip = require('luasnip')
        require("luasnip.loaders.from_snipmate").lazy_load({ paths = "~/.config/nvim/snippets" })

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept selected item
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                        vim.notify("SELECTED", vim.log.levels.info, { title = "selected" })
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                            vim.notify("JUMPED", vim.log.levels.info, { title = "jumped" })
                            else
                                fallback()
                                vim.notify("fallback", vim.log.levels.info, { title = "fallback" })
                            end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                            else
                                fallback()
                            end
                end, { 'i', 's' }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
            }),
            snippet = {
                expand = function(args)
                require('luasnip').lsp_expand(args.body)
                end,
            },
        })
        end
    },
}
