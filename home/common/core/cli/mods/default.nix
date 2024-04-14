# https://github.com/charmbracelet/mods
{pkgs, ...}: {
  home.packages = with pkgs; [
    mods
  ];

  # copy config
  home.file.".config/mods/mods.yml".source = ./mods.yml;
}
