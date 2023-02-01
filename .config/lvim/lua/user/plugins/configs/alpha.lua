local status_ok, _ = pcall(require, "alpha")
if not status_ok then
  return
end

lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.alpha.dashboard.section.header = {}
lvim.builtin.alpha.dashboard.section.header.val = { "ヾ(＾∇＾)" }
lvim.builtin.alpha.dashboard.section.footer.val = require("lvim.interface.text").align_center(
  { width = 0 },
  {
    "",
    require("lvim.utils.git").get_lvim_version(),
  }, 0.5
)
