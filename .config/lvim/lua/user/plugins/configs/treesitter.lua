lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow = {
  enable = true,
  extended_mode = true, -- also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  max_file_lines = nil, -- do not enable for files with more than n lines, int
}

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "markdown",
  "latex",
  "markdown_inline",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }

lvim.builtin.treesitter.highlight = {
  enable = true,
  additional_vim_regex_highlighting = { "markdown" },
}
