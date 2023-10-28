{
  programs.atuin = {
    enable = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      sync_address = "https://api.atuin.sh";
      search_mode = "fuzzy";
      search_mode_shell_up_key_binding = "fuzzy";
      style = "compact";
      invert = true;
      inline_height = 20;
    };
  };

  programs.lsd = {
    enable = true;
    enableAliases = true;
  };

  programs.dircolors = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--height 40%"
      "--reverse"
      "--preview 'bat --style=numbers --color=always --line-range :500 {}'"
    ];
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.lazygit = {
    enable = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.navi = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.gh = {
    enable = true;
  };

  programs.pyenv = {
    enable = true;
  };

  home.file.".zprofile".source = ./config/.zprofile;
  home.file.".profile".source = ./config/.profile;
  home.file.".condarc".source = ./config/.condarc;

}
