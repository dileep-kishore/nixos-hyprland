# https://github.com/aristocratos/btop
{config, ...}: {
  programs.btop = {
    enable = true;
    settings = {
      theme_background = true;
      color_theme = "${config.home.homeDirectory}/.config/btop/themes/rose-pine.theme";
      true_color = true;
      presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";
      vim_keys = true;
      rounded_corners = true;
      shown_boxes = "cpu mem net proc";
      proc_sorting = "memory";
      proc_reversed = false;
      proc_tree = true;
      proc_colors = true;
    };
  };

  # copy themes
  home.file.".config/btop/themes" = {
    recursive = true;
    source = ./themes;
  };
}
