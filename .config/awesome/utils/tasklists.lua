local awful = require("awful")
local wibox = require("wibox")

local _M = {}

function _M.Create_task_list(s, task_filter, tasklist_buttons, opacity)
  return awful.widget.tasklist {
    screen          = s,
    filter          = task_filter,
    buttons         = tasklist_buttons,
    layout          = {
      spacing_widget = {
        valign = 'center',
        halign = 'center',
        widget = wibox.container.place,
      },
      spacing        = 5,
      layout         = wibox.layout.fixed.horizontal
    },
    -- Notice that there is *NO* wibox.wibox prefix, it is a template,
    -- not a widget instance.
    widget_template = {
      {
        {
          id      = 'clienticon',
          widget  = awful.widget.clienticon,
          opacity = opacity
        },
        -- margins = 1,
        -- left = 10,
        -- right = 10,
        widget = wibox.container.margin
      },
      create_callback = function(self, c, index, objects) --luacheck: no unused args
        self:get_children_by_id('clienticon')[1].client = c
        awful.tooltip({
          objects = { self },
          timer_function = function()
            return c.name
          end,
        })

      end,
      layout = wibox.layout.align.vertical,
    },
  }
end

function _M.Create_task_list_popup(s, task_filter, tasklist_buttons, opacity)
  return awful.popup {
    widget       = awful.widget.tasklist {
      screen          = s,
      filter          = task_filter,
      buttons         = tasklist_buttons,
      layout          = {
        spacing = 5,
        forced_num_rows = 2,
        layout = wibox.layout.grid.horizontal
      },
      widget_template = {
        {
          {
            id     = "clienticon",
            widget = awful.widget.clienticon,
            opacity = opacity,
          },
          margins = 4,
          widget  = wibox.container.margin,
        },
        id              = "background_role",
        forced_width    = 48,
        forced_height   = 48,
        widget          = wibox.container.background,
        create_callback = function(self, c, index, objects) --luacheck: no unused
          self:get_children_by_id("clienticon")[1].client = c
        end,
      },
    },
    border_color = "#777777",
    border_width = 2,
    ontop        = true,
    placement    = awful.placement.centered,
    hide_on_right_click = true,
  }
end

function _M.normalcurrenttags(c, s)
  return awful.widget.tasklist.filter.currenttags(c, s) and not awful.widget.tasklist.filter.minimizedcurrenttags(c, s)
      and not awful.widget.tasklist.filter.focused(c, s)
end

return _M
