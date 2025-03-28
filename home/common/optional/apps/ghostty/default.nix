{pkgs, ...}: {
  imports = [
    ./config.nix
  ];
  home.packages = with pkgs; [
    ghostty
  ];
}
