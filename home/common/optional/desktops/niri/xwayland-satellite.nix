{pkgs, ...}: {
  home.packages = with pkgs; [
    xwayland-satellite
  ];

  # Switch from `Install.WantedBy = [ "graphical-session.target" ]` as defined
  # in the service file provided by the xwayland-satellite package. This links
  # xwayland-satellite to niri specifically, and schedules it so that there is
  # a wayland session available when it starts.
  systemd.user.services.xwayland-satellite = {
    Unit = {
      Description = "Xwayland outside your Wayland";
      BindsTo = "graphical-session.target";
      PartOf = "graphical-session.target";
      After = "graphical-session.target";
      Requisite = "graphical-session.target";
    };
    Service = {
      Type = "notify";
      NotifyAccess = "all";
      ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
      StandardOutput = "journal";
    };
    Install.WantedBy = ["niri.service"];
  };
}
