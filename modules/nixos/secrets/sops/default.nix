{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.dotfiles; let
  cfg = config.dotfiles.secrets.sops;
  user = config.dotfiles.user;
in {
  options.dotfiles.secrets.sops = with types; {
    enable = mkBoolOpt false "Whether to enable the sops module";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      age
      sops
    ];

    sops = {
      defaultSopsFile = ../../../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      # FIXME: How do you access users.users.${cfg.name}?
      age.keyFile = "${config.users.users.${user.name}.home}/.config/sops/age/keys.txt";
      secrets.OPENAI_API_KEY = {
        owner = config.user.name;
      };
    };
  };
}
