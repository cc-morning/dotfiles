---------------------------
-- Default awesome theme --
---------------------------

local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local themes_path = "~/.config/awesome/themes/"

local theme = {}

theme.font = "Noto Sans CJK Regular 12"

theme.bg_normal = "#1C1F24"
theme.bg_focus = "#282C34"
theme.bg_urgent = "#ff0000"
theme.bg_minimize = "#444444"
theme.bg_systray = theme.bg_normal
theme.systray_icon_spacing = 15

theme.fg_normal = "#ffffff"
theme.taglist_fg_empty = "#5B6268"
theme.fg_focus = "#ffffff"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#ffffff"

theme.gap_single_client = true
theme.useless_gap = dpi(8)
theme.border_width = 0
theme.inner_border_width = 0
theme.border_normal = "#000000"
theme.border_focus = "#000000"
theme.border_marked = "#91231c"

theme.notification_font = "Noto Sans CJK Regular 12"
theme.notification_margin = 100
theme.notification_spacing = dpi(15)
theme.notification_border_width = 2

theme.wallpaper = themes_path .. "default/background.png"
theme.icon_theme = nil

return theme
