local M = {}

-- require'lspconfig'.clangd.setup{
--   filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
-- }

local function setup_clang()
  -- https://github.com/LunarVim/LunarVim/issues/2597#issuecomment-1254764973
  ---@diagnostic disable-next-line: missing-parameter
  vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

  local flags = {
    "--fallback-style=google",
    "--background-index",
    "-j=12",
    "--all-scopes-completion",
    "--pch-storage=disk",
    "--clang-tidy",
    "--log=error",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--header-insertion-decorators",
    "--enable-config",
    "--offset-encoding=utf-16",
    "--ranking-model=heuristics",
    "--folding-ranges",
  }
  local bin = "clangd"
  local opts = {
    cmd = { bin, unpack(flags) },
  }
  require("lvim.lsp.manager").setup("clangd", opts)
end

local function setup_nvim()
  vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {
      "*.c", "*.h",
      "*.cpp", "*.hpp",
      "*.cc",
    },
    command = "setlocal ts=2 sw=2",
  })
end

local function setup_null_ls()
  local filetypes = { "cpp", "cc", "c" }
  local linters = require "lvim.lsp.null-ls.linters"
  linters.setup {
    { command = "cpplint", filetypes = filetypes },
  }
  local formatters = require "lvim.lsp.null-ls.formatters"
  formatters.setup {
    { command = "clang-format", filetypes = filetypes },
  }
end

setup_clang()
setup_nvim()
setup_null_ls()

M.ensure_installed = {
  "clangd",
  "cpplint",
  "clang-format",
}

return M
