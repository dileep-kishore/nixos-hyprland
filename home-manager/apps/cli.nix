{
  programs.bash.enable = true;

  programs.atuin = {
    enable = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      sync_address = "https://api.atuin.sh";
      filter_mode = "host";
      search_mode = "fuzzy";
      filter_mode_shell_up_key_binding = "directory";
      search_mode_shell_up_key_binding = "fuzzy";
      keymap_mode = "vim-insert";
      show_preview = true;
      style = "compact";
      invert = false;
      inline_height = 20;
    };
  };

  programs.eza = {
    enable = true;
    git = true;
    icons = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--height 40%"
      "--reverse"
      "--preview 'bat --style=numbers --color=always --line-range :500 {}'"
      "--color=fg:#908caa,bg:#191724,hl:#ebbcba"
      "--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba"
      "--color=border:#403d52,header:#31748f,gutter:#191724"
      "--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52"
      "--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
    ];
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
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
    options = ["--cmd" "cd"];
  };

  programs.gh = {
    enable = true;
  };

  # tmux
  home.file.".config/tmux" = {
    recursive = true;
    source = ./config/tmux;
  };

  # conda
  home.file.".condarc".source = ./config/.condarc;
  # npm
  home.file.".npmrc".source = ./config/.npmrc;
  # stylua
  home.file.".config/stylua.toml".source = ./config/stylua.toml;
  # bat
  home.file.".config/bat" = {
    recursive = true;
    source = ./config/bat;
  };
  # btop
  home.file.".config/btop" = {
    recursive = true;
    source = ./config/btop;
  };
  # mods
  home.file.".config/mods" = {
    recursive = true;
    source = ./config/mods;
  };
}
