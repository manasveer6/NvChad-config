local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "emmet_language_server", "html", "cssls", "pylsp", "tsserver", "bashls" }

local filetypes_by_servers = {
  emmet_language_server = {
    "html",
    "htmx",
  },
  html = {
    "html",
    "htmx",
  },
  cssls = {
    "css",
    "scss",
  },
  tsserver = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
  clangd = {
    "c",
    "cpp",
  },
  pylsp = {
    "python",
  },
  bashls = {
    "sh",
    "zsh",
  },
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = filetypes_by_servers[lsp],
  }
end

local cmp_nvim_lsp = require "cmp_nvim_lsp"
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
  filetypes = {
    "c",
    "cpp",
  },
}

-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

-- Without the loop, you would have to manually set up each LSP
--
-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"html", "htmx"}
-- }
--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"css", "scss"}
-- }
