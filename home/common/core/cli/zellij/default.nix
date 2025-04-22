{pkgs, ...}: {
  home.packages = with pkgs; [
    zellij
  ];

  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  # home.file.".config/zellij/config.kdl" = {
  #   source = ./config.kdl;
  # };

  # aliases
  home.shellAliases = {
    zl = "zellij";
    znew = "zellij new -s";
    za = "zellij attach -s";
    zdetach = "zellij detach";
    zkill = "zellij kill-session -s";
    zlist = "zellij list-sessions";
  };

  # copy over scripts
  # home.file.".config/zellij/scripts" = {
  #   recursive = true;
  #   source = ./scripts;
  # };
}
