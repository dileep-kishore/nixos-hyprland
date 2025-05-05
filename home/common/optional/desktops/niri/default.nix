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
