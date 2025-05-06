{pkgs, ...}: {
  imports = [
    ./services.nix
    ./swayidle.nix
    ./swaylock.nix
    ./xwayland-satellite.nix
  ];

  home.packages = with pkgs; [
    swaybg
    swaynotificationcenter
    wl-clipboard
    wlogout
    libinput
    networkmanagerapplet
    pavucontrol
    pipewire
    python312Packages.toggl-cli
  ];

  home.file.".config/niri" = {
    recursive = true;
    source = ./niri;
  };

  home.file.".config/swaync" = {
    recursive = true;
    source = ./swaync;
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
