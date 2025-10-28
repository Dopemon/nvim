return {
  -- 🚦 Status Line: lualine
  {
    "nvim-lualine/lualine.nvim",
    lazy = false, -- Load immediately
    opts = {
      options = {
        theme = "auto", -- Use the colorscheme's theme
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
      },
    },
  },

  -- 💬 Comments: Comment.nvim
  {
    "numToStr/Comment.nvim",
    opts = {
      -- defaults
      toggler = {
        line = "<leader>cc", -- toggle line comment
        block = "<leader>cb", -- toggle block comment
      },
    },
  },
}
