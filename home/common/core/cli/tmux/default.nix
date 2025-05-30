{pkgs, ...}: {
  home.packages = with pkgs; [
    sesh
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
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes
        '';
      }
    ];

    extraConfig = builtins.readFile ./tmux.conf;
  };

  # aliases
  home.shellAliases = {
    tnew = "tmux new -s";
    ta = "tmux attach -t";
    tdetach = "tmux detach";
    tkill = "tmux kill-session -t";
    tlist = "tmux ls";
  };

  # copy over scripts
  home.file.".config/tmux/scripts" = {
    recursive = true;
    source = ./scripts;
  };
}
