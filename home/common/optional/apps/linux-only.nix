{pkgs, ...}: {
  imports = [
    ./gpg.nix
  ];
  home.packages = with pkgs; [
    _1password-cli
    _1password-gui
    appimage-run
    brave
    capacities-latest
    clickup-latest
    code-cursor
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
