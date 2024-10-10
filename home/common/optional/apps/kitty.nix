{
  programs.kitty = {
    enable = true;
    font = {
      name = "Rec Mono Semicasual";
      size = 13.0;
    };
    shellIntegration.enableBashIntegration = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "Catppuccin-Mocha";
    settings = {
      bold_font = "Rec Mono Semicasual Bold";
      italic_font = "Rec Mono Semicasual Italic";
      bold_italic_font = "Rec Mono Semicasual Bold Italic";
    };
  };
}
