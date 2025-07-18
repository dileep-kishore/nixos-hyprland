{
  imports = [
    ./bash.nix
    ./zsh.nix
  ];
  home.shellAliases = {
    # rm alias
    rm = "rm -i";
    # clear
    clear = "clear -x";
    cls = "clear";
    # vim alias
    v = "nvim";
    nv = "nvim";
    # grep
    grep = "grep --color=auto";
    # python
    vimipython = "ipython --TerminalInteractiveShell.editing_mode=vi";
    # conda
    exportforge = "export PATH=$HOME/miniforge3/bin:$PATH";
    # network
    myip = "curl http://ipecho.net/plain; echo";
    # df
    df = "df -ahiT --total";
    # dua
    ncdu = "dua";
    du = "dua i";
    # memory
    free = "free -mt";
    # ps
    ps = "ps auxf";
    psgrep = "ps aux | grep -v grep | grep -i -e VSZ -e";
    # git status
    gst = "git status --short";
    # lazygit
    lg = "lazygit";
  };
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/npm-global/bin"
    "/var/lib/flatpak/exports/bin"
    "$HOME/.nix-profile/bin"
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    USE_EDITOR = "$EDITOR";
    VISUAL = "$EDITOR";
    BROWSER = "brave";
    NIXOS_OZONE_WL = "1";
  };
}
