--[[

     Awesome WM configuration template
     github.com/lcpz

--]]


-- {{{ Required libraries

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
local menubar       = require("menubar")
local freedesktop   = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
local mytable = awful.util.table or gears.table -- 4.{0,1} compatibility



CONFIG = {} -- global namespace
CONFIG.vars = require("main.user-variables")

-- configuration path
local config_path = awful.util.getdir("config") .. "/"
-- {{{ Error handling -- }}}
require("main.error-handling")
-- {{{ Themes -- }}}
--beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))
-- TODO: remove conflicting properties in theme file
beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), "jorge-theme"))
--beautiful.init("/home/jorge1504/.files/configFiles/awesomewm/awesome/themes/jorge-theme/theme.lua")

-- Custom Local Library
local main      = {
  layouts = require("main.layouts"),
  tags    = require("main.tags"),
  menu    = require("main.menu"),
  rules   = require("main.rules"),
}
CONFIG.layouts  = main.layouts()
CONFIG.tags     = main.tags()
CONFIG.mainmenu = awful.menu({ items = main.menu() })
CONFIG.launcher = awful.widget.launcher(
  { image = beautiful.awesome_icon, menu = CONFIG.mainmenu }
)

-- set terminal emulator
menubar.utils.terminal = CONFIG.vars.terminal
awful.util.terminal = CONFIG.vars.terminal
-- keys binding
local bindings = {
  globalbuttons = require("bindings.globalbuttons"),
  clientbuttons = require("bindings.clientbuttons"),
  globalkeys    = require("bindings.globalkeys"),
  clientkeys    = require("bindings.clientkeys"),
  bindtotags    = require("bindings.bindtotags")
}

-- {{{ Mouse bindings
CONFIG.globalkeys = bindings.globalkeys()
CONFIG.globalkeys = bindings.bindtotags(CONFIG.globalkeys)
-- }}}

-- {{{set root
-- Set keys
root.buttons(bindings.globalbuttons())
root.keys(CONFIG.globalkeys)

-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- TODO: move this out
-- startup script
awesome.connect_signal(
  'startup',
  function(args)
    os.execute("nvidia-settings --assign CurrentMetaMode=\"nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }\"")
    -- connect to barrier server
    -- os.execute("barrierc --disable-crypto  --name jorgeLaptop 192.168.100.41")
    os.execute(string.format("barriers  --disable-client-cert-checking --disable-crypto -c %s/.config/barrier/barrier.conf",os.getenv("HOME")))

    -- set screen configuration
    os.execute("bash -c '/usr/bin/xrandr --output DVI-D-0 --off --output HDMI-0 --mode 2560x1440 --pos 2560x0 --rotate right --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --mode 2560x1440 --pos 0x0 --rotate normal --output DP-5 --off'")
  end
)

-- {{{ Autostart windowless processes
-- TODO: figuire out if this is already on other fiels
-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
  for _, cmd in ipairs(cmd_arr) do
    awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
  end
end

-- }}}


-- {{{ Statusbar: Wibar
require("deco.statusbar")
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = main.rules(
  bindings.clientkeys(),
  bindings.clientbuttons()
)
-- }}}

-- {{{ Signals
require("main.signals")
-- }}}
awful.spawn("compton")

-- }}}
