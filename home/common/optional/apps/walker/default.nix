{pkgs, ...}: {
  home.packages = with pkgs; [
    walker
    libqalculate
  ];

  home.file.".config/walker/config.toml".source = ./config.toml;

  home.file.".config/walker/scripts" = {
    recursive = true;
    source = ./scripts;
  };

  home.file.".config/walker/themes" = {
    recursive = true;
    source = ./themes;
  };
}
