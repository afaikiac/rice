local M = {}

require "user.lsp.languages.c_cpp"
require "user.lsp.languages.js_ts"
require "user.lsp.languages.markdown"
require "user.lsp.languages.python"
require "user.lsp.languages.sh"
require "user.lsp.languages.tex"

vim.diagnostic.config({
  virtual_text = false,
})

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "codespell", },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
}

M.ensure_installed = require("user.utils").concat(
  {
    "codespell",
    "lua-language-server",
    "stylua",
    "json-lsp",
  },
  require "user.lsp.languages.c_cpp".ensure_installed,
  require "user.lsp.languages.js_ts".ensure_installed,
  require "user.lsp.languages.markdown".ensure_installed,
  require "user.lsp.languages.python".ensure_installed,
  require "user.lsp.languages.sh".ensure_installed,
  require "user.lsp.languages.tex".ensure_installed
)

return M
