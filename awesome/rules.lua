local awful = require("awful")
local keys = require("keys")

local M = {}

M = {
        {
            rule = {},
            properties = {
                focus = awful.client.focus.filter,
                raise = true,
                keys = clientkeys,
                buttons = keys.clientbuttons,
                screen = awful.screen.preferred,
                placement = awful.placement.no_overlap + awful.placement.no_offscreen
            }
        },
        {
            rule_any = {
                type = {
                    "dialog"
                }
            },
            properties = {
                floating = true,
                titlebars_enabled = true,
                placement = awful.placement.centered
            }
        }
    }

return M
