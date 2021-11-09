local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local wibar = require("widgets.wibar")
local keys = require("keys")

if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })
        in_error = false
    end)
end

terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

root.keys(keys.globalkeys)

local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), "default")
beautiful.init(theme_path)

awful.layout.layouts = {
    awful.layout.suit.tile.left
}

mykeyboardlayout = awful.widget.keyboardlayout()

local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)

    awful.tag({ "🇨🇳" }, s, awful.layout.layouts[1])

    wibar.get(s)
end)

awful.rules.rules = require("rules")

client.connect_signal("manage", function (c)
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)
client.connect_signal("request::titlebars", function(c)
    for _, v in ipairs({ "top", "right", "bottom", "left" }) do
        awful.titlebar(c, {
            position = v,
            size = beautiful.inner_border_width,
        }) : setup {
            layout = wibox.layout.align.horizontal
        }
    end
end)
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

awful.spawn.with_shell("picom")
awful.spawn.with_shell("fcitx5")
