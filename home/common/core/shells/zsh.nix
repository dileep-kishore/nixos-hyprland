{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = false;
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
    initExtra = ''
      bindkey '^ ' autosuggest-accept
      export OPENAI_API_KEY="$(cat ~/.secrets/openai_api_key.txt)"
      export ANTHROPIC_API_KEY="$(cat ~/.secrets/anthropic_api_key.txt)"
      export DIRENV_LOG_FORMAT=""
      # export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
      fast-theme XDG:catppuccin-mocha -q
      # Atuin
      zvm_after_init_commands+=(eval "$(atuin init zsh)")
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
        "dim-an/cod"
        "wfxr/forgit"
        "MichaelAquilina/zsh-autoswitch-virtualenv"
        "chisui/zsh-nix-shell"
        "nix-community/nix-zsh-completions"
      ];
    };
  };
  home.file.".config/fsh/catppuccin-mocha.ini".source = ./catppuccin-mocha.ini;
}
