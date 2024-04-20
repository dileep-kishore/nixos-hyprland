{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    extraConfig = ''
      local wezterm = require "wezterm"

      return {
          force_reverse_video_cursor = true,
          font = wezterm.font "Rec Mono Semicasual",
          color_scheme = "rose-pine",
          font_size = 13.0,
          enable_tab_bar = false,
      }
    '';
  };
}
