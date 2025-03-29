{pkgs, ...}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "Maple Mono NF";
    location = "center";
    terminal = "kitty";
    plugins = [
      pkgs.rofi-calc
    ];
    theme = "~/.config/rofi/launcher.rasi";
  };
  home.file.".config/rofi" = {
    recursive = true;
    source = ./custom;
  };
}
