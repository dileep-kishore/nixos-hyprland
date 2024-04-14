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

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 3600;
  };

  home.packages = with pkgs; [
  ];
}
