{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    extraConfig = ''
      local wezterm = require "wezterm"

      return {
          force_reverse_video_cursor = true,
          font = wezterm.font("Recursive Mono Casual Static", {weight="Medium", stretch="Normal", style="Normal"}),
          color_scheme = "Catppuccin Mocha",
          enable_tab_bar = false,
      }
    '';
  };
}
