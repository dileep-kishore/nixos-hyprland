{pkgs, ...}: {
  imports = [
    ./kitty.nix
    ./syncthing.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    age
    gitkraken
    pandoc
    slack
    texliveFull
    sops
    zoom-us
  ];
}
