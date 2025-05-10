{pkgs, ...}: {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Original-Ice";
      package = pkgs.bibata-cursors;
    };
    theme = {
      name = "Orchis-Dark";
      package = pkgs.orchis-theme.override {tweaks = ["solid" "macos"];};
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables.GTK_THEME = "Orchis-Dark";
  home.pointerCursor.gtk.enable = true;
  home.pointerCursor.package = pkgs.bibata-cursors;
  home.pointerCursor.name = "Bibata-Original-Ice";
}
