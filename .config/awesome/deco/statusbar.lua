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

local cpuwidget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")
local volume_widget   = require("awesome-wm-widgets.volume-widget.volume")
local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")


local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()

local _M = {}


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock()
local cw = calendar_widget({
    -- theme = 'nord',
    placement = 'top_right',
    start_sunday = false,
    radius = 0,
    previous_month_button = 1,
    next_month_button = 3,
})
mytextclock:connect_signal("button::press", cw.toggle)

local brightnessWidget = brightness_widget{
    type = 'arc',
    program = 'brightnessctl',
    step = 1, 
}
-- brightnessWidget:connect_signal("button::press",function () brightness_widget:inc() end)

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
        --  batteryarc_widget({
        --     show_current_level = true,
        --     arc_thickness = 2,
        -- }),
        volume_widget({ widget_type = 'arc' }),
        -- brightnessWidget,
        -- mykeyboardlayout,
        mytextclock,
        logout_menu_widget(),

        layout = wibox.layout.fixed.horizontal,
      },

    },
  }
end)
-- }}}
