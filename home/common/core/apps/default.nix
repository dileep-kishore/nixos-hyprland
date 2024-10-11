{pkgs, ...}: {
  imports = [
    ./syncthing.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    age
    gitkraken
    pandoc
    texliveFull
    sops
    zoom-us
  ];
}
