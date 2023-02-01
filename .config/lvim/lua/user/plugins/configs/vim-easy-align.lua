-- see https://github.com/junegunn/vim-easy-align#extending-alignment-rules
vim.g["easy_align_delimiters"] = {
  [")"] = {
    ["pattern"]       = "[()]",
    ["left_margin"]   = 0,
    ["right_margin"]  = 0,
    ["stick_to_left"] = 0
  }
}

