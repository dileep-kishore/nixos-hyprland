{
  config,
  lib,
  pkgs,
  outputs,
  ...
}: {
  imports =
    [
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);
}
