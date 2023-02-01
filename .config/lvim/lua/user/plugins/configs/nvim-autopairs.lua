-- https://github.com/LunarVim/LunarVim/commit/8ea68830a0212047aae924cc32ef9d7bb3bb270b
local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

local Rule = require "nvim-autopairs.rule"

require("nvim-treesitter.configs").setup { autopairs = { enable = true } }

local ts_conds = require "nvim-autopairs.ts-conds"

-- TODO: can these rules be safely added from "config.lua" ?
-- press % => %% is only inside comment or string
autopairs.add_rules {
  Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
  Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
}
