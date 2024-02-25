{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    prefix = "C-a";
    terminal = "tmux-256color";
    tmuxp.enable = true;

    plugins = with pkgs.tmuxPlugins; [
      # NOTE: catppuccin must be before resurrect and continuum
      (catppuccin.overrideAttrs (_: {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "tmux";
          rev = "a0119d25283ba2b18287447c1f86720a255fb65";
          sha256 = "sha256-SGJjDrTrNNxnurYV1o1KbHRIHFyfmbXDX/t4KN8VCao=";
        };
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'
          set -g @catppuccin_window_status_enable "yes"
          set -g @catppuccin_window_status_icon_enable "yes"
          set -g @catppuccin_window_tabs_enabled on

          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"

          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_background "#11111b"
          set -g @catppuccin_window_current_text "#W"

          set -g @catppuccin_window_left_separator "█"
          set -g @catppuccin_window_right_separator "█ "
          set -g @catppuccin_window_middle_separator "█ "
          set -g @catppuccin_window_number_position "left"

          set -g @catppuccin_status_modules_left "session"
          set -g @catppuccin_status_modules_right "directory user host date_time"
          set -g @catppuccin_status_left_separator  "█"
          set -g @catppuccin_status_right_separator "█ "
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_connect_separator "no"

          set -g @catppuccin_icon_window_last "󰖰 "
          set -g @catppuccin_icon_window_current "󰖯 "
          set -g @catppuccin_icon_window_zoom "󰁌 "
          set -g @catppuccin_icon_window_mark "󰃀 "
          set -g @catppuccin_icon_window_silent "󰂛 "
          set -g @catppuccin_icon_window_activity "󰖲 "
          set -g @catppuccin_icon_window_bell "󰂞 "

          set -g @catppuccin_directory_text "#(echo #{pane_current_path} | sed 's|^$HOME|~|')"
          set -g @catppuccin_date_time_text "#[italics]%e %b %Y"
        '';
      }))
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

    extraConfig = ''
      set -ag terminal-overrides ",xterm-256color:RGB"

      # reload config
      bind r source-file ~/.config/tmux/tmux.conf

      # allow passthrough
      set-option -g allow-passthrough

      # status bar on top
      set -g status-position top

      # Set border colors
      set -g pane-border-lines heavy

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

      # binding to resize panes
      bind -n M-Up resize-pane -U 5
      bind -n M-Down resize-pane -D 5
      bind -n M-Left resize-pane -L 5
      bind -n M-Right resize-pane -R 5
    '';
  };
}
