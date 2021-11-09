---------------------------
-- Default awesome theme --
---------------------------

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local themes_path = "~/.config/awesome/themes/"

local theme = {}

theme.font = "JetBrains Mono 13"

theme.widget_padding = 10
theme.wibar_height = 38
theme.wibar_width = 960
theme.wibar_opacity = 0.7

theme.bg_normal = "#1C1F24"
theme.bg_focus = "#282C34"
theme.bg_systray = theme.bg_normal
theme.systray_icon_spacing = 10

theme.fg_normal = "#ffffff"
theme.taglist_fg_empty = "#5B6268"
theme.fg_focus = "#ffffff"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#ffffff"

theme.gap_single_client = true
theme.useless_gap = dpi(10)
theme.border_width = 0
theme.inner_border_width = 0

theme.notification_font = "Noto Sans CJK Regular 12"

theme.wallpaper = themes_path .. "default/background.png"
theme.icon_theme = nil

return theme
