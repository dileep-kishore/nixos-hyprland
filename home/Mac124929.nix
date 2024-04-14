{
  config,
  outputs,
  ...
}: {
  imports =
    [
      ./common/core
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
