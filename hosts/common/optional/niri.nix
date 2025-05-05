{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.niri.nixosModules.niri];
  programs.niri.enable = true;
  # NOTE: remove this line to switch to latest stable niri release
  programs.niri.package = pkgs.niri-unstable;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # NOTE: Only enable these if the nixosModules does not work
  # security.pam.services.swaylock = {};
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = with pkgs; [
  #     xdg-desktop-portal-gtk
  #     xdg-desktop-portal-gnome
  #   ];
  # };
}
