-- Standard awesome library
local gears = require("gears")
local awful     = require("awful")

-- Wibox handling library
local wibox = require("wibox")

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

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)
  ))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    layout   = {
       spacing_widget = {
      --   {
      --     forced_width  = 5,
      --     forced_height = 24,
      --     thickness     = 3,
      --     color         = '#777777',
      --     widget        = wibox.widget.separator
        -- },
        valign = 'center',
        halign = 'center',
        widget = wibox.container.place,
      },
      spacing = 5,
      layout  = wibox.layout.fixed.horizontal
    },
    -- Notice that there is *NO* wibox.wibox prefix, it is a template,
    -- not a widget instance.
    widget_template = {
      {
        wibox.widget.base.make_widget(),
        forced_height = 5,
        -- id            = 'background_role',
        widget        = wibox.container.background,
      },
      {
        {
          id     = 'clienticon',
          widget = awful.widget.clienticon,
        },
        margins = 0,
        widget  = wibox.container.margin
      },
      nil,
      create_callback = function(self, c, index, objects) --luacheck: no unused args
          self:get_children_by_id('clienticon')[1].client = c
          -- TODO: minimized clients are opaque
          -- c.connect_signal ("property::minimized", function ()
            -- self:get_children_by_id('clienticon')[1].client = nil
          -- end)
      end,
      layout = wibox.layout.align.vertical,
    },
  }

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.flex.horizontal,
    { -- left widgets
      layout = wibox.layout.align.horizontal,
      s.mytasklist,
    },
    {
      layout = wibox.layout.flex.horizontal,
      CONFIG.launcher,
      s.mytaglist,
      s.mypromptbox,
    },
    { -- Right widgets
      layout = wibox.layout.align.horizontal,
      spacer,
      spacer,
      {
        widget = wibox.container.background,
        wibox.widget.systray(), --show aplication widget
         batteryarc_widget({
            show_current_level = true,
            arc_thickness = 2,
        }),
        volume_widget({ widget_type = 'arc' }),
        brightnessWidget,
        -- mykeyboardlayout,
        mytextclock,
        logout_menu_widget(),

        layout = wibox.layout.fixed.horizontal,
      },

    },
  }
end)
-- }}}
