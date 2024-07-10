local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "clangd",
        "clang-format",
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
      auto_install = true,
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = {
          "html",
          "javascript",
          "jsx",
          "javascriptreact",
          "typescript",
          "tsx",
          "typescriptreact",
        },
      },
    },
  },
  -- {
  --   "stevearc/conform.nvim",
  --   -- opts = {},
  --   config = function()
  --     require "custom.configs.formatting"
  --   end,
  --   event = { "BufReadPre", "BufNewFile" },
  -- },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require "custom.configs.none-ls"
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
    opts = {
      servers = {
        tailwindcss = {},
      },
    },
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
        -- keymaps = {
        --   extra = true,
        -- },
        -- options = {
        --   max_delta = {
        --     line = 75,
        --   },
        -- },
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
          glyphs = {
            git = {
              unstaged = "M",
              staged = "M",
              renamed = "R",
              untracked = "U",
            },
          },
          git_placement = "after",
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
  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup {
        integrations = {
          tmux = true,
        },
      }
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "rmagatti/auto-session",
    config = function()
      require "custom.configs.auto-session"
    end,
    lazy = false,
  },
  -- tailwind-tools.lua
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    opts = {}, -- your configuration
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
      -- opts.formatting = {
      --   format = require("tailwindcss-colorizer-cmp").formatter,
      -- }
    end,
  },
}

return plugins
