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
      "x-scheme-handler/http" = ["brave.desktop"];
      "x-scheme-handler/https" = ["brave.desktop"];
      "x-scheme-handler/chrome" = ["brave.desktop"];
      "text/html" = ["brave.desktop"];
      "application/x-extension-htm" = ["brave.desktop"];
      "application/x-extension-html" = ["brave.desktop"];
      "application/x-extension-shtml" = ["brave.desktop"];
      "application/xhtml+xml" = ["brave.desktop"];
      "application/x-extension-xhtml" = ["brave.desktop"];
      "application/x-extension-xht" = ["brave.desktop"];
    };
  };
}
