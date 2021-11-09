local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local taglist = require("widgets.taglist")
local systray = require("widgets.systray")
local network = require("widgets.network")
local cpu = require("widgets.cpu")
local memory = require("widgets.memory")
local textclock = require("widgets.textclock")

local right_widgets = {
    -- systray,
    network,
    cpu,
    memory,
    textclock
}

local wibar = {}

local rrect = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius)
    end
end

function wibar.get(s)
    local mywibox = awful.wibar({
        position = "top",
        screen = s,
        width = dpi(beautiful.wibar_width),
        height = dpi(beautiful.wibar_height),
        opacity = beautiful.wibar_opacity
    })
    mywibox.y = beautiful.useless_gap

    local taglist = taglist.get(s)

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
            left = beautiful.widget_padding,
            right = beautiful.widget_padding,
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
