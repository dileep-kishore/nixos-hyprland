{pkgs, ...}: {
  home.packages = with pkgs; [
    brave
    gnome.eog
    gnome.nautilus
    gnome.seahorse
    gparted
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
    kdePackages.wacomtablet
    zotero_7
  ];
}
