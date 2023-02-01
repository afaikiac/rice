vim.defer_fn(function()
  require("copilot").setup {
    plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
    ft_disable = { "markdown" },
  }
end, 100)
