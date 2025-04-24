{pkgs, ...}: {
  home.packages = with pkgs; [
    zellij
  ];

  programs.zellij = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = false;
    # TODO: Set TERM=vte-256color
    # This fixes ghostty underlines as well
  };

  home.file.".config/zellij/config.kdl" = {
    source = ./config.kdl;
  };

  # aliases
  home.shellAliases = {
    z = "zellij";
    znew = "zellij --session";
    za = "zellij attach";
    zkill = "zellij kill-session";
    zkillall = "zellij kill-all-sessions";
    zdel = "zellij delete-session";
    zdelall = "zellij del-all-sessions";
    zlist = "zellij list-sessions";
  };

  # copy over layouts
  home.file.".config/zellij/layouts" = {
    recursive = true;
    source = ./layouts;
  };

  # # copy over scripts
  # home.file.".config/zellij/scripts" = {
  #   recursive = true;
  #   source = ./scripts;
  # };
}
