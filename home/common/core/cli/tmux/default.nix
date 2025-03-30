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
      # undercurl support
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
      # underscore colours - needs tmux-3.0
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

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

      # tms
      bind o display-popup -E "tms switch"
      bind e command-prompt -p "Rename active session to: " "run-shell 'tms rename %1'"

      # theme and statusbar
      thm_base="#1e1e2e";
      thm_text="#cdd6f4";
      thm_rosewater="#f5e0dc";
      thm_flamingo="#f2cdcd";
      thm_pink="#f5c2e7";
      thm_mauve="#cba6f7";
      thm_red="#f38ba8";
      thm_maroon="#eba0ac";
      thm_peach="#fab387";
      thm_yellow="#f9e2af";
      thm_green="#a6e3a1";
      thm_teal="#94e2d5";
      thm_sky="#89dceb";
      thm_sapphire="#74c7ec";
      thm_blue="#89b4fa";
      thm_lavender="#b4befe";
      thm_subtext_1="#a6adc8";
      thm_subtext_0="#bac2de";
      thm_overlay_2="#9399b2";
      thm_overlay_1="#7f849c";
      thm_overlay_0="#6c7086";
      thm_surface_2="#585b70";
      thm_surface_1="#45475a";
      thm_surface_0="#313244";
      thm_mantle="#181825";
      thm_crust="#11111b";

      set-option -g status-justify absolute-centre
      set-option -g status-keys vi
      set -g status-left-length 150
      set -g status-right-length 150
      set-option -g status-style fg=$thm_text,bg=$thm_base

      #+--- Pane borders ---+
      set -g pane-border-style fg=$thm_surface_2
      set -g pane-active-border-style fg=$thm_mauve

      SEP="󰇝"
      # SEP="▒"
      LSEP="▒"
      RSEP="▒"

      #+--- Bars LEFT ---+
      RESET="#[fg=$thm_text,bg=$thm_base,nobold,noitalics,nounderscore,nodim]"
      # Session name
      session_name="#[fg=$thm_mauve,bg=$thm_base,italics] #S #[fg=$thm_mauve,bg=$thm_base,bold]  $LSEP";
      dir_section=" #[fg=$thm_blue,bg=$thm_base]#(~/.config/tmux/scripts/find_git_root.py #{pane_current_path}) #[fg=$thm_blue,bg=$thm_base,bold]  $LSEP";

      set -g status-left "$session_name$RESET$dir_section$RESET"

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
      set -g window-status-current-format "#[bg=$thm_base,fg=$thm_mauve]#I:#[fg=$thm_mauve,bg=$thm_base,italics] #W $show_window_status"
      # Unfocused
      set -g window-status-format "#[bg=$thm_base,fg=$thm_overlay_2]#I:#[fg=$thm_overlay_2,bg=$thm_base] #W $show_window_status"
      set -g window-status-separator " "

      #+--- Bars RIGHT ---+
      host_name="#[fg=$thm_mauve,bg=$thm_base]#[fg=$thm_base,bg=$thm_mauve,bold,italics]  #H ";
      date_section="#[fg=$thm_yellow,bg=$thm_base,bold]$RSEP  $RESET#[fg=$thm_yellow,bg=$thm_base]#(date +'%a, %d %b')";
      uptime="#[fg=$thm_green,bg=$thm_base,bold]$RSEP  $RESET#[fg=$thm_green,bg=$thm_base]#(~/.config/tmux/scripts/uptime_fmt.sh)";

      git_status="#(~/.config/tmux/scripts/git_status.sh #{pane_current_path})"
      wb_git_status="#(~/.config/tmux/scripts/wb_git_status.sh #{pane_current_path})"

      set -g status-right "$RESET$uptime $RESET$date_section $git_status$wb_git_status"
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
