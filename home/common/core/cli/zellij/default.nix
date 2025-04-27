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
    zlayout = "zellij --layout \"$(fd . \"\$(zellij list-sessions -s)\" | sed 's|.*/||; s|\.[^.]*$||' | fzf --ansi -i || exit)\"";
    za = "zellij attach";
    zai = "zellij attach \"$(echo \"\$(zellij list-sessions)\" | fzf --ansi -i | awk '{print $1}')\"";
    zk = "zellij kill-session";
    zki = "zellij kill-session \"$(echo \"\$(zellij list-sessions)\" | fzf --ansi -i | awk '{print $1}')\"";
    zka = "zellij kill-all-sessions";
    zd = "zellij delete-session";
    zdi = "zellij delete-session \"$(echo \"\$(zellij list-sessions)\" | fzf --ansi -i | awk '{print $1}')\"";
    zda = "zellij delete-all-sessions";
    zlist = "zellij list-sessions";
    zls = "zellij list-sessions";
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
