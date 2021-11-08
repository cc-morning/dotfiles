local wibox = require("wibox")

local textclock = {
    format = "%Y-%m-%d %H:%M:%S",
    widget = wibox.widget.textclock,
    refresh = 1
}

return textclock
