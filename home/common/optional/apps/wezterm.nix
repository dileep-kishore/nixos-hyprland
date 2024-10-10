{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    extraConfig = ''
      local wezterm = require "wezterm"

      return {
          force_reverse_video_cursor = true,
          font = wezterm.font "Maple Mono",
          color_scheme = "Catppuccin Mocha",
          font_size = 13.0,
          enable_tab_bar = false,
      }
    '';
  };
}
