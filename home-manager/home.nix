{ config, pkgs, ... }:
{

  imports = [
    # ./apps/espanso.nix
    # ./apps/oh-my-posh.nix
    ./apps/cli.nix
    ./apps/gammastep.nix
    ./apps/git.nix
    ./apps/gtk.nix
    ./apps/hyprland.nix
    ./apps/kitty.nix
    ./apps/qt5.nix
    ./apps/rofi.nix
    ./apps/starship.nix
    ./apps/tmux.nix
    ./apps/waybar.nix
    ./apps/wezterm.nix
    ./apps/wofi.nix
    ./apps/xdg.nix
    ./apps/zathura.nix
    ./apps/zsh.nix
  ];

  home.username = "dileep";
  home.homeDirectory = "/home/dileep";
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 3600;
  };

  home.packages = with pkgs; [
    bashInteractive
    bat
    coreutils-full
    fd
    git
    git-extras
    gnome.eog
    gnome.gedit
    gnome.seahorse
    gparted
    grim
    htop
    hyprland
    hyprpaper
    libgccjit
    libnotify
    libreoffice-fresh
    libsForQt5.okular
    libxcrypt-legacy
    logseq
    lshw
    mako
    morgen
    ncdu
    neofetch
    neovim
    networkmanagerapplet
    nixpkgs-fmt
    nnn
    nodejs_20
    obsidian
    openvpn
    pandoc
    pavucontrol
    pipewire
    psmisc
    python311Packages.toggl-cli
    python312
    signal-desktop
    slack
    slurp
    texlive.combined.scheme-full
    tldr
    todoist
    udisks
    unzip
    vim
    vivaldi
    vscode-fhs
    waybar
    wget
    wl-clipboard
    wofi
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xfce.thunar
    zoom-us
    zotero
  ];
}
