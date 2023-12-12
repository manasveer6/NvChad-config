local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "python-lsp-server",
        "isort",
        "black",
        "prettier",
        "emmet-language-server"
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "custom.configs.treesitter"
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    'stevearc/conform.nvim',
    -- opts = {},
    config = function()
      require "custom.configs.formatting"
    end,
    event = { "BufReadPre", "BufNewFile" }
  },
  {
    "L3MON4D3/LuaSnip",
    opts = function ()
      return require "custom.configs.luasnip"
    end,
    config = function(_, opts)
      require("luasnip").setup(opts)
    end
  },
  {
    'ThePrimeagen/vim-be-good',
    lazy = false
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "json",
        -- "vue", "svelte",

       -- low level
        "c",
        "cpp",
        "zig",

        -- other
        "python",
        "java"
      },
    },
  },
-- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",
    config = function()
       require "plugins.configs.lspconfig"
       require "custom.configs.lspconfig"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    lazy = false
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = function()
      require "custom.configs.toggleterm"
    end,
    lazy = false
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require "custom.configs.mini"
    end,
    lazy = false
  },
}

return plugins
