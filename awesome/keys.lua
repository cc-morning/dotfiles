local gears = require("gears")
local awful = require("awful")

local M = {}

modkey = "Mod4"

M.globalkeys = gears.table.join(
    awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
    awful.key({ modkey }, "r", awesome.restart, { description = "restart awesome", group = "awesome" }),
    awful.key({ modkey }, "Return", function () awful.spawn(terminal) end, { group = "launcher" }),
    awful.key({ modkey }, "e", function () awful.spawn.with_shell("rofi -show drun -show-icons") end, { group = "launcher" })
)

return M
