local options = {
  spell = true,
  wrap = true,
  -- nolist = true,
  linebreak = true,
  conceallevel = 2,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
}

for k, v in pairs(options) do
  vim.opt_local[k] = v
end

vim.keymap.set({'n', 'v'}, 'j', 'gj')
vim.keymap.set({'n', 'v'}, 'k', 'gk')
vim.keymap.set(
  "n",
  "gf",
  function()
    if require('obsidian').util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<CR>"
    else
      return "gf"
    end
  end,
  { noremap = false, expr = true}
)
