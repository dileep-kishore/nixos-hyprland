{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    extraConfig = ''
      local wezterm = require "wezterm"

      return {
          force_reverse_video_cursor = true,
          font = wezterm.font "CaskaydiaCove NF",
          color_scheme = "Catppuccin Mocha",
          enable_tab_bar = false,
      }
    '';
  };
}
