-- source: https://gitlab.com/epsi-rns/dotfiles/tree/master/awesome/4.3/binding/globalkeys.lua


-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- local hotkeys_popup = require("awful.hotkeys_popup").widget
local hotkeys_popup = require("awful.hotkeys_popup")
-- Menubar library
local menubar = require("menubar")
-- TODO: remove dependency
local freedesktop = require("freedesktop")
local beautiful   = require("beautiful")

local myawesomemenu = {
   { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "Manual", string.format("%s -e man awesome", CONFIG.vars.terminal) },
   { "Edit config", string.format("%s -e %s %s", CONFIG.vars.terminal, CONFIG.vars.editor, awesome.conffile) },
   { "Restart", awesome.restart },
   { "Quit", function() awesome.quit() end },
}

local mymainmenu = freedesktop.menu.build {
    before = {
        { "Awesome", myawesomemenu, beautiful.awesome_icon },
        -- other triads can be put here
    },
    after = {
        { "Open terminal", CONFIG.vars.terminal },
        -- other triads can be put here
    }
}
-- Resource Configuration
local modkey = CONFIG.vars.modkey
local altkey = CONFIG.vars.altkey
local terminal = CONFIG.vars.terminal
local status_line = CONFIG.status_line

local _M = {}

-- reading
-- https://awesomewm.org/wiki/Global_Keybindings

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Tag browsing
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),
    -- focus by index
    -- awful.key({ altkey,           }, "j",
    --     function ()
    --         awful.client.focus.byidx( 1)
    --     end,
    --     {description = "focus next by index", group = "client"}
    -- ),
    -- awful.key({ altkey,           }, "k",
    --     function ()
    --         awful.client.focus.byidx(-1)
    --     end,
    --     {description = "focus previous by index", group = "client"}
    -- ),

    -- relative focus
    awful.key({ modkey }, "j",
        function()
            awful.client.focus.global_bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus down", group = "client"}),
    awful.key({ modkey }, "k",
        function()
            awful.client.focus.global_bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus up", group = "client"}),
    awful.key({ modkey }, "h",
        function()
            awful.client.focus.global_bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}),
    awful.key({ modkey }, "l",
        function()
            awful.client.focus.global_bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus right", group = "client"}),


    -- TODO: fix this


    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Layout manipulation
    -- awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
    --           {description = "swap with next client by index", group = "client"}),
    -- awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
    --           {description = "swap with previous client by index", group = "client"}),
    awful.key({"Control",  altkey    }, "h", function () awful.client.swap.global_bydirection("left") end,
              {description = "swap with left", group="client"}),
    awful.key({"Control",  altkey    }, "j", function () awful.client.swap.global_bydirection("down") end,
              {description = "swap with down", group="client"}),
    awful.key({"Control",  altkey    }, "k", function () awful.client.swap.global_bydirection("up") end,
              {description = "swap with up", group="client"}),
    awful.key({"Control",  altkey    }, "l", function () awful.client.swap.global_bydirection("right") end,
              {description = "swap with right", group="client"}),

    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Layout manipulation
    awful.key({ modkey, altkey    }, "l",     function () awful.tag.incmwfact( 0.02)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey, altkey    }, "h",     function () awful.tag.incmwfact(-0.02)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, altkey    }, "j",     function () awful.client.incwfact( 0.02)          end,
              {description = "increase master height factor", group = "layout"}),
    awful.key({ modkey, altkey    }, "k",     function () awful.client.incwfact(-0.02)          end,
              {description = "decrease master height factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Prompt
    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Resize
    --awful.key({ modkey, "Control" }, "Left",  function () awful.client.moveresize( 20,  20, -40, -40) end),
    awful.key({ modkey, "Control" }, "Up",
    --awful.key({ modkey, "Control" }, "Right", function () awful.client.moveresize(-20, -20,  40,  40) end),
    awful.key({ modkey, "Control" }, "Down",
              function () awful.client.moveresize( 0, 0, 0, -20) end),
              function () awful.client.moveresize( 0, 0, 0,  20) end),
    awful.key({ modkey, "Control" }, "Left",
              function () awful.client.moveresize( 0, 0, -20, 0) end),
    awful.key({ modkey, "Control" }, "Right",
              function () awful.client.moveresize( 0, 0,  20, 0) end),

    -- Move
    awful.key({ modkey, "Shift"   }, "Down",
              function () awful.client.moveresize(  0,  20,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Up",
              function () awful.client.moveresize(  0, -20,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Left",
              function () awful.client.moveresize(-20,   0,   0,   0) end),
    awful.key({ modkey, "Shift"   }, "Right",
              function () awful.client.moveresize( 20,   0,   0,   0) end),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"}),
    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- toggle status bar
    awful.key({ modkey }, "b",
              function()
                for s in screen do
                  s.mywibox.visible = not s.mywibox.visible
                  if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                  end
                end
              end,
              {description = "togle status bar", group = "launcher"}),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- screenshot
    awful.key({ altkey }, "p", function() os.execute(CONFIG.vars.screenshot_command) end,
              {description = "take a screenshot", group = "screenshot"}),
    --Save screenshot to clipboard
    awful.key({ altkey , "Control" }, "p", function () os.execute(CONFIG.vars.screenshot_clipboard) end,
              {description = "Save screenshot to clipboard", group = "screenshot"}) ,

    --Save screenshot to system
    awful.key({ altkey , "Shift" }, "p", function () os.execute(CONFIG.vars.screenshot_save) end,
              {description = "Save screenshot to system", group = "screenshot"}) ,
    --Save screenshot to path
    awful.key({ altkey , modkey}, "p", function () os.execute(CONFIG.vars.screenshot_command_no_path) end,
              {description = "Save screenshot (chose path)", group = "screenshot"})

  )


  return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })

