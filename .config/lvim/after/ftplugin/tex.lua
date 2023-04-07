local options = {
  smartindent = true,
  expandtab = true,
  autoindent = true,

  spell = true,
  wrap = true,
  -- nolist = true,
  linebreak = true,
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
}

for k, v in pairs(options) do
  vim.opt_local[k] = v
end

vim.keymap.set({'n', 'v'}, 'j', 'gj')
vim.keymap.set({'n', 'v'}, 'k', 'gk')
