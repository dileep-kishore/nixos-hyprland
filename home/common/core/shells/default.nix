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
    # ncdu
    du = "ncdu --color dark -rr -x --exclude .git --exclude node_modules";
    # memory
    free = "free -mt";
    # ps
    ps = "ps auxf";
    psgrep = "ps aux | grep -v grep | grep -i -e VSZ -e";
  };
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    TERM = "xterm-256color";
    USE_EDITOR = "$EDITOR";
    VISUAL = "$EDITOR";
    BROWSER = "brave";
  };
}
