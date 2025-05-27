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
      "x-scheme-handler/http" = ["zen.desktop"];
      "x-scheme-handler/https" = ["zen.desktop"];
      "x-scheme-handler/chrome" = ["zen.desktop"];
      "text/html" = ["zen.desktop"];
      "application/x-extension-htm" = ["zen.desktop"];
      "application/x-extension-html" = ["zen.desktop"];
      "application/x-extension-shtml" = ["zen.desktop"];
      "application/xhtml+xml" = ["zen.desktop"];
      "application/x-extension-xhtml" = ["zen.desktop"];
      "application/x-extension-xht" = ["zen.desktop"];
    };
  };
}
