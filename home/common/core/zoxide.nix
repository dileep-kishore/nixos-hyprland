# https://github.com/ajeetdsouza/zoxide
{
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    # replace cd with z and zi (via cdi)
    options = ["--cmd cd"];
  };
}
