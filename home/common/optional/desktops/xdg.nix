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
      "x-scheme-handler/http" = ["zen-browser.desktop"];
      "x-scheme-handler/https" = ["zen-browser.desktop"];
      "x-scheme-handler/chrome" = ["zen-browser.desktop"];
      "text/html" = ["zen-browser.desktop"];
      "application/x-extension-htm" = ["zen-browser.desktop"];
      "application/x-extension-html" = ["zen-browser.desktop"];
      "application/x-extension-shtml" = ["zen-browser.desktop"];
      "application/xhtml+xml" = ["zen-browser.desktop"];
      "application/x-extension-xhtml" = ["zen-browser.desktop"];
      "application/x-extension-xht" = ["zen-browser.desktop"];
    };
  };
}
