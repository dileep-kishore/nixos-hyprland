{ config, lib, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "CaskaydiaCove NF";
    location = "center";
    terminal = "wezterm";
    plugins = [
      pkgs.rofi-calc
    ];
    theme = "~/.config/rofi/launcher.rasi";
  };
  home.file.".config/rofi" = {
    recursive = true;
    source = ./config/rofi;
  };
}
