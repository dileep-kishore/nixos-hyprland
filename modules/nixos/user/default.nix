{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.dotfiles; let
  cfg = config.dotfiles.user;
in {
  options.dotfiles.user = with types; {
    name = mkOpt str "dileep" "The user account.";

    fullName = mkOpt str "Dileep Kishore" "The full name of the user.";
    email = mkOpt str "k.dileep1994@gmail.com" "The email of the user.";
  };

  # TODO: Continue from here
  config = {
    home = {
    };
  };

  users.users.${cfg.name} = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "libvirt" "docker" "vboxusers"];
    home = "/home/${cfg.name}";
    description = "Dileep";
    shell = pkgs.zsh;
  };
}
