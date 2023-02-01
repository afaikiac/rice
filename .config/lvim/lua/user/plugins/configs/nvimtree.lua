local status_ok, _ = pcall(require, "nvimtree")
if not status_ok then
  return
end

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
-- lvim.builtin.nvimtree.setup.view.mappings.custom_only = true
