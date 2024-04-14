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
    # TODO: Add other fonts - github monospace, etc.
  ];
}
