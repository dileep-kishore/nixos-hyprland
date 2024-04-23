{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./atuin.nix
    ./bat
    ./btop
    ./direnv.nix
    ./eza.nix
    ./fzf.nix
    ./gh.nix
    ./git.nix
    ./git-cliff.nix
    ./jujutsu.nix
    ./lazygit.nix
    ./mods
    ./ripgrep.nix
    ./scripts.nix
    ./starship.nix
    ./tmux
    ./yazi
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    inputs.neovim.packages.${system}.default
    # _1password
    coreutils-full
    entr
    fd
    git-extras
    gnumake
    htop
    jc
    jq
    just
    lazydocker
    libnotify
    libxcrypt
    ncdu
    neofetch
    nix-tree
    openvpn
    p7zip
    pciutils
    tldr
    todoist
    unrar
    unzip
    vim
    wget
    zip
  ];
}
