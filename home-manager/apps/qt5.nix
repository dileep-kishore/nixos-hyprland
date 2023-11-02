{ config, lib, pkgs, ... }:
{
  qt.enable = true;
  qt.platformTheme = "qtct";
  qt.style.name = "kvantum";
  # qt.platformTheme = "gtk";
  # qt.style.name = "Catppuccin-Mocha-Standard-Mauve-Dark";

  home.packages = with pkgs; [

    (catppuccin-kvantum.override {
      accent = "Mauve";
      variant = "Mocha";
    })
  ];

  xdg.configFile."Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
    General.theme = "Catppuccin-Mocha-Mauve";
  };
}
