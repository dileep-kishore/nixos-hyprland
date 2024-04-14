{pkgs, ...}: {
  home.packages = with pkgs; [
    python312
    go
    julia
    nodejs_20
    quarto
    rust
    lua
  ];

  # conda
  home.file.".condarc".source = ./.condarc;
  # npm
  home.file.".npmrc".source = ./.npmrc;
  # stylua
  home.file.".config/stylua.toml".source = ./stylua.toml;
}
