-- See https://wezfurlong.org/wezterm/

local wezterm = require "wezterm"

return {
    force_reverse_video_cursor = true,
    font = wezterm.font("Maple Mono", { weight = "Light" }),
    font_rules = {
        {
            italic = true,
            font = wezterm.font("Maple Mono", { weight = "Light", italic = true }),
        },
        {
            intensity = "Bold",
            font = wezterm.font("Maple Mono", { weight = "Bold" }),
        },
        {
            italic = true,
            intensity = "Bold",
            font = wezterm.font("Maple Mono", { weight = "Bold", italic = true }),
        },
    },
    color_scheme = "Catppuccin Mocha",
    font_size = 13.0,
    enable_tab_bar = false,
    front_end = "WebGpu",
    enable_wayland = false,
    window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
}
