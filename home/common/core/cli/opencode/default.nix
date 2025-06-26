{pkgs, ...}: {
  home.packages = with pkgs; [
    opencode-latest
  ];
  home.file.".config/opencode/config.json".source = ./config.json;
}
