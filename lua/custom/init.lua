-- Set relative numbers on
vim.opt.relativenumber = true

-- To move lines up or down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'")

--Centers the cursor when moving up or down the page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

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
