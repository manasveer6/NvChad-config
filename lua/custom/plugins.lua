local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "clangd",
        "python-lsp-server",
        "isort",
        "black",
        "prettier",
        "emmet-language-server",
        "css-lsp",
        "typescript-language-server",
        "bash-language-server",
      },
    },
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
        "java",
      },
      autotag = {
        enable = true,
        filetypes = { "html", "htmx", "javascript", "tsx" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    -- opts = {},
    config = function()
      require "custom.configs.formatting"
    end,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "L3MON4D3/LuaSnip",
    opts = function()
      return require "custom.configs.luasnip"
    end,
    config = function(_, opts)
      require("luasnip").setup(opts)
    end,
  },
  {
    "ThePrimeagen/vim-be-good",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = function()
      require "custom.configs.toggleterm"
    end,
    lazy = false,
  },
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require "custom.configs.mini"
    end,
    lazy = false,
  },
  -- Fun plugin to waste time. Makes code rain or bubble
  {
    "eandrju/cellular-automaton.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
  -- Better code folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require "custom.configs.nvim-ufo"
    end,
    event = "BufReadPre",
  },
  -- Smooth scrolling/movements
  {
    "declancm/cinnamon.nvim",
    config = function()
      require("cinnamon").setup {
        extra_keymaps = true,
        override_keymaps = true,
        scroll_limit = 75,
      }
    end,
    event = "BufReadPost",
  },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        dotfiles = true,
      },
      git = {
        enable = true,
      },
      renderer = {
        icons = {
          show = {
            git = true,
          },
        },
      },
      view = {
        centralize_selection = true,
      },
      diagnostics = {
        enable = true,
      },
    },
  },
}

return plugins
