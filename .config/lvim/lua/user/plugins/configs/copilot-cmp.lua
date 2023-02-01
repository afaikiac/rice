-- see https://github.com/zbirenbaum/copilot-cmp
require("copilot_cmp").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
  method = "getCompletionsCycling",
  formatters = {
    label = require("copilot_cmp.format").format_label_text,
    insert_text = require("copilot_cmp.format").format_insert_text,
    preview = require("copilot_cmp.format").deindent,
  },
})
-- see htps://www.lunarvim.org/plugins/02-extra-plugins.html#copilot-lua-and-copilot-cmp
-- lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
-- table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot", group_index = 2 })
-- table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })
