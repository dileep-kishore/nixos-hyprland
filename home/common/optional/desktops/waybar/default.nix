# https://github.com/Alexays/Waybar
{pkgs, ...}: {
  home.file.".config/waybar/toggl_status.py".source = ./toggl_status.py;
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        margin-left = 9;
        margin-right = 9;
        margin-top = 4;
        margin-bottom = 0;
        reload_style_on_change = true;
        spacing = 0;
        modules-left = [
          # "custom/spacer"
          "image"
          "wlr/taskbar"
          "niri/window"
          "custom/window-icon"
        ];
        modules-center = [
          "niri/workspaces"
        ];
        modules-right = [
          "custom/toggl-icon"
          "custom/toggl"
          "custom/audio-icon"
          "pulseaudio"
          "custom/network-icon"
          "network"
          # "memory"
          # "cpu"
          "custom/clock-icon"
          "clock"
          "custom/tray-icon"
          "tray"
          "backlight"
          "battery"
          "battery#bat2"
        ];

        # Module configuration: Left
        "custom/spacer" = {
          format = "   ";
          on-click = "walker";
        };
        "image" = {
          path = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          on-click = "niri msg action toggle-overview";
          size = 22;
          tooltip = false;
        };
        "hyprland/workspaces" = {
          disable-scroll = false;
          all-outputs = false;
          active-only = false;
          format = "<span><b>{icon}</b></span>";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            urgent = " ";
          };
        };
        "niri/workspaces" = {
          all-outputs = false;
          on-click = "activate";
          current-only = false;
          disable-scroll = false;
          icon-theme = "Papirus-Dark";
          format = "<span><b>{icon}</b></span>";
          format-icons = {
            "active" = " 󰚍 ";
            "focused" = " 󰚍 ";
            "default" = "  ";
          };
        };
        "wlr/taskbar" = {
          all-outputs = false;
          format = "{icon}";
          icon-theme = "Papirus-Dark";
          icon-size = 20;
          tooltip = true;
          tooltip-format = "{title}";
          active-first = true;
          on-click = "activate";
        };
        "hyprland/window" = {
          max-length = 50;
          format = "<i>{title}</i>";
          separate-outputs = true;
          icon = true;
          icon-size = 13;
        };
        "niri/window" = {
          max-length = 50;
          format = "{app_id}";
          separate-outputs = true;
          # icon = true;
          # icon-size = 18;
          rewrite = {
            "" = "<span foreground='#89b4fa'> Niri</span>";
            " " = "<span foreground='#89b4fa'> Niri</span>";
            # terminals
            "com.mitchellh.ghostty" = "<span foreground='#89b4fa'>󰊠 Ghostty</span>";
            "org.wezfurlong.wezterm" = "<span foreground='#89b4fa'> Wezterm</span>";
            "kitty" = "<span foreground='#89b4fa'>󰄛 Kitty</span>";
            # code
            "code" = "<span foreground='#89b4fa'>󰨞 Code</span>";
            "Cursor" = "<span foreground='#89b4fa'>󰨞 Cursor</span>";
            # browsers
            "brave-browser" = "<span foreground='#89b4fa'> Brave</span>";
            "firefox" = "<span foreground='#89b4fa'> Firefox</span>";
            "zen" = "<span foreground='#89b4fa'> Zen</span>";
            # gnome/gtk
            "org.gnome.Nautilus" = "<span foreground='#89b4fa'>󰪶 Files</span>";
            # misc
            "spotify" = "<span foreground='#89b4fa'> Spotify</span>";
            "Slack" = "<span foreground='#89b4fa'> Slack</span>";
            "signal" = "<span foreground='#89b4fa'>󰭹 Signal</span>";
            # Productivity
            "Morgen" = "<span foreground='#89b4fa'> Morgen</span>";
            "org.kde.okular" = "<span foreground='#89b4fa'> Okular</span>";
            "tana" = "<span foreground='#89b4fa'>󰠮 Tana</span>";
            "obsidian" = "<span foreground='#89b4fa'>󰠮 Obsdian</span>";
            "Zotero" = "<span foreground='#89b4fa'>󰬡 Zotero</span>";
            "org.pulseaudio.pavucontrol" = "<span foreground='#89b4fa'> Pavucontrol</span>";
            # Everything else
            "(.*)" = "<span foreground='#89b4fa'>$1</span>";
          };
        };

        # Module configuration: Center
        clock = {
          format = "<b>{:%a %b[%m] %d ▒ %I:%M %p}</b>";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%H:%M %Y-%m-%d}";
        };

        # Module configuration: Right
        pulseaudio = {
          format = "{volume}%{format_source}";
          format-bluetooth = "{volume}% {format_source}";
          format-bluetooth-muted = " {format_source}";
          format-muted = "{format_source}";
          format-source = "";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };
        network = {
          format-wifi = "{bandwidthDownBits}";
          format-ethernet = "{bandwidthDownBits}";
          tooltip-format = "{essid} ({signalStrength}%)";
          format-linked = "{ifname} (No IP)";
          format-disconnected = "󰅛 ";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        cpu = {
          format = "{usage}%  ";
          tooltip = false;
        };
        memory = {format = "{}%  ";};
        backlight = {
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        battery = {
          states = {
            # good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" ""];
        };
        "battery#bat2" = {bat = "BAT2";};
        tray = {
          icon-size = 18;
          spacing = 10;
        };
        "custom/toggl" = {
          format = "{}";
          exec = "$HOME/.config/waybar/toggl_status.py";
          interval = 10;
          on-click = "toggl stop";
        };
        # Custom icons
        "custom/toggl-icon" = {format = "󱎫";};
        "custom/audio-icon" = {format = "";};
        "custom/network-icon" = {format = "󰖩";};
        "custom/backlight-icon" = {format = "󰌵";};
        "custom/battery-icon" = {format = "󰁹";};
        "custom/clock-icon" = {format = "";};
        "custom/tray-icon" = {
          format = "󱊖";
          on-click = "swaync-client -t";
        };
        "custom/window-icon" = {
          format = " ";
          on-click = "walker --modules windows";
        };
      };
    };
  };
}
