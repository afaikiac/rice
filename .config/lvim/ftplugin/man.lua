local options = {
  foldmethod = "indent",
  foldnestmax = 1,
  foldenable = true,
  shiftwidth = 4,
}

for k, v in pairs(options) do
  vim.opt_local[k] = v
end
