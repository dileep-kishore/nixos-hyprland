{ config, lib, pkgs, ... }:
{
  home.file.".config/waybar" = {
    recursive = true;
    source = ./config/waybar;
  };
}
