{
  hostName,
  pkgs,
  ...
}: let
  monitorConfig =
    if hostName == "tsuki"
    then [
      # top monitor
      "DP-1,highres,1080x0,1"
      # bottom monitor
      "DP-2,highres,1080x1440,1"
      # left monitor
      "HDMI-A-1,highres,0x0,1,transform,1"
    ]
    else if hostName == "nixos-xps"
    then [
      # laptop monitor
      ",highres,auto,1"
    ]
    else throw "Unsupported hostname for monitor configuration";

  workspaceRules =
    if hostName == "tsuki"
    then [
      "4, monitor:HDMI-A-1"
      "5, monitor:HDMI-A-1"
      "9, monitor:HDMI-A-1"
    ]
    else if hostName == "nixos-xps"
    then []
    else throw "Unsupported hostname for workspace rules";

  kbOptions =
    if hostName == "tsuki"
    then ""
    else if hostName == "nixos-xps"
    then "ctrl:nocaps"
    else throw "Unsupported hostname for kb_options";
in {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    sourceFirst = true;
    settings = {
      source = [
        "~/.config/hypr/mocha.conf" # Theme
      ];
      monitor = monitorConfig;
      exec-once = [
        "hyprpaper"
        "hyprctl setcursor Bibata-Original-Ice 24"
        "proton-pass"
        "sleep 10; morgen"
        "nm-applet"
      ];
      env = [
        "XCURSOR_SIZE,24"
        "WLR_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
      ];
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_rules = "";
        kb_options = kbOptions;
        follow_mouse = 1;
        touchpad = {
          natural_scroll = false;
        };
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 4;
        "col.active_border" = "$mauve";
        "col.inactive_border" = "$surface0";
        layout = "dwindle";
      };
      group = {
        "col.border_active" = "$mauve";
        "col.border_inactive" = "$surface0";
        groupbar = {
          font_family = "Maple Mono NF";
          font_size = 12;
          gradients = true;
          text_color = "$crust";
          "col.active" = "$mauve";
          "col.inactive" = "$overlay0";
        };
      };
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 0.95;
        dim_inactive = true;
        dim_strength = 0.1;
        blur = {
          enabled = true;
          size = 8;
          passes = 2;
          popups = true;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          # color = "$base";
        };
      };
      binds = {
        movefocus_cycles_fullscreen = false;
        workspace_center_on = 1;
        focus_preferred_method = 0;
      };
      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 200, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
        default_split_ratio = 1.2;
      };
      master = {
        new_status = "slave";
      };
      gestures = {workspace_swipe = false;};
      misc = {
        disable_hyprland_logo = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };
      # Window rules
      windowrulev2 = [
        # Ulauncher window rules
        "noborder,title:^(.*ulauncher.*)$"
        "noborder,title:^(.*Ulauncher.*)$"
        "noshadow,title:^(.*ulauncher.*)$"
        "noshadow,title:^(.*Ulauncher.*)$"
        "dimaround,title:^(.*ulauncher.*)$"
        "dimaround,title:^(.*Ulauncher.*)$"
        # Floating kitty terminal window rules
        "float,class:^(kitty-float)$"
        "move 10% 59%,class:^(kitty-float)$"
        "size 80% 40%,class:^(kitty-float)$"
        # Set new window workspaces
        "workspace 3,class:^(.*code.*)$"
        "workspace 4,class:^(Morgen)$"
        "workspace 5,class:^(Slack)$"
        "workspace 7,class:^(ClickUp)$"
        "workspace 8,class:^(obsidian)$"
        "workspace 9,class:^(Zotero)$"
      ];
      # Set workspace rules
      workspace = workspaceRules;
      # Keybindings
      "$mainMod" = "SUPER";
      "$subMod" = "SUPER_SHIFT";
      "$tetMod" = "SUPER_CTRL";
      bind =
        [
          "$mainMod, return, exec, kitty"
          "$subMod, return, exec, hdrop kitty --class 'kitty-float'"
          "$subMod, Q, killactive,"
          "$subMod, E, exit,"
          "$subMod, M, exec, pkill waybar && waybar"
          "$mainMod, E, exec, nautilus"
          "$mainMod, C, exec, clickup-latest"
          "$mainMod, R, exec, ~/.config/niri/scripts/walker.sh"
          "$tetMod, S, togglesplit,"
          "$tetMod, R, exec, ~/.config/hypr/scripts/screenshot.sh region"
          "$tetMod, M, exec, ~/.config/hypr/scripts/screenshot.sh activemonitor"
          "$tetMod, W, exec, ~/.config/hypr/scripts/screenshot.sh activewindow"
          # Move focus with mainMod + arrow keys
          "$mainMod, h, movefocus, l"
          "$mainMod, l, movefocus, r"
          "$mainMod, k, movefocus, u"
          "$mainMod, j, movefocus, d"
          # Groups
          "$tetMod, G, togglegroup"
          "$tetMod, h, moveintogroup, l"
          "$tetMod, l, moveintogroup, r"
          "$tetMod, k, moveintogroup, u"
          "$tetMod, j, moveintogroup, d"
          "$tetMod, n, changegroupactive, f"
          "$tetMod, p, changegroupactive, b"
          # Move to next/previous workspace with subMod + h/l
          "$subMod, H, workspace, m-1"
          "$subMod, L, workspace, m+1"
          # Resize windows with subMod + h,j,k,l
          "$subMod, left, resizeactive, -10 0"
          "$subMod, down, resizeactive, 0 10"
          "$subMod, up, resizeactive, 0 -10"
          "$subMod, right, resizeactive, 10 0"
          # Scroll through existing workspaces with mainMod + scroll
          "$mainMod, mouse_down, workspace, m-1"
          "$mainMod, mouse_up, workspace, m+1"
          # Layout toggles
          "$mainMod, t, layoutmsg, togglesplit"
          "$mainMod, s, layoutmsg, swapsplit"
          "$mainMod, w, swapnext"
          "$mainMod, m, fullscreen, 1"
          "$subMod, m, fullscreen, 0"
          "$mainMod, f, togglefloating"
          # Move current workspace to another monitor
          # NOTE: This will only work on tsuki (assuming vert=1, top=2 and bottom=3)
          "$tetMod, 1, movecurrentworkspacetomonitor, HDMI-A-1"
          "$tetMod, 2, movecurrentworkspacetomonitor, DP-1"
          "$tetMod, 3, movecurrentworkspacetomonitor, DP-2"
        ]
        ++ (
          # Switch workspaces with mainMod + [0-9]
          # Move active window to a workspace with subMod + [0-9]
          builtins.concatLists (builtins.genList (
              i: let
                ws = i + 1;
              in [
                "$mainMod, code:1${toString i}, workspace, ${toString ws}"
                "$subMod, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
    # plugins = [];
    # extraConfig = "";
  };
}
