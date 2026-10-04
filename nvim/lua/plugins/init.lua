return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "clangd",
          "pyright",
          "rust_analyzer",
          "ts_ls",
          "lua_ls",
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      require("configs.lspconfig").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("configs.cmp").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      "williamboman/mason.nvim",
    },
    config = function()
      require("configs.dap").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      -- lualine has no built-in "nvchad" theme; auto uses NvChad's active colors.
      options = { theme = "auto", globalstatus = true },
      sections = {
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "lsp_status" },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate | TSInstallAll",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "python",
        "rust",
        "javascript",
        "typescript",
        "lua",
        "vim",
        "vimdoc",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view = { side = "left", width = 32 },
      renderer = { group_empty = true },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    opts = {
      size = 15,
      open_mapping = [[<c-\>]],
      direction = "horizontal",
      close_on_exit = false,
      shade_terminals = false,
    },
  },
}
