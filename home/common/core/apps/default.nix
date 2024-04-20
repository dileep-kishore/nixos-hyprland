{pkgs, ...}: {
  imports = [
    ./kitty.nix
    ./syncthing.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    age
    pandoc
    slack
    texliveFull
    sops
    zoom-us
  ];
}
