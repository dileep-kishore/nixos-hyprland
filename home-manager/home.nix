{ config, pkgs, ... }:
{
  home.username = "dileep";
  home.homeDirectory = "/home/dileep";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    htop
  ];
}
