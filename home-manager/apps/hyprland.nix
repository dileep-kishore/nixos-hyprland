{ config, lib, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    enableNvidiaPatches = false;
    extraConfig = builtins.readFile ./config/hypr/hyprland.conf;
  };
  # home.file.".config/hypr/hyprland.conf".source = ./config/hypr/hyprland.conf;
}
