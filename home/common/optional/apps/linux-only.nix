{pkgs, ...}: {
  imports = [
    ./gpg.nix
  ];
  home.packages = with pkgs; [
    _1password
    _1password-gui
    libgcc
    brave
    eog
    nautilus
    seahorse
    gparted
    kdePackages.wacomtablet
    libreoffice-fresh
    libsForQt5.okular
    libwacom
    logseq
    lshw
    morgen
    obsidian
    pdfarranger
    psmisc
    signal-desktop
    udisks
    vscode-fhs
    zotero_7
  ];
}
