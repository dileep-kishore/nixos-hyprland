{
  programs.kitty = {
    enable = true;
    font = {
      name = "Maple Mono";
      size = 13.0;
    };
    shellIntegration.enableBashIntegration = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "Catppuccin-Mocha";
    settings = {
      bold_font = "Maple Mono Bold";
      italic_font = "Maple Mono Italic";
      bold_italic_font = "Maple Mono BoldItalic";
    };
  };
}
