# https://github.com/sxyazi/yazi
{
  # NOTE: Default keybinding are here: https://github.com/sxyazi/yazi/blob/main/yazi-config/preset/keymap.toml
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      manager = {
        show_hidden = false;
        sort_by = "alphabetical";
        sort_sensitive = false;
        sort_dir_first = true;
        sort_reverse = false;
      };
    };
  };

  # copy themes
  home.file.".config/yazi" = {
    recursive = true;
    source = ./themes;
  };

  # aliases
  home.shellAliases = {
    y = "yazi";
  };
}
