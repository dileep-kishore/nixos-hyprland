{lib, ...}: {
  # Ref: https://github.com/hallettj/home.nix/blob/main/home-manager/features/niri/default.nix
  services.blueman-applet.enable = true;
  systemd.user.services.blueman-applet.Install = lib.mkForce {
    # Replace "graphical-session.target" so that this only starts when Niri starts.
    WantedBy = ["tray.target"];
  };

  services.network-manager-applet.enable = true;
  systemd.user.services.network-manager-applet.Install = lib.mkForce {
    # Replace "graphical-session.target" so that this only starts when Niri starts.
    WantedBy = ["tray.target"];
  };

  # Some services, like blueman-applet, require a `tray` target. Typically Home
  # Manager sets this target in WM modules, but it's not set up for Niri yet.
  systemd.user.targets.tray = {
    Unit = {
      Description = "Target for apps that want to start minimized to the system tray";
      After = ["niri.service"];
    };
    Install = {
      WantedBy = ["niri.service"];
    };
  };

  # Use Gnome Keyring as SSH agent
  services.gnome-keyring = {
    enable = true;
    components = ["pkcs11" "secrets" "ssh"];
  };
  home.sessionVariables.SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/keyring/ssh";

  # OSD for volume, brightness changes
  services.swayosd.enable = true;
  systemd.user.services.swayosd = {
    # Adjust swayosd restart policy - it's failing due to too many restart
    # attempts when resuming from sleep
    Unit.StartLimitIntervalSec = lib.mkForce 1;
  };
}
