local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local systray = {
    wibox.widget.systray(),
    top = dpi(0),
    bottom = dpi(0),
    right = beautiful.widget_padding,
    widget = wibox.container.margin
}

return systray
