# https://github.com/carapace-sh/carapace
{pkgs, ...}: {
  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
  home.packages = with pkgs; [
    vivid
  ];
}
