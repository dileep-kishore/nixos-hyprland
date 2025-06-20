{pkgs, ...}: {
  home.packages = with pkgs; [
    sesh
    tmuxinator
  ];
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    prefix = "C-a";
    terminal = "tmux-256color";
    tmuxp.enable = false;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      vim-tmux-navigator
      copycat
      pain-control
      sessionist
      open
      tmux-thumbs
      extrakto
    ];

    extraConfig = builtins.readFile ./tmux.conf;
  };

  # aliases
  home.shellAliases = {
    ta = "sesh connect";
    tdetach = "tmux detach";
    tkill = "tmux kill-session -t";
    tlist = "sesh list -tT --icons";
  };

  # copy over scripts
  home.file.".config/tmux/scripts" = {
    recursive = true;
    source = ./scripts;
  };

  # copy over templates
  home.file.".config/tmux/templates" = {
    recursive = true;
    source = ./templates;
  };
}
