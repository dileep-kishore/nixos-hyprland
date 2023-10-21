{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      bindkey '^ ' autosuggest-accept
    '';
    sessionVariables = {
      EDITOR = "nvim";
    };
    # antidote.enable = true;
  };
}
