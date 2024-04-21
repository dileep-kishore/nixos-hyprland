{pkgs, ...}: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override {
      fonts = ["FiraCode" "CascadiaCode" "FantasqueSansMono"];
    })
    font-awesome
    noto-fonts
    noto-fonts-emoji
    recursive
    sn-pro
    ia-writer-quattro
    ia-writer-duospace
    libre-baskerville
    monaspace
  ];
}
