local options = {
  expandtab = false,
  autoindent = true,
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  smartindent = true,
}

for k, v in pairs(options) do
  vim.opt_local[k] = v
end
