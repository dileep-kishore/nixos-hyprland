{ config, lib, pkgs, ... }:
{
  home.file.".config/hypr/hyprland.conf".source = ./config/hypr/hyprland.conf;
}
