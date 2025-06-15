{
  xdg.enable = true;

  xdg.desktopEntries = {
    okular = {
      name = "Okular";
      genericName = "PDF Viewer";
      exec = "okular %U";
      terminal = false;
      categories = ["Application"];
      mimeType = ["application/pdf"];
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = ["okular.desktop"];
      "x-scheme-handler/tana" = ["tana.desktop"];
      "x-scheme-handler/http" = ["vivaldi-stable.desktop"];
      "x-scheme-handler/https" = ["vivaldi-stable.desktop"];
      "x-scheme-handler/chrome" = ["vivaldi-stable.desktop"];
      "text/html" = ["vivaldi-stable.desktop"];
      "application/x-extension-htm" = ["vivaldi-stable.desktop"];
      "application/x-extension-html" = ["vivaldi-stable.desktop"];
      "application/x-extension-shtml" = ["vivaldi-stable.desktop"];
      "application/xhtml+xml" = ["vivaldi-stable.desktop"];
      "application/x-extension-xhtml" = ["vivaldi-stable.desktop"];
      "application/x-extension-xht" = ["vivaldi-stable.desktop"];
    };
  };
}
