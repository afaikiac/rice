-- lvim.colorscheme = "gruvbox"
-- vim.o.background = "light"
lvim.log.level = "INFO"
-- lvim.log.level = "WARN"
lvim.leader = " " -- view all the defaults by pressing <leader>Lk
lvim.reload_config_on_save = false
lvim.format_on_save = false

--- plugins activation
-- lvim.builtin.autopairs.active = false
lvim.builtin.alpha.active = true
lvim.builtin.breadcrumbs.active = true
lvim.builtin.bufferline.active = false
lvim.builtin.illuminate.active = false
lvim.builtin.indentlines.active = false
lvim.builtin.terminal.active = true
-- lvim.builtin.dap.active = true
-- my plugins
lvim.builtin.time_based_themes = false
lvim.builtin.persistence = { active = false }

--- spellchecker
-- $ mkdir -p ~/.config/lvim/spell
vim.opt.spell = false
vim.opt.spelllang = { "en_us", "ru_yo" }
vim.g["spellfile_URL"] = "https://ftp.nluug.nl/vim/runtime/spell"

-- https://github.com/nvim-tree/nvim-tree.lua#quick-start
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25

-- disable providers warning
vim.g.loaded_python3_provider = 0
-- vim.g.python3_host_prog="/home/dl2718/.local/share/virtualenvs/nvim/bin/python"
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

local options = {
  -- see https://www.lunarvim.org/configuration/01-settings.html#example-options
  backup         = false, -- creates a backup file
  clipboard      = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight      = 1, -- more space in the neovim command line for displaying messages
  completeopt    = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel   = 0, -- so that `` is visible in markdown files
  fileencoding   = "utf-8", -- the encoding written to a file
  hlsearch       = true, -- highlight all matches on previous search pattern
  ignorecase     = true, -- ignore case in search patterns
  mouse          = "a", -- allow the mouse to be used in neovim
  pumheight      = 10, -- pop up menu height
  showmode       = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline    = 0, -- always show tabs
  smartcase      = true, -- smart case
  smartindent    = true, -- make indenting smarter again
  splitbelow     = true, -- force all horizontal splits to go below current window
  splitright     = true, -- force all vertical splits to go to the right of current window
  swapfile       = false, -- creates a swapfile
  termguicolors  = true, -- set term gui colors (most terminals support this)
  timeoutlen     = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  -- ttymouse    = "srg", -- https://github.com/alacritty/alacritty/issues/803
  undofile       = true, -- enable persistent undo
  -- updatetime  = 100, -- faster completion (4000ms default) https://github.com/neovim/neovim/issues/21329
  writebackup    = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab      = true, -- convert tabs to spaces
  shiftwidth     = 2, -- the number of spaces inserted for each indentation
  tabstop        = 2, -- insert 2 spaces for a tab
  cursorline     = true, -- highlight the current line
  number         = true, -- set numbered lines
  laststatus     = 3,
  showcmd        = false,
  ruler          = false,
  relativenumber = true, -- set relative numbered lines
  numberwidth    = 4, -- set number column width to 2 {default 4}
  signcolumn     = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap           = false, -- display lines as one long line
  scrolloff      = 8,
  sidescrolloff  = 8,
  guifont        = { "JetBrainsMono Nerd Font", ":h14" },
  title          = false, -- https://github.com/LunarVim/LunarVim/issues/3481

  -- colorcolumn = "80",
  -- colorcolumn = "120",
  -- formatoptions = {
  --   ["1"] = true,
  --   ["2"] = true, -- Use indent from 2nd line of a paragraph
  --   q = true, -- continue comments with gq"
  --   c = true, -- Auto-wrap comments using textwidth
  --   r = true, -- Continue comments when pressing Enter
  --   n = true, -- Recognize numbered lists
  --   t = true, -- autowrap lines using text width value
  --   j = true, -- remove a comment leader when joining lines.
  --   -- Only break if the line was not longer than 'textwidth' when the insert
  --   -- started and only at a white character that has been entered during the
  --   -- current insert command.
  --   l = true,
  --   v = true,
  -- },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
