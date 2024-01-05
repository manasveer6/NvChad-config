if vim.g.neovide then
  vim.opt.guifont = { "JetBrainsMono NF", ":h13" }
  vim.g.neovide_cursor_animation_length = 0.03
end
-- Set relative numbers on
vim.opt.relativenumber = true

-- To move lines up or down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'<CR>:mark '><CR>")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'<CR>:mark '><CR>")

--Centers the cursor when moving up or down the page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "[m", "[mzz")
vim.keymap.set("n", "]m", "]mzz")

-- Ensures a minimum of 8 lines of padding when scrolling
vim.opt.scrolloff = 8

-- Column indicator at 80 chars width
vim.opt.colorcolumn = "80"

-- Go to definition of identifier under the cursor
vim.keymap.set("n", "gd", function()
  vim.lsp.buf.definition()
end)

-- Get LSP hover info
vim.keymap.set("n", "H", function()
  vim.lsp.buf.hover()
end)

-- Format buffer using conform
vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  require("conform").format {
    async = false,
    timeout_ms = 500,
    lsp_fallback = true,
  }
end, { desc = "Format file or range (in visual mode)" })

-- Makes the code rain lol
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader>mm", "<cmd>TSJToggle<CR>", { desc = "Toggle Treesitter Join" })

vim.api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
vim.api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["typescript"] = true,
  ["lua"] = true,
  ["rust"] = true,
  -- ["c"] = true,
  ["c#"] = true,
  ["c++"] = true,
  ["go"] = true,
  ["python"] = false,
}

vim.g.copilot_assume_mapped = true

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "c",
--   command = "setlocal shiftwidth=4 tabstop=4",
-- })
