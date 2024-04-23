{pkgs, ...}: {
  imports = [
    ./syncthing.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    # _1password-gui
    age
    gitkraken
    pandoc
    slack
    texliveFull
    sops
    zoom-us
  ];
}
