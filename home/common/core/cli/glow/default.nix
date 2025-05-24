{pkgs, ...}: {
  home.packages = with pkgs; [
    glow
  ];

  home.file.".config/glow/glow.yml".source = ./glow.yml;
}
