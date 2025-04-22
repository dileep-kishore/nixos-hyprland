-- See https://wezfurlong.org/wezterm/

local wezterm = require "wezterm"

return {
    force_reverse_video_cursor = true,
    font = wezterm.font("Monaspace Neon Frozen Light", { weight = "Light" }),
    font_rules = {
        {
            italic = true,
            font = wezterm.font("Monaspace Radon Frozen Light", { weight = "Light", italic = false }),
        },
        {
            intensity = "Bold",
            font = wezterm.font("Monaspace Krypton Frozen SemiBold", { weight = "Bold" }),
        },
        {
            intensity = "Bold",
            italic = true,
            font = wezterm.font("Monaspace Radon Frozen SemiBold", { weight = "Bold", italic = false }),
        },
    },
    color_scheme = "Catppuccin Mocha",
    font_size = 13.0,
    line_height = 1.2,
    enable_tab_bar = false,
    front_end = "WebGpu",
    enable_wayland = false,
    window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
}
