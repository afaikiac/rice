require("persistence").setup {
  dir = vim.fn.expand(get_cache_dir() .. "/sessions/"), -- directory where session files are saved
  options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
}
