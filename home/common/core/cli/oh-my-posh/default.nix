{
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    # NOTE: To use one of the builtin themes, use:
    # builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "${pkgs.oh-my-posh}/share/oh-my-posh/themes/space.omp.json"))
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ./config.json));
  };
}
