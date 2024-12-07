{pkgs, ...}: {
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.symbols-only
    nerd-fonts.fira-code
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.caskaydia-cove
    font-awesome
    noto-fonts
    noto-fonts-emoji
    recursive
    sn-pro
    ia-writer-quattro
    ia-writer-duospace
    libre-baskerville
    monaspace
    maple-mono
    maple-mono-otf
  ];
}
