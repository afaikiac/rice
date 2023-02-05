require("obsidian").setup({
  dir = "~/vault",
  -- notes_subdir = "Notes",
  daily_notes = {
    folder = "Daily Notes",
  },
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  }
})
