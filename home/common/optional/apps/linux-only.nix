{pkgs, ...}: {
  imports = [
    ./gpg.nix
  ];
  home.packages = with pkgs; [
    _1password
    _1password-gui
    libgcc
    brave
    gnome.eog
    gnome.nautilus
    gnome.seahorse
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
