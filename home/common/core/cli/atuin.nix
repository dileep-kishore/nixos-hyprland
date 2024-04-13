# https://github.com/atuinsh/atuin
{
  programs.atuin = {
    enable = true;
    settings = {
      auto_sync = true;
      sync_frequency = "5m";
      sync_address = "https://api.atuin.sh";
      filter_mode = "host";
      search_mode = "fuzzy";
      filter_mode_shell_up_key_binding = "directory";
      search_mode_shell_up_key_binding = "fuzzy";
      keymap_mode = "vim-insert";
      show_preview = true;
      style = "compact";
      invert = false;
      inline_height = 20;
    };
  };
}
