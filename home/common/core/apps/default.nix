{pkgs, ...}: {
  imports = [
    ./kitty.nix
    ./syncthing.nix
    ./wezterm.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    age
    gedit
    pandoc
    slack
    texliveFull
    sops
    vscode-fhs
    zoom-us
  ];
}
