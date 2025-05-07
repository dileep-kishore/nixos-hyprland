{
  config,
  outputs,
  ...
}: {
  imports =
    [
      ./common/core
      ./common/optional/desktops/niri
      ./common/optional/apps/linux-only.nix
      ./common/optional/apps/ulauncher
      ./common/optional/apps/walker
      ./common/optional/desktops/waybar
      ./common/optional/desktops/gtk.nix
      ./common/optional/desktops/qt5.nix
      ./common/optional/desktops/xdg.nix
      ./common/optional/apps/wezterm/config.nix
      ./common/optional/apps/kitty/config.nix
      ./common/optional/apps/ghostty/config.nix
      ./common/optional/apps/slack.nix
      # NOTE: espanso disabled because it's not working on wayland
      # ./common/optional/misc/espanso.nix
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  home = {
    username = "g8k";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.11";
  };
}
