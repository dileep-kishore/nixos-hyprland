{pkgs, ...}: {
  home.file.".config/opencode/config.json".source = ./config.json;
}
