{ config, lib, pkgs, ... }:
{
  home.shellAliases = {
    # rm alias
    rm = "rm -i";
    # clear
    clear = "clear -x";
    cls = "clear";
    # tmux
    tnew = "tmux new -s";
    ta = "tmux attach -t";
    tdetach = "tmux detach";
    tkill = "tmux kill-session -t";
    tlist = "tmux ls";
    # bat
    bat = "bat --theme='Catppuccin-mocha'";
    # grep
    grep = "grep --color=auto";
    # python
    vimipython = "ipython --TerminalInteractiveShell.editing_mode=vi";
    # conda
    exportforge = "export PATH=$HOME/miniforge3/bin:$PATH";
    # nnn
    nnn = "nnn -de";
    # network
    myip = "curl http://ipecho.net/plain; echo";
    # ncdu
    df = "df -ahiT --total";
    du = "ncdu --color dark -rr -x --exclude .git --exclude node_modules";
    # memory
    free = "free -mt";
    ps = "ps auxf";
    psgrep = "ps aux | grep -v grep | grep -i -e VSZ -e";
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    history.extended = true;
    dirHashes = {
      dots = "$HOME/nixos-hyprland";
      docs = "$HOME/Documents";
      down = "$HOME/Downloads";
      paperwork = "$HOME/Documents/Work/Paperwork";
      work = "$HOME/Documents/Work";
      personal = "$HOME/Documents/Personal";
    };
    initExtra = ''
      bindkey '^ ' autosuggest-accept
    '';
    sessionVariables = {
      EDITOR = "nvim";
      TERM = "xterm-256color";
      USE_EDITOR = "$EDITOR";
      VISUAL = "$EDITOR";
      BROWSER = "vivaldi";
      NNN_PLUG = "b:bookmarks;c:fzcd;d:diffs;f:finder;i:imgview;m:mimelist;n:nuke;o:fzopen;p:preview-tui;r:renamer;u:getplugs;z:autojump";
      NNN_ARCHIVE = "\\.(7z|bz2|gz|tar|tgz|zip)$";
      BAT_THEME = "Catppuccin-mocha";
    };
    # profileExtra = { };
    # shellAliases = { };
    # shellGlobalAliases = { };
    antidote = {
      enable = true;
      plugins = [
        "ohmyzsh/ohmyzsh path:lib/git.zsh"
        "ohmyzsh/ohmyzsh path:lib/clipboard.zsh"
        "ohmyzsh/ohmyzsh path:plugins/aliases"
        "ohmyzsh/ohmyzsh path:plugins/copypath"
        "ohmyzsh/ohmyzsh path:plugins/colored-man-pages"
        "ohmyzsh/ohmyzsh path:plugins/extract"
        "ohmyzsh/ohmyzsh path:plugins/git"
        "ohmyzsh/ohmyzsh path:plugins/git-extras"
        "ohmyzsh/ohmyzsh path:plugins/magic-enter"
        "ohmyzsh/ohmyzsh path:plugins/npm"
        "ohmyzsh/ohmyzsh path:plugins/pyenv"
        "ohmyzsh/ohmyzsh path:plugins/python"
        "ohmyzsh/ohmyzsh path:plugins/tmux"
        "djui/alias-tips"
        "dim-an/cod"
        "wfxr/forgit"
        "MichaelAquilina/zsh-autoswitch-virtualenv"
        "trapd00r/LS_COLORS"
      ];
    };
  };
}
