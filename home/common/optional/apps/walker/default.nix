{pkgs, ...}: {
  home.packages = with pkgs; [
    walker
  ];

  home.file.".config/walker/config.toml".source = ./config.toml;
}
