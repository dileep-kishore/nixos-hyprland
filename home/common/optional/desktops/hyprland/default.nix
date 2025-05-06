# https://github.com/hyprwm/Hyprland
{pkgs, ...}: {
  imports = [
    ./config.nix
    ./hyprpaper.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];
  home.file.".config/hypr" = {
    recursive = true;
    source = ./hypr;
  };

  home.packages = with pkgs; [
    grim
    hyprland
    hyprpaper
    hypridle
    hdrop
    libinput
    networkmanagerapplet
    pavucontrol
    pipewire
    slurp
    swayidle
    swaylock
    wl-clipboard
    wlogout
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    python312Packages.toggl-cli
  ];
}
