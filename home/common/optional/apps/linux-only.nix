{pkgs, ...}: {
  imports = [
    ./gpg.nix
  ];
  home.packages = with pkgs; [
    _1password-cli
    _1password-gui
    appimage-run
    brave
    brightnessctl
    # capacities-latest
    clickup-latest
    code-cursor
    eog
    gparted
    heptabase
    kdePackages.wacomtablet
    libgcc
    libreoffice-fresh
    libsForQt5.okular
    libwacom
    lshw
    morgen-latest
    nautilus
    obsidian
    pdfarranger
    psmisc
    seahorse
    signal-desktop
    spotify
    tana
    udisks
    vscode-fhs
    zotero_7
  ];
}
