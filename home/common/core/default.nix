{
  config,
  lib,
  pkgs,
  outputs,
  ...
}: {
  imports =
    [
      ./apps
      ./cli
      ./code
      ./fonts.nix
      ./shells
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);
}
