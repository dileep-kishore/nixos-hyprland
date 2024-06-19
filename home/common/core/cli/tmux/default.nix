{pkgs, ...}: {
  home.packages = with pkgs; [
    tmux-sessionizer
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
      tmux-fzf
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

    extraConfig = ''
      set -ag terminal-overrides ",xterm-256color:RGB"

      # reload config
      bind r source-file ~/.config/tmux/tmux.conf

      # allow passthrough
      set-option -g allow-passthrough

      # status bar on bottom
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

      # tms
      bind o display-popup -E "tms switch"
      bind e command-prompt -p "Rename active session to: " "run-shell 'tms rename %1'"

      # theme and statusbar
      thm_base="#191724";
      thm_surface="#1f1d2e";
      thm_overlay="#26233a";
      thm_muted="#6e6a86";
      thm_subtle="#908caa";
      thm_text="#e0def4";
      thm_love="#eb6f92";
      thm_gold="#f6c177";
      thm_rose="#ebbcba";
      thm_pine="#31748f";
      thm_pine2="#3e8fb0";
      thm_foam="#9ccfd8";
      thm_foam2="#56949f";
      thm_iris="#c4a7e7";
      thm_hl_low="#21202e";
      thm_hl_med="#403d52";
      thm_hl_high="#524f67";

      set-option -g status-justify absolute-centre
      set-option -g status-keys vi
      set -g status-left-length 150
      set -g status-right-length 150
      set-option -g status-style fg=$thm_text,bg=$thm_base

      #+--- Pane borders ---+
      set -g pane-border-style fg=$thm_hl_low
      set -g pane-active-border-style fg=$thm_iris

      #+--- Bars LEFT ---+
      # Session name
      session_name="#[fg=$thm_base,bg=$thm_iris,bold,italics]  #S #[bg=$thm_base,fg=$thm_iris]";
      dir_section="#[bg=$thm_pine,fg=$thm_base]#[fg=$thm_base,bg=$thm_pine,bold]  #(~/.config/tmux/scripts/find_git_root.py #{pane_current_path}) #[bg=$thm_base,fg=$thm_pine]";
      git_status="#(~/.config/tmux/scripts/git_status.sh #{pane_current_path})"

      set -g status-left "$session_name $dir_section $git_status"

      #+--- Windows ---+
      # Status
      custom_icon_window_last="󰖰 ";
      custom_icon_window_current="󰖯 ";
      custom_icon_window_zoom="󰁌 ";
      custom_icon_window_mark="󰃀 ";
      custom_icon_window_silent="󰂛 ";
      custom_icon_window_activity="󰖲 ";
      custom_icon_window_bell="󰂞 ";
      show_window_status="#{?window_activity_flag,$custom_icon_window_activity,}#{?window_bell_flag,$custom_icon_window_bell,}#{?window_silence_flag,$custom_icon_window_silent,}#{?window_active,$custom_icon_window_current,}#{?window_last_flag,$custom_icon_window_last,}#{?window_marked_flag,$custom_icon_window_mark,}#{?window_zoomed_flag,$custom_icon_window_zoom,}";
      # Focus
      set -g window-status-current-format "#[fg=$thm_foam,bg=$thm_base]#[bg=$thm_foam,fg=$thm_base]#I #[fg=$thm_base,bg=$thm_foam2,bold,italics] #W $show_window_status #[bg=$thm_base,fg=$thm_foam2]"
      # Unfocused
      set -g window-status-format "#[fg=$thm_hl_high,bg=$thm_base]#[bg=$thm_hl_high,fg=$thm_text]#I #[fg=$thm_text,bg=$thm_hl_low] #W $show_window_status #[bg=$thm_base,fg=$thm_hl_low]"
      set -g window-status-separator " "

      #+--- Bars RIGHT ---+
      host_name="#[fg=$thm_iris,bg=$thm_base]#[fg=$thm_base,bg=$thm_iris,bold,italics]  #H ";
      uptime="#[fg=$thm_foam,bg=$thm_base]#[fg=$thm_base,bg=$thm_foam,italics]  #(~/.config/tmux/scripts/uptime_fmt.sh) #[fg=$thm_base,bg=$thm_foam]";
      date_section="#[fg=$thm_gold,bg=$thm_base]#[fg=$thm_base,bg=$thm_gold,bold]  #(date +'%a, %d %b, %Y') #[fg=$thm_base,bg=$thm_gold]";

      set -g status-right "$date_section#[bg=$thm_base,fg=$thm_base] $uptime#[bg=$thm_base,fg=$thm_base] $host_name"
    '';
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
