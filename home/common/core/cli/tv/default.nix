# https://github.com/alexpasmantier/television
{
  programs.television = {
    enable = true;
  };

  home.file.".config/television/config.toml".source = ./config.toml;
}
