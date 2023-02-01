local options = {
  spell = true,
}

for k, v in pairs(options) do
  vim.opt_local[k] = v
end
