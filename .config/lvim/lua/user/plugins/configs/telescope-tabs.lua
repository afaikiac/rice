require("user.plugins.configs.which-key").set_telescope_tabs_mappings()

require("telescope-tabs").setup({
  previewer = false,
  initial_mode = 'normal',
  prompt_title = 'Tabs',
  close_tab_shortcut_i = '<C-d>', -- if you're in insert mode
  close_tab_shortcut_n = 'dd', -- if you're in normal mode  
})
