{ config, pkgs, inputs, ... }: {

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
    ./apps/yazi.nix
    ./apps/zathura.nix
    ./apps/zsh.nix
  ];

  home.username = "dileep";
  home.homeDirectory = "/home/dileep";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 3600;
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [ "FiraCode" "CascadiaCode" "FantasqueSansMono" ];
    })
    bashInteractive
    bat
    btop
    coreutils-full
    entr
    fd
    font-awesome
    git
    git-extras
    gnome.eog
    pkgs.gedit
    gnome.nautilus
    gnome.seahorse
    gparted
    go
    grim
    htop
    hyprland
    hyprpaper
    jq
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
    inputs.neovim.packages.${system}.default
    networkmanagerapplet
    nixpkgs-fmt
    nodejs_20
    noto-fonts
    noto-fonts-emoji
    obsidian
    openvpn
    pandoc
    pavucontrol
    pdfarranger
    pipewire
    psmisc
    python311Packages.toggl-cli
    python312
    recursive
    signal-desktop
    slack
    slurp
    sops
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
    wlogout
    wl-clipboard
    wofi
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    zoom-us
    zotero
    libinput
    wacomtablet
    libwacom
    firefox
  ];
}
