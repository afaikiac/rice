local M = {}

M.set_openbrowser_mappings = function ()
  vim.g["netrw_nogx"] = 1
  lvim.lsp.buffer_mappings.normal_mode["gx"] = { "<Plug>(openbrowser-smart-search)", "Browser Search" }
  lvim.lsp.buffer_mappings.visual_mode["gx"] = { "<Plug>(openbrowser-smart-search)", "Browser Search" }
end

M.set_iron_mappings = function ()
  -- keymap for hydrogen format
  -- lvim.keys.normal_mode["]x"] = "ctrih/^# %%<CR><CR>"
  -- lvim.keys.normal_mode["[x"] = "ctrah/^# %%<CR><CR>"
  vim.cmd [[nmap ]x ctrih/^# %%<CR><CR>]]
  -- vim.cmd [[nmap [x ctrah/^# %%<CR><CR>]]
end

M.set_telescope_mappings = function ()
  -- Change Telescope navigation to use j and k for navigation
  -- and n and p for history in both input and normal mode.
  -- We use protected-mode (pcall) just in case the plugin wasn't loaded yet.
  local _, actions = pcall(require, "telescope.actions")
  lvim.builtin.telescope.defaults.mappings = {
    -- for input mode
    i = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-n>"] = actions.cycle_history_next,
      ["<C-p>"] = actions.cycle_history_prev,
    },
    -- for normal mode
    n = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
    },
  }
end

return M
