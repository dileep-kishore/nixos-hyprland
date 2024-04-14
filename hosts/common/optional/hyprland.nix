{pkgs, ...}: {
  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  security.pam.services.swaylock = {};
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };
}
