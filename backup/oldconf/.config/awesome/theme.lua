---------------------------------------------
-- Awesome theme which follows xrdb config --
--   by Yauhen Kirylau                    --
---------------------------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

-- inherit default theme
local theme = dofile(themes_path.."default/theme.lua")

-- load vector assets' generators for this theme

theme.font          = "ProFontIIx Nerd Font 9"

theme.unfocus	    = "#928374" --"#3c3836"
theme.Acolor	    = "#1d2021"
theme.wallcolor	    = "#516270" --"#1E231F"
theme.bg_normal     = theme.Acolor --xrdb.background
theme.bg_focus      = theme.wallcolor --xrdb.color12
theme.bg_urgent     = xrdb.color9
theme.bg_minimize   = theme.Acolor
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.wallcolor
theme.fg_focus      = theme.Acolor --xrdb.foreground
theme.fg_urgent     = theme.Acolor --xrdb.foreground
theme.fg_minimize   = theme.wallcolor --xrdb.foreground

theme.useless_gap   = dpi(1)
theme.border_width  = dpi(1)
theme.border_normal = theme.unfocus
theme.border_focus  = theme.wallcolor
theme.border_marked = xrdb.color10

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
titlebar_size = 8
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

theme.tasklist_fg_normal = theme.wallcolor
theme.tasklist_bg_normal = theme.unfocus
theme.tasklist_fg_focus  = theme.Acolor

theme.titlebar_bg_focus  = theme.wallcolor --"#181818"
theme.titlebar_bg_normal = theme.wallcolor
theme.titlebar_fg_focus  = theme.wallcolor -- nur notlösung !!! sollte richtig entfernt werden...
theme.titlebar_fg_normal = theme.unfocus

-- Define the image to load
--theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
--theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.tooltip_fg = theme.fg_normal
theme.tooltip_bg = theme.bg_normal

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(16)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.fg_normal)

-- Recolor titlebar icons:

local function darker(color_value, darker_n)
    local result = "#"
    for s in color_value:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
        local bg_numeric_value = tonumber("0x"..s) - darker_n
        if bg_numeric_value < 0 then bg_numeric_value = 0 end
        if bg_numeric_value > 255 then bg_numeric_value = 255 end
        result = result .. string.format("%2.2x", bg_numeric_value)
    end
    return result
end
theme = theme_assets.recolor_titlebar(
    theme, theme.unfocus, "normal"
)
theme = theme_assets.recolor_titlebar(
    theme, darker(theme.unfocus, -60), "normal", "hover"
)
theme = theme_assets.recolor_titlebar(
    theme, xrdb.color1, "normal", "press"
)
theme = theme_assets.recolor_titlebar(
    theme, theme.Acolor, "focus"
)
theme = theme_assets.recolor_titlebar(
    theme, darker(theme.Acolor, -60), "focus", "hover"
)
theme = theme_assets.recolor_titlebar(
    theme, xrdb.color1, "focus", "press"
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, xrdb.color15
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, xrdb.color15
)

-- Try to determine if we are running light or dark colorscheme:
local bg_numberic_value = 0;
for s in theme.bg_normal:gmatch("[a-fA-F0-9][a-fA-F0-9]") do
    bg_numberic_value = bg_numberic_value + tonumber("0x"..s);
end
local is_dark_bg = (bg_numberic_value < 383)

-- Generate wallpaper:
local wallpaper_bg = xrdb.color8
local wallpaper_fg = xrdb.color7
local wallpaper_alt_fg = xrdb.color12
if not is_dark_bg then
    wallpaper_bg, wallpaper_fg = wallpaper_fg, wallpaper_bg
end
theme.wallpaper = function(s)
    return theme_assets.wallpaper(wallpaper_bg, wallpaper_fg, wallpaper_alt_fg, s)
end

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
