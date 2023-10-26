{
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

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.gh = {
    enable = true;
  };
}
