local gears = require("gears")
local awful = require("awful")

local M = {}

modkey = "Mod4"

M.globalkeys = gears.table.join(
    awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
    awful.key({ modkey }, "r", awesome.restart, { description = "restart awesome", group = "awesome" }),
    awful.key({ modkey }, "Return", function ()
        awful.spawn(terminal)
    end, { group = "launcher" }),
    awful.key({ modkey }, "e", function ()
        awful.spawn.with_shell("rofi -show drun -show-icons")
    end, { group = "launcher" }),
    awful.key({ }, "Print", function ()
        awful.util.spawn("scrot -e 'mv $f ~/Downloads/ 2> /dev/null'")
    end),
    awful.key({ modkey }, "j", function ()
        awful.client.focus.byidx( 1)
    end, { description = "focus next by index", group = "client" }),
    awful.key({ modkey }, "k", function ()
        awful.client.focus.byidx(-1)
    end, { description = "focus previous by index", group = "client" })
)

return M
