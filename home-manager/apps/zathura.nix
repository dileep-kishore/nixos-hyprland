{ config, lib, pkgs, ... }:
{
  programs.zathura = {
    enable = true;
    extraConfig = "set selection-clipboard clipboard";
  };
}
