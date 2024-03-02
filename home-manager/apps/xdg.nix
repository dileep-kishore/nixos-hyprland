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
      "text/html" = ["brave-browser.desktop"];
      "application/xhtml+xml" = ["brave-browser.desktop"];
      "x-scheme-handler/http" = ["brave-browser.desktop"];
      "x-scheme-handler/https" = ["brave-browser.desktop"];
    };
  };
}
