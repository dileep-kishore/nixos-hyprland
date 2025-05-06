{pkgs, ...}: {
  home.packages = with pkgs; [
    walker
    libqalculate
  ];

  home.file.".config/walker/config.toml".source = ./config.toml;
}
