{
  programs.zathura = {
    enable = true;
    extraConfig = ''
      include catppuccin-mocha
      set selection-clipboard clipboard
    '';
  };
  home.file.".config/zathura/catppuccin-mocha" = {
    source = ./catppuccin-mocha;
  };
}
