require("mini.animate").setup {
  scroll = {
    enable = false,
  },
  cursor = {
    enable = false,
  },
  -- resize = {
  --   enable = true
  -- },
  -- open = {
  --   enable = false
  -- },
  -- close = {
  --   enable = false
  -- }
}

require("mini.indentscope").setup {
  event = { "BufReadPre", "BufNewFile" },
  symbol = "│",
  draw = {
    animation = require("mini.indentscope").gen_animation.none(),
  },
}

vim.api.nvim_create_autocmd({ "FileType" }, {
  desc = "Disable indentscope for certain filetypes",
  callback = function()
    local ignore_filetypes = {
      "help",
      "lazy",
      "NvimTree",
      "neogitstatus",
      "toggleterm",
      "nvdash",
    }
    if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
      vim.b.miniindentscope_disable = true
    end
  end,
})

require("mini.indentscope").gen_animation.none()
