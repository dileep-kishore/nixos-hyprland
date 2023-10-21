{ config, pkgs, ... }:
{

  imports = [
    ./apps/zsh.nix
  ];

  home.username = "dileep";
  home.homeDirectory = "/home/dileep";
  home.stateVersion = "23.05";

  home.packages = with pkgs; [
    git
    gnome.gedit
    gnome.nautilus
    gnome.seahorse
    gparted
    grim
    htop
    hyprland
    hyprpaper
    kitty
    libnotify
    libsForQt5.okular
    libxcrypt-legacy
    logseq
    lshw
    mako
    neofetch
    neovim
    nixpkgs-fmt
    nodejs_20
    obsidian
    pavucontrol
    pipewire
    psmisc
    python311Packages.toggl-cli
    python312
    signal-desktop
    slack
    slurp
    udisks
    vim
    vivaldi
    vscode-fhs
    waybar
    wezterm
    wget
    wl-clipboard
    wofi
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    zoom-us
  ];
}
