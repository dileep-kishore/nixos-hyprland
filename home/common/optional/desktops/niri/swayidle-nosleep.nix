# Ref: https://github.com/hallettj/home.nix/blob/main/home-manager/features/niri/swayidle.nix
{
  pkgs,
  lib,
  ...
}: let
  niri-bin = "${pkgs.niri-unstable}/bin/niri";
in {
  services.swayidle = let
    seconds = 1;
    minutes = 60 * seconds;
    screen-blank-timeout = 15 * minutes;
    lock-after-blank-timeout = 5 * minutes;

    loginctl = "${pkgs.systemd}/bin/loginctl";
    swaylock = "usr/bin/swaylock";

    lock-session = pkgs.writeShellScript "lock-session" ''
      ${swaylock} -f
      ${niri-bin} msg action power-off-monitors
    '';

    before-sleep = pkgs.writeShellScript "before-sleep" ''
      ${loginctl} lock-session
    '';
  in {
    enable = true;
    timeouts = [
      {
        timeout = screen-blank-timeout;
        command = "${niri-bin} msg action power-off-monitors";
      }
      {
        timeout = screen-blank-timeout + lock-after-blank-timeout;
        command = "${loginctl} lock-session";
      }
    ];
    events = [
      {
        event = "lock";
        command = lock-session.outPath;
      }
      {
        event = "before-sleep";
        command = before-sleep.outPath;
      }
    ];
    systemdTarget = "niri.service";
  };

  systemd.user.services.swayidle.Unit.After = lib.mkForce "niri.service";
}
