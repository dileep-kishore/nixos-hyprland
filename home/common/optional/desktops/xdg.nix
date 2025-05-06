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
      "text/html" = ["vivaldi.desktop"];
      "application/xhtml+xml" = ["vivaldi.desktop"];
      "x-scheme-handler/http" = ["vivaldi.desktop"];
      "x-scheme-handler/https" = ["vivaldi.desktop"];
    };
  };
}
