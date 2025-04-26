{pkgs, ...}: {
  imports = [
    ./config.nix
  ];
  home.file.".config/niri" = {
    recursive = true;
    source = ./niri;
  };

  # TODO: Does niri go here?
  # How do I get it to work wtih home-manager?
  home.packages = with pkgs; [
    niri
    swaylock-effects
    xwayland-satellite
  ];

  # NOTE: You can use nixpkgs version of niri on ubuntu by doing:
  # https://github.com/YaLTeR/niri/discussions/1383
}
