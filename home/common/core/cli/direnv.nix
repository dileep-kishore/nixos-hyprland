# https://github.com/direnv/direnv
{
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    # better than native direnv nix functionality - https://github.com/nix-community/nix-direnv
    nix-direnv.enable = true;
  };
}
