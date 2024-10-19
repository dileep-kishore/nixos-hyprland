{
  outputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./apps
    ./cli
    ./code
    ./fonts.nix
    ./shells
  ];

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-27.3.11"
        "electron-28.3.3"
      ];
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      warn-dirty = false;
    };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
