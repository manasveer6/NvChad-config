-- vim.g.vscode_snippets_path = "~/Library/Application Support/Code/User/snippets/"

vim.opt.relativenumber = true
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv'")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv'")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.opt.scrolloff = 8

vim.opt.colorcolumn = "80"
-- vim.keymap.set("n", "]d", function()
--   vim.diagnostic.goto_next()
-- end)

vim.keymap.set("n", "gd", function()
  vim.lsp.buf.definition()
end)
vim.keymap.set("n", "H", function()
  vim.lsp.buf.hover()
end)

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  require("conform").format {
    async = false,
    timeout_ms = 500,
    lsp_fallback = true,
  }
end, { desc = "Format file or range (in visual mode)" })
