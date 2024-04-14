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
    ./gpg.nix
    ./lazygit.nix
    ./mods
    ./ripgrep.nix
    ./starship.nix
    ./tmux
    ./yazi
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    inputs.neovim.packages.${system}.default
    coreutils-full
    libgcc
    entr
    gnumake
    fd
    git-extras
    htop
    jc
    jq
    just
    lazydocker
    libnotify
    libxcrypt
    ncdu
    neofetch
    openvpn
    tldr
    todoist
    unzip
    vim
    zip
    wget
  ];
}
