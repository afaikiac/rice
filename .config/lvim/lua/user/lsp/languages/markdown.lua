local M = {}

require("lvim.lsp.manager").setup("marksman")

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "markdownlint", filetypes = { "markdown" } },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "markdownlint", filetypes = { "markdown" } },
}

M.ensure_installed = {
  "marksman",
  "markdownlint",
}

return M
