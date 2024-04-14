{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
  ];

  home.username = "dileep";
  home.homeDirectory = "/home/dileep";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
  ];
}
