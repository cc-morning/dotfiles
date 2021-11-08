local awful = require("awful")
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local widget_padding = 10
local wibar_height = 32

-- Widget imports
local mytaglist = require("widgets.taglist")
local mysystray = require("widgets.systray")
local mynetwork = require("widgets.network")
local mycpu = require("widgets.cpu")
local mymemory = require("widgets.memory")
local mytextclock = require("widgets.textclock")

-- Activated widgets
local right_widgets = {
    -- mysystray,
    mynetwork,
    mycpu,
    mymemory,
    mytextclock
}

local wibar = {}

function wibar.get(s)
    local mywibox = awful.wibar({
        position = "top",
        screen = s,
        height = dpi(wibar_height)
    })

    local taglist = mytaglist.get(s)

    local left = {
        layout = wibox.layout.fixed.horizontal,
        taglist
    }

    local right = {
        layout = wibox.layout.fixed.horizontal,
    }

    for _,v in ipairs(right_widgets) do
        right[#right+1] = ({
            v,
            left = widget_padding,
            right = widget_padding,
            widget = wibox.container.margin
        })
    end

    mywibox:setup {
        layout = wibox.layout.align.horizontal,
        {
            left,
            right = 10,
            widget = wibox.container.margin
        },
        {
            layout = wibox.layout.align.horizontal,
        },
        {
            right,
            right = 10,
            widget = wibox.container.margin
        }
    }

    return mywibox
end

return wibar
