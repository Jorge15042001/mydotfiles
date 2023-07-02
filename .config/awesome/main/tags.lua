-- Standard awesome library
local awful = require("awful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
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
    local width = s.geometry.width
    local height = s.geometry.height
    local layout_idx = (height > width and { 3 } or { 1 })[1]
    tags[s] = awful.tag(
      { "⬤ ","⬤ ","⬤ ","⬤ ","⬤ ","⬤ ","⬤ ","⬤ ","⬤ ",}, s, CONFIG.layouts[layout_idx]
    )
  end)
  return tags
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
