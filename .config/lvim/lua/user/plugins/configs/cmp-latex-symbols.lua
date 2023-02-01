local new_sources = vim.list_extend(lvim.builtin.cmp.sources, {
  {
    name = "latex_symbols",
    option = { strategy = 2, },
  },
})

lvim.builtin.cmp.sources = new_sources
