-- Standard awesome library
local awful = require("awful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get ()
  local tags = {}

  -- ○
  -- ◉
  -- ◌
  -- ⚫
  --  ⬤
--⬤
  -- 〇
  -- local not_selected_names = { "〇", "〇", "〇", "〇", "〇", "〇", "〇", "〇", "〇" }
  -- local     selected_names = { "", "〇", "〇", "〇", "〇", "〇", "〇", "〇", "〇" }
  awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    tags[s] = awful.tag(
      { "〇", "〇", "〇", "〇", "〇", "〇", "〇", "〇", "〇" }, s, CONFIG.layouts[1]
    )
  end)
  -- change to filled circle on selected tags
  -- awful.screen.connect_for_each_screen(function (s)
  --   s.connect_signal("tag::history::update",function (s)
  --     for k, t in pairs(awful.screen.focused().tags) do
  --      if awful.tag.selected() == t then
  --          t.name = long_names[k]
  --      else
  --          t.name = short_names[k]
  --      end
  --     end
      
  --   end)
  -- end)

  return tags
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
