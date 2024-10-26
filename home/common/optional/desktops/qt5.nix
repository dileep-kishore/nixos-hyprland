{pkgs, ...}: {
  qt.enable = true;
  qt.platformTheme.name = "qtct";
  qt.style.name = "kvantum";

  home.packages = with pkgs; [
    (catppuccin-kvantum.override {
      accent = "mauve";
      variant = "mocha";
    })
  ];

  xdg.configFile."Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini {}).generate "kvantum.kvconfig" {
    General.theme = "Catppuccin-Mocha-Mauve";
  };
}
