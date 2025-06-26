{pkgs, ...}: {
  home.packages = with pkgs; [
    opencode
  ];
  home.file.".config/opencode/config.json".source = ./config.json;
}
