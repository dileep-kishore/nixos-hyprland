{ config, lib, pkgs, ... }:
{
  home.file.".config/hypr/hyprland.conf".source = ./config/hypr/hyprland.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ./config/hypr/hyprpaper.conf;
  home.file.".config/hypr/mocha.conf".source = ./config/hypr/mocha.conf;
  # mako
  home.file.".config/mako/config".source = ./config/mako/config;
}
