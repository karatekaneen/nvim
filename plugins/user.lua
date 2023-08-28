return {
  "AstroNvim/astrocommunity",
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- { import = "astrocommunity.packs.go" },
  { import = "astrocommunity.colorscheme.gruvbox-nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function() require("go").setup() end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  },
  {
    "folke/todo-comments.nvim",
    event = { "CmdlineEnter", "BufRead" },
    dependencies = "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>fg", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup {} end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      -- vim.opt.termguicolors = true
      vim.cmd [[highlight IndentBlanklineIndent1 guifg=#220022 gui=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1e1e2e gui=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#28283e  gui=nocombine]]
      vim.opt.list = true
      vim.opt.listchars:append "space: "
      -- vim.opt.listchars:append "tab:x"
      require("indent_blankline").setup {
        space_char_blankline = " ",
        -- char = ".",
        show_current_context = true,
        show_current_context_start = true, -- char = "",
        -- space_char_blankline = " ",
        char_highlight_list = {
          "IndentBlanklineIndent1",
          --   "IndentBlanklineIndent2",
        },
        -- space_char_highlight_list = {
        --   "IndentBlanklineIndent1",
        --   "IndentBlanklineIndent2",
        -- },
        show_trailing_blankline_indent = false,
      }
    end,
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    -- name = "ts-rainbow",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
    -- dependencies = {
    --   "ts-rainbow"
    -- },
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          -- list of languages you want to disable the plugin for
          disable = { "jsx", "cpp" },
          -- Which query to use for finding delimiters
          query = "rainbow-parens",
          -- Highlight the entire buffer all at once
          strategy = require("ts-rainbow").strategy.global,
        },
      }
    end,
  },
}
