local M = {}

require "user.lsp.languages.c_cpp"
require "user.lsp.languages.js_ts"
require "user.lsp.languages.markdown"
require "user.lsp.languages.python"
require "user.lsp.languages.sh"
require "user.lsp.languages.tex"

lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.diagnostics.float.focusable = true

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "codespell", },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
}

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "markdown",
  "latex",
  "markdown_inline",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }

-- lvim.lsp.installer.setup.ensure_installed = {
--   "sumneko_lua",
--   "jsonls",
-- }

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
