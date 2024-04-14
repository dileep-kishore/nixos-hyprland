{pkgs, ...}: {
  imports = [
    ./kitty.nix
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
