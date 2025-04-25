{pkgs, ...}: {
  home.packages = with pkgs; [
    zellij
  ];

  programs.zellij = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = false;
  };

  home.file.".config/zellij/config.kdl" = {
    source = ./config.kdl;
  };

  # aliases
  home.shellAliases = {
    z = "zellij";
    znew = "zellij --session";
    za = "zellij attach \"$(echo \"\${ZJ_SESSIONS}\" | fzf --ansi -i)\"";
    zlayout = "zellij --layout \"$(fd . \"\${ZJ_LAYOUT_DIR}\" | sed 's|.*/||; s|\.[^.]*$||' | fzf --ansi -i || exit)\"";
    zkill = "zellij kill-session \"$(echo \"\${ZJ_SESSIONS}\" | fzf --ansi -i)\"";
    zkillall = "zellij kill-all-sessions";
    zdel = "zellij delete-session \"$(echo \"\${ZJ_SESSIONS}\" | fzf --ansi -i)\"";
    zdelall = "zellij delete-all-sessions";
    zlist = "zellij list-sessions";
  };

  # copy over layouts
  home.file.".config/zellij/layouts" = {
    recursive = true;
    source = ./layouts;
  };

  # copy over scripts
  home.file.".config/zellij/scripts" = {
    recursive = true;
    source = ./scripts;
  };
}
