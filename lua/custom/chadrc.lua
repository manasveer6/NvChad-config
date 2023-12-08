---@class ChadrcConfig
local M = {}

M.ui = {
  theme = 'doomchad',
  nvdash = {
    load_on_startup = true,
    buttons = {}
  },
  statusline = {
    theme = "minimal",
    separator_style = "round"
  },
}

M.plugins = 'custom.plugins'

return M
