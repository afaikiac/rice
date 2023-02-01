local M = {}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d", filetypes = { "javascript", "typescript", "typescriptreact" } },
}

M.ensure_installed = {
  "typescript-language-server",
  "eslint_d",
}

return M
