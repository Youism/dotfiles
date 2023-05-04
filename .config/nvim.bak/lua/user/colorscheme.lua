-- local colorscheme = "tokyonight-night"

-- vim.notify = require("notify")
-- Lua配置随机颜色
--
require("user.nvim-notify")
random_color = {
	"gruvbox",
	"nord",
	"onedark",
	"deus",
	"abstract",
	"afterglow",
	"alduin",
	"anderson",
	"angr",
	"deep-space",
	"dogrun",
	"gotham",
	"parsec",
	"hybrid",
	"jellybeans",
	"meta5",
	"minimalist",
	"lucid",
	"one",
	"orbital",
	"paramount",
	"pink-moon",
	"purify",
	"rakr",
	"seoul256",
	"sierra",
	"solarized8",
	"sonokai",
	"space-vim-dark",
	"tender",
	"termschool",
	"twilight256",
	"two-firewatch",
  "tokyonight-night",
  "darkplus",
  "codely-theme"
}
math.randomseed(os.time())
local mycolor = random_color[math.random(36)]
vim.cmd("colorscheme " .. mycolor)
vim.notify("The colorscheme is " .. mycolor)
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. mycolor)
-- if not status_ok then
--   return
-- end
