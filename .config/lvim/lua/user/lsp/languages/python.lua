
-- local root_files = {
--   "pyproject.toml",
--   "setup.py",
--   "setup.cfg",
--   "requirements.txt",
--   "Pipfile",
--   "manage.py",
--   "pyrightconfig.json",
--   ".git",
--   ".gitignore",
--   'pyproject.toml',
--   'setup.py',
--   'setup.cfg',
--   'requirements.txt',
--   'Pipfile',
--   'pyrightconfig.json',
-- }

-- local opts = {
--   root_dir = require("lspconfig.util").root_pattern(unpack(root_files)),
--   single_file_support = true,
--   filetypes = { "python" },
--   cmd = { "pyright-langserver", "--stdio" },
--   settings = {
--     pyright = {
--       disableOrganizeImports = false,
--       disableLanguageServices = false,
--     },
--     python = {
--       venvPath = "$HOME/.env",
--       pythonPath = "$HOME/.env/bin/python3",
--       analysis = {
--         logLevel = "Information",
--         stubPath = "$HOME/Documents/typings",
--         extraPaths = {},
--         typeshedPaths = {},
--         diagnosticMode = "workspace",
--         autoSearchPaths = true,
--         typeCheckingMode = "off",
--         autoImportCompletions = true,
--         useLibraryCodeForTypes = true,
--         diagnosticSeverityOverrides = {},
--       }
--     },
--   }
-- }
-- local opts = {
--   cmd = { "pyright-langserver", "--stdio" },
--   filetypes = { 'python' },
--   root_dir = require("lspconfig.util").root_pattern(unpack(root_files)),
--   single_file_support = true,
--   settings = {
--     pyright = {
--       disableOrganizeImports = false,
--       disableLanguageServices = false,
--     },
--     python = {
--       analysis = {
--         autoSearchPaths = true,
--         useLibraryCodeForTypes = true,
--         diagnosticMode = 'workspace',
--       },
--     },
--   },
-- }
-- local opts = {
--   root_dir = function(fname)
--     return require("lspconfig.util").root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
--       require("lspconfig.util").path.dirname(fname)
--   end
-- }

-- require("lvim.lsp.manager").setup("pyright", opts)

-- require("lspconfig").pyright.setup({})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })

require("lvim.lsp.manager").setup("pyright")

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "pyproject_flake8", filetypes = { "python" } },
})

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black", filetypes = { "python" } },
	{ command = "isort", filetypes = { "python" } },
})

local M = {}

M.ensure_installed = {
	"pyright",
	"pyproject-flake8",
	"black",
	"isort",
}

return M
