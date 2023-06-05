-------------------------------------------------
-- stolen from 
--
-- Logout widget for Awesome Window Manager
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/logout-widget

-- @author Pavel Makhov
-- @copyright 2020 Pavel Makhov
--
-- stolen by: Jorge Vulgarin
-------------------------------------------------
--

local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local awesomebuttons = require("awesome-buttons.awesome-buttons")

local capi = { keygrabber = awful.keygrabber }

local valid_number = { ["1"] = true, ["2"] = true, ["3"] = true, ["4"] = true, ["5"] = true, ["6"] = true, ["7"] = true,
  ["8"] = true, ["9"] = true }

local w = wibox {
  bg = "#000000",
  -- max_widget_size = 500,
  ontop = true,
  -- height = 700,
  width = 400,
  shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, 4) end,
  widget = wibox.container.background,
}
local function restore_client(c)
  c:emit_signal(
    "request::activate",
    "tasklist",
    { raise = true }
  )
end

local function close_popup()
  capi.keygrabber.stop()
  w.visible = false
end

local function create_button_client(client)
  local button = awesomebuttons.with_icon_and_text { icon = client.icon, text = client.name, type = "flat",
    onclick = function()
      restore_client(client)
      close_popup()
    end
  }
  button.client = client --save the client to be access latter
  return button
end

local function get_minimized_clients_buttons()
  local hidden_c = awful.screen.focused().hidden_clients -- list of all minimized clientes
  local client_buttons = {
    id = 'buttons',
    spacing = 20,
    layout = wibox.layout.fixed.vertical
  }
  local index = 1
  for _, c in ipairs(hidden_c) do
    if awful.widget.tasklist.filter.minimizedcurrenttags(c, awful.screen.focused()) then
      client_buttons[index] = create_button_client(c)
      index = index + 1;
    end
  end
  return client_buttons
end

local function launch()

  local client_buttons = get_minimized_clients_buttons()
  local num_clients = #(client_buttons)

  w:setup {
    -- nil,
    {
      client_buttons,
      widget = wibox.container.margin,
      margins = 20
    },

    -- shape_border_width = 1,
    valign = 'center',
    halign = 'center',
    -- layout = wibox.layout.fixed.vertical,
    widget = wibox.container.place
  }

  if num_clients == 0 then return
  end
  w.height = (num_clients) * (30 + 20) + 20

  w.screen = awful.screen.focused()
  w.visible = true

  awful.placement.centered(w)
  capi.keygrabber.run(function(_, key, event)
    if event == "release" then return end
    if not key then return end
    if key == 'Escape' then close_popup()
    elseif string.match(("123456789"):sub(1,num_clients),key) then
      restore_client(client_buttons[tonumber(key)].client)
      close_popup()
    end
    end
  )
end

return {
  launch = launch,
}
