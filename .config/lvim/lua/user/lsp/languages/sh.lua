local M = {}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "shellcheck", extra_args = { "--severity", "warning" } },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "shfmt", filetypes = { "sh", "bash" } },
}

M.ensure_installed = {
  "bash-language-server",
  "shellcheck",
  "shfmt",
}

return M
