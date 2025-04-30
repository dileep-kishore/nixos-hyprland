{
  config,
  outputs,
  ...
}: {
  imports = [
    ./common/core
    ./common/optional/desktops/hyprland
    ./common/optional/apps/linux-only.nix
    ./common/optional/apps/wezterm
    ./common/optional/apps/kitty
    ./common/optional/apps/ghostty
    ./common/optional/apps/ulauncher
    ./common/optional/apps/slack.nix
    ./common/optional/apps/code.nix
    ./common/optional/apps/rofi
    ./common/optional/apps/wofi
    ./common/optional/apps/walker
    ./common/optional/desktops/waybar
    ./common/optional/desktops/services/mako
    ./common/optional/desktops/gtk.nix
    ./common/optional/desktops/qt5.nix
    ./common/optional/desktops/xdg.nix
    # NOTE: espanso disabled because it's not working on wayland
    # ./common/optional/misc/espanso.nix
    # NOTE: gammastep disabled because of flickering issue
    # ./common/optional/misc/gammastep.nix
  ];

  home = {
    username = "dileep";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.11";
  };
}
