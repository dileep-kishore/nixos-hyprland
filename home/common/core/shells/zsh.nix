{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # NOTE: This will speed up startup by caching the completion
    completionInit = ''
      autoload -Uz compinit; compinit -C
      (autoload -Uz compinit; compinit &)
    '';
    autosuggestion.enable = true;
    autocd = true;
    history.extended = true;
    # NOTE: You can use these as `cd ~dots` or `cd ~docs` etc.
    dirHashes = {
      dots = "$HOME/nixos-hyprland";
      docs = "$HOME/Documents";
      down = "$HOME/Downloads";
      paperwork = "$HOME/Documents/Work/Paperwork";
      work = "$HOME/Documents/Work";
      personal = "$HOME/Documents/Personal";
    };
    initContent = ''
      bindkey '^ ' autosuggest-accept
      export OPENAI_API_KEY="$(cat ~/.secrets/openai_api_key.txt)"
      export ANTHROPIC_API_KEY="$(cat ~/.secrets/anthropic_api_key.txt)"
      export DIRENV_LOG_FORMAT=""
      # export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
      fast-theme XDG:catppuccin-mocha -q
      # carapace
      setopt menucomplete
      export LS_COLORS=$(vivid generate catppuccin-mocha)
      zstyle ':completion:*' menu select
      export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
      zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
      zstyle ':completion:*' list-colors $LS_COLORS
      # Atuin
      zvm_after_init_commands+=(eval "$(atuin init zsh)")
      ZJ_LAYOUT_DIR=$(zellij setup --check \
        | grep "LAYOUT DIR" - \
        | grep -o '".*"' - | tr -d '"')
    '';
    # profileExtra = { };
    # shellAliases = { };
    # shellGlobalAliases = { };
    antidote = {
      enable = true;
      plugins = [
        "zdharma-continuum/fast-syntax-highlighting"
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
        "jeffreytse/zsh-vi-mode"
        "djui/alias-tips"
        "wfxr/forgit"
        "MichaelAquilina/zsh-autoswitch-virtualenv"
      ];
    };
  };
  home.file.".config/fsh/catppuccin-mocha.ini".source = ./catppuccin-mocha.ini;
}
