require("obsidian").setup({
  dir = "~/wiki",
  daily_notes = {
    folder = "dailynotes",
  },
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  },
  note_id_func = function(title)
    return tostring(os.date("!%Y-%m-%d-%H%M%S")) -- UTC datetime
  end,
  use_advanced_uri = true,
})
