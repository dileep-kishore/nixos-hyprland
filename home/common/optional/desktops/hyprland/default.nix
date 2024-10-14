# https://github.com/hyprwm/Hyprland
# TODO: Use HM to set up the hyprland config
{
  pkgs,
  hostName,
  ...
}: {
  imports = [
    ./config.nix
    ./hyprpaper.nix
  ];
  home.file.".config/hypr" = {
    recursive = true;
    source = ./hypr;
  };

  home.packages = with pkgs; [
    grim
    hyprland
    hyprpaper
    hdrop
    libinput
    networkmanagerapplet
    pavucontrol
    pipewire
    slurp
    swayidle
    swaylock-effects
    wl-clipboard
    wlogout
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
}
