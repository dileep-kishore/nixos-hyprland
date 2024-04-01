{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    useTheme = "emodipt-extend";
  };
}
