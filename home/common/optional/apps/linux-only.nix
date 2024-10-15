{pkgs, ...}: {
  imports = [
    ./gpg.nix
  ];
  home.packages = with pkgs; [
    _1password
    _1password-gui
    brave
    eog
    gparted
    kdePackages.wacomtablet
    libgcc
    libreoffice-fresh
    libsForQt5.okular
    libwacom
    logseq
    lshw
    morgen
    nautilus
    obsidian
    pdfarranger
    psmisc
    seahorse
    signal-desktop
    spotify
    udisks
    vscode-fhs
    zotero_7
  ];
}
