{ config, lib, pkgs, ... }:
{
  home.file.".config/wofi/config".source = ./config/wofi/config;
  home.file.".config/wofi/style.css".source = ./config/wofi/style.css;
}
