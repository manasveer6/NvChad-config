require("toggleterm").setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 20
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    else
      return 20
    end
  end,
  open_mapping = [[<c-\>]],
  direction = "float",
  close_on_exit = true,
  -- persist_mode = true,
  float_opts = {
    border = "curved",
    winblend = 0,
    -- highlights = {
    --   border = "Normal",
    --   background = "Normal"
    -- }
  },
  shade_terminals = true,
  winbar = {
    enabled = false,
    name_formatter = function(term)
      return term.name
    end,
  },
}
