{pkgs, ...}: {
  imports = [
    ./syncthing.nix
    ./zathura
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
