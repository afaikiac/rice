local M = {}

-- u
M.set_undotree_mappings = function ()
  lvim.builtin.which_key.mappings["u"] = { "<cmd>UndotreeToggle<cr>", "Toggle Undotree"  }
end

-- t
-- lvim.builtin.which_key.mappings["t"] = {
--     name = "Tab",
--     n = { "<cmd>tabnew %<cr>", "New Tab" },
--     c = { "<cmd>tabclose<cr>", "Close Tab" },
--     o = { "<cmd>tabonly<cr>", "Only Tab" },
-- }

M.set_telescope_tabs_mappings = function ()
  lvim.builtin.which_key.mappings["t"] = { "<cmd>Telescope telescope-tabs list_tabs<cr>", "Find Tab" }
end

M.set_telescope_mappings = function ()
  lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
  lvim.builtin.which_key.mappings["lR"] = { "<cmd>Telescope lsp_references<cr>", "References" }
  lvim.builtin.which_key.mappings["b"] = { "<cmd>Telescope buffers<cr>", "Buffers" }
end

return M
