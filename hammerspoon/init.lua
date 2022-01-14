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
    a = "Calendar",
    d = "Discord",
    x = "Firefox Developer Edition",
    n = "Notes",
    p = "1Password 7",
    r = "Reeder",
    t = "Kitty",
    z = "Zoom.us",
		i = "iTerm2",
		s = "Spotify",
		c = "Google Chrome",
		f = "Finder",
		b = "Bitwarden",
  }
})
