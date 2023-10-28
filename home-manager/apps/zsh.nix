{
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
        "ohmyzsh/ohmyzsh path:plugins/command-not-found"
        "ohmyzsh/ohmyzsh path:plugins/extract"
        "ohmyzsh/ohmyzsh path:plugins/git"
        "ohmyzsh/ohmyzsh path:plugins/git-extras"
        "ohmyzsh/ohmyzsh path:plugins/gitignore"
        "ohmyzsh/ohmyzsh path:plugins/magic-enter"
        "ohmyzsh/ohmyzsh path:plugins/npm"
        "ohmyzsh/ohmyzsh path:plugins/pyenv"
        "ohmyzsh/ohmyzsh path:plugins/python"
        "ohmyzsh/ohmyzsh path:plugins/tmux"
      ];
    };
  };
}
