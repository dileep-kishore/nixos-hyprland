{pkgs, ...}: {
  home.packages = with pkgs; [
    python3
    go
    nodejs_22
    rustc
    lua
    julia-lts
  ];

  # conda
  home.file.".condarc".source = ./.condarc;
  # npm
  home.file.".npmrc".source = ./.npmrc;
  # stylua
  home.file.".config/stylua.toml".source = ./stylua.toml;
}
