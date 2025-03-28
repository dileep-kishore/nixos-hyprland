{
  config,
  outputs,
  ...
}: {
  imports =
    [
      ./common/core
      ./common/optional/apps/linux-only.nix
      ./common/optional/apps/ulauncher
      ./common/optional/desktops/gtk.nix
      ./common/optional/desktops/qt5.nix
      ./common/optional/desktops/xdg.nix
      ./common/optional/apps/wezterm/config.nix
      ./common/optional/apps/kitty
      ./common/optional/apps/ghostty
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
