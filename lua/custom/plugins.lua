local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "python-lsp-server"
      }
    }
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
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = function ()
      require "custom.configs.toggleterm"
    end,
    lazy = false
  },
}

return plugins
