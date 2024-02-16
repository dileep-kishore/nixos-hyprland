{ config, lib, pkgs, ... }: {

  home.file.".config/hypr" = {
    recursive = true;
    source = ./config/hypr;
  };
  # mako
  home.file.".config/mako/config".source = ./config/mako/config;
}
