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
    -- event = { "BufReadPre", "BufNewFile" },
    lazy = false,
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
    opts = function()
      require("cinnamon").setup {
        extra_keymaps = true,
        override_keymaps = true,
        scroll_limit = 75,
        keymaps = {
          extra = true,
        },
        options = {
          max_delta = {
            line = 75,
          },
        },
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
          diagnostics_placement = "after",
        },
      },
      view = {
        centralize_selection = true,
        side = "right",
        width = "20%",
        -- float = {
        --   enable = true,
        -- },
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
  {
    "AndrewRadev/switch.vim",
    config = function()
      vim.g.switch_custom_definitions = {
        { "true", "false" },
        { "yes", "no" },
        { "on", "off" },
        { "1", "0" },
        { "const", "let", "var" },
      }
      vim.api.nvim_set_keymap("n", "<leader>s", ":Switch<CR>", { noremap = true, silent = true })
    end,
    event = { "BufReadPre", "BufNewFile" },
  },
  -- {
  --   "monaqa/dial.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  -- },
  {
    "3rd/image.nvim",
    config = function()
      require("image").setup()
      -- require "custom.configs.image"
    end,
    -- event = { "BufReadPre", "BufNewFile" },
    lazy = false,
  },
  {
    dir = vim.fn.stdpath "config" .. "/lua/custom/motiquote", -- Use the absolute path to the plugin
    lazy = false, -- Load on startup
    config = function()
      local motiquote = require "custom.motiquote" -- Load the plugin module

      -- Create a user command to show a motivational quote
      vim.api.nvim_create_user_command("MotiQuote", function()
        motiquote.show_quote()
      end, {})

      -- Add a keybinding to show a motivational quote
      vim.keymap.set("n", "<leader>mq", motiquote.show_quote, { desc = "Show a motivational quote" })
    end,
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Leet",
    opts = {
      -- configuration goes here
    },
  },
  {
    "manasveer6/scratchpad.nvim",
    config = function()
      require("scratchpad").setup()
    end,
    lazy = false,
  },
}

return plugins
