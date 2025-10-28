return {
  -- 🧠 Syntax Highlighting & Parsing: nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua", "vim", "vimdoc", "html", "css", "javascript", "json" },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      -- The config function runs on startup
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- 🗣️ Language Server Protocol: nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",        -- Manages language servers
      "williamboman/mason-lspconfig.nvim", -- Bridges mason and lspconfig
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        -- Automatically install these language servers
        ensure_installed = { "lua_ls", "jsonls","html", "cssls",  "vtsls" },
      })

      -- Global LSP keymaps
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP Go to Definition' })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Hover Documentation' })

      -- IMPORTANT: You will need to setup individual LSPs here later, e.g.:
      -- require("lspconfig").lua_ls.setup {}
    end
  },

  -- ⌨️ Auto Completion: nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source
      "hrsh7th/cmp-buffer",   -- Buffer text source
      "L3MON4D3/LuaSnip",     -- Snippet engine
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
			        vim.notify("SELECTED", vim.log.levels.info, {title="selected"})
			elseif luasnip.expand_or_jumpable() then
			    luasnip.expand_or_jump()
                            vim.notify("JUMPED", vim.log.levels.info, {title="jumped"})
			else
			    fallback()
			    vim.notify("fallback", vim.log.levels.info, {title="fallback"})
			end
		    end, {'i', 's'}),
	  ['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
			    luasnip.jump(-1)
			else
			    fallback()
			end
		    end, {'i', 's'}),
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
