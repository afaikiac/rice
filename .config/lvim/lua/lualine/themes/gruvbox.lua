local theme = require("gruvbox.groups").setup()

local colors = {
  bg0 = theme.GruvboxBg0.fg,
  bg1 = theme.GruvboxBg1.fg,
  bg2 = theme.GruvboxBg2.fg,
  bg4 = theme.GruvboxBg4.fg,
  fg1 = theme.GruvboxFg1.fg,
  fg4 = theme.GruvboxFg4.fg,

  yellow = theme.GruvboxYellow.fg,
  blue = theme.GruvboxBlue.fg,
  aqua = theme.GruvboxAqua.fg,
  orange = theme.GruvboxOrange.fg,
  red = theme.GruvboxRed.fg,
  green = theme.GruvboxGreen.fg,
}

return {
  normal = {
    a = { bg = colors.fg4, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg2, fg = colors.fg4 },
    c = { bg = colors.bg1, fg = colors.fg4 },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg2, fg = colors.fg4 },
    c = { bg = colors.bg1, fg = colors.fg4 },
  },
  visual = {
    a = { bg = colors.orange, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg2, fg = colors.fg4 },
    c = { bg = colors.bg1, fg = colors.fg4 },
  },
  replace = {
    a = { bg = colors.green, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg2, fg = colors.fg4 },
    c = { bg = colors.bg1, fg = colors.fg4 },
  },
  command = {
    a = { bg = colors.fg4, fg = colors.bg0, gui = 'bold' },
    b = { bg = colors.bg2, fg = colors.fg4 },
    c = { bg = colors.bg1, fg = colors.fg4 },
  },
  inactive = {
    a = { bg = colors.bg1, fg = colors.bg4 },
    b = { bg = colors.bg1, fg = colors.bg4 },
    c = { bg = colors.bg1, fg = colors.fg4 },
  },
}
