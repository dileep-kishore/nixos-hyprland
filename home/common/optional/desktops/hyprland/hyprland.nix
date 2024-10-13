# https://github.com/hyprwm/Hyprland
# TODO: Use HM to set up the hyprland config
{
  pkgs,
  hostName,
  ...
}: {
  home.file.".config/hypr" = {
    recursive = true;
    source = ./hypr;
  };
  # Include monitors.conf depending on the hostname
  home.file.".config/hypr/monitors.conf" = {
    source =
      if hostName == "nixos-xps"
      then ./monitors-nixos-xps.conf
      else if hostName == "tsuki"
      then ./monitors-tsuki.conf
      else throw "Unsupported hostname for monitor configuration";
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
