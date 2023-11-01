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
    main = "ibl",
    config = function()
      -- vim.opt.termguicolors = true
      -- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#220022 gui=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1e1e2e gui=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#28283e  gui=nocombine]]
      -- vim.opt.list = true
      -- vim.opt.listchars:append "space: "
      -- vim.opt.listchars:append "tab:x"
      require("ibl").setup {
        indent = {
          tab_char = "┊",
          char = "┊",
        },
      }
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufEnter",
  },
  {
    "andythigpen/nvim-coverage",
    ft = "go",
    config = function()
      local coverage = require "coverage"
      coverage.setup {
        auto_reload = true,
        highlights = {
          -- customize highlight groups created by the plugin
          covered = { fg = "DarkGray" }, -- supports style, fg, bg, sp (see :h highlight-gui)
          uncovered = { fg = "DarkRed" },
        },
        signs = {
          -- use your own highlight groups or text markers
          covered = { hl = "CoverageCovered", text = "" },
          uncovered = { hl = "CoverageUncovered", text = "▍" },
        },
      }

      coverage.load(true)
    end,
  },
}
