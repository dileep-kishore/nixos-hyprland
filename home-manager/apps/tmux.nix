{ config, lib, pkgs, ... }:
{
  programs.tmux =
    {
      enable = true;
      clock24 = true;
      baseIndex = 1;
      keyMode = "vi";
      mouse = true;
      prefix = "C-a";
      terminal = "tmux-256color";
      tmuxp.enable = true;

      plugins = with pkgs.tmuxPlugins; [
        sensible
        yank
        vim-tmux-navigator
        copycat
        pain-control
        sessionist
        open
        tmux-fzf
        {
          plugin = resurrect;
          extraConfig = "set -g @resurrect-strategy-nvim 'session'";
        }
        {
          plugin = continuum;
          extraConfig = ''
            set -g @resurrect-capture-pane-contents 'on'
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '60' # minutes
          '';
        }
        {
          plugin = catppuccin;
          extraConfig = ''
            set -g @catppuccin_flavour 'mocha'
            set -g @catppuccin_window_status_enable "yes"
            set -g @catppuccin_window_status_icon_enable "yes"
            set -g @catppuccin_status_fill "icon"
            set -g @catppuccin_window_default_fill "number"
            set -g @catppuccin_window_current_fill "number"
            set -g @catppuccin_window_default_text "#W"
            set -g @catppuccin_window_current_text "#W"
            set -g @catppuccin_status_connect_separator "yes"
            set -g @catppuccin_status_modules_right "host user date_time"
            set -g @catppuccin_status_modules_left "session directory"
          '';
        }
      ];

      extraConfig = ''
        set -ag terminal-overrides ",xterm-256color:RGB"
        # reload config
        bind r source-file ~/.config/tmux/tmux.conf

        # Shift arrow to switch windows
        bind -n S-Left previous-window
        bind -n S-Right next-window

        # copy mode key binds
        bind -T copy-mode-vi v send -X begin-selection
        bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"
        bind P paste-buffer
        bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "wl-copy"

        # set title
        set-option -g set-titles on
        set-option -g set-titles-string '#S: #W - TMUX'
      '';
    };
}
