inspect = hs.inspect.inspect
-- prefix = require("prefix")
utils = require("utils")

require("double_cmdq_to_quit")
require("keymaps")


local VimMode = hs.loadSpoon('VimMode')
local vim = VimMode:new()

vim:enterWithSequence('jk')

vim
  :disableForApp('Code')
  :disableForApp('MacVim')
  :disableForApp('zoom.us')
  :enterWithSequence('jk')

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall:andUse("AppLauncher", {
  hotkeys = {
		u = "iTerm",
		y = "Spotify",
		i = "Google Chrome",
		-- t = "Finder",
		o = "Bitwarden",
  }
})
