vim.cmd("call vimtex#init()")

local options = {
  expandtab = true,
  autoindent = true,
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  spell = true,
}

for k, v in pairs(options) do
  vim.opt_local[k] = v
end
