# https://github.com/hyprwm/Hyprland
# TODO: Use HM to set up the hyprland config
{
  config,
  pkgs,
  ...
}: {
  home.file.".config/hypr" = {
    recursive = true;
    source = ./hypr;
  };
  # Include monitors_x.conf depending on the hostname in nix
  home.file.".config/hypr/monitors.conf" = {
    source = ./monitors_${config.networking.hostName}.conf;
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
