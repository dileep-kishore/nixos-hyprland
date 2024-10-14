# https://github.com/hyprwm/Hyprland
# TODO: Use HM to set up the hyprland config
{
  pkgs,
  hostName,
  ...
}: {
  imports = [
    ./config.nix
  ];
  home.file.".config/hypr" = {
    recursive = true;
    source = ./hypr;
  };
  # Include hyprpaper.conf depending on the hostname
  home.file.".config/hypr/hyprpaper.conf" = {
    source =
      if hostName == "nixos-xps"
      then ./hyprpaper-nixos-xps.conf
      else if hostName == "tsuki"
      then ./hyprpaper-tsuki.conf
      else throw "Unsupported hostname for monitor configuration";
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
