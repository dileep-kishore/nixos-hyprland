# https://github.com/Alexays/Waybar
{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        margin-left = 0;
        margin-right = 0;
        margin-top = 0;
        margin-bottom = 0;
        reload_style_on_change = true;
        spacing = 4;
        modules-left = [
          "custom/spacer"
          "hyprland/workspaces"
          "wlr/taskbar"
          "hyprland/window"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "backlight"
          "battery"
          "battery#bat2"
          "tray"
        ];

        # Module configuration: Left
        "custom/spacer" = {
          format = "   ";
        };
        "hyprland/workspaces" = {
          disable-scroll = false;
          all-outputs = false;
          active-only = false;
          format = "<span><b>{icon}</b></span>";
          format-icons = {
            default = " ";
            active = " ";
            empty = " ";
            urgent = " ";
          };
        };
        "wlr/taskbar" = {
          all-outputs = false;
          format = "{icon}";
          icon-size = 18;
          tooltip = true;
          tooltip-format = "{title}";
          active-first = false;
        };
        "hyprland/window" = {
          max-length = 50;
          format = "{title}";
          separate-outputs = true;
          icon = false;
          icon-size = 18;
        };

        # Module configuration: Center
        clock = {
          format = "<b>{:%a %b[%m] %e, %I:%M %p}</b>";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%H:%M %Y-%m-%d}";
        };

        # Module configuration: Right
        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
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
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory = {format = "{}% ";};
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
      };
    };
  };
}
