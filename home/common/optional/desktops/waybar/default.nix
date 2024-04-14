# https://github.com/Alexays/Waybar
# TODO: Use HM to set up the waybar config
{pkgs, ...}: {
  home.packages = with pkgs; [
    waybar
  ];

  home.file.".config/waybar" = {
    recursive = true;
    source = ./config;
  };
}
