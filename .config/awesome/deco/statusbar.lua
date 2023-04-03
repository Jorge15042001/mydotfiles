-- Standard awesome library
local gears = require("gears")
local awful     = require("awful")
local beautiful     = require("beautiful")


-- Wibox handling library
local wibox = require("wibox")

local create_task_list = require("utils/tasklists").Create_task_list
local normalcurrenttags = require("utils/tasklists").normalcurrenttags

-- Custom Local Library: Common Functional Decoration
local deco = {
  wallpaper = require("deco.wallpaper"),
  taglist   = require("deco.taglist"),
  tasklist  = require("deco.tasklist")
}

local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()

local _M = {}


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

-- awful.screen.connect_for_each_screen(function(s)
--   beautiful.at_screen_connect(s)
-- end)
awful.screen.connect_for_each_screen(function(s)

  -- Wallpaper
  set_wallpaper(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
  }

  -- Create a tasklist widget
  s.mytasklist_minimized = create_task_list(s, awful.widget.tasklist.filter.minimizedcurrenttags,tasklist_buttons,0.5)
  s.mytasklist = create_task_list(s,normalcurrenttags,tasklist_buttons,0.75)
  s.mytasklist_focus = create_task_list(s,awful.widget.tasklist.filter.focused,tasklist_buttons,1.)

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    expand = "none",
    { -- left widgets
      layout = wibox.layout.fixed.horizontal,
      s.mytasklist_minimized,
      s.mytasklist,
      s.mytasklist_focus,
      CONFIG.launcher,
      s.mypromptbox,
      spacing = 20,
    },
    {
      layout = wibox.layout.flex.horizontal,
      max_widget_size = 99999999,
      s.mytaglist,
    },
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      nil,
      {
        wibox.widget.systray(), --show aplication widget
        widget = wibox.container.background,
        -- mykeyboardlayout,
        mytextclock,
        layout = wibox.layout.fixed.horizontal,
      },

    },
  }
end)
-- }}}
