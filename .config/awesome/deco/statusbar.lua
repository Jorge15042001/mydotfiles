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

local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

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
      nil,
      nil,
      {
        widget = wibox.container.background,
        wibox.widget.systray(), --show aplication widget
        mykeyboardlayout,
        mytextclock,
        layout = wibox.layout.fixed.horizontal,
      },

    },
  }
end)
-- }}}
