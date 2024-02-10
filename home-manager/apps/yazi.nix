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
    theme = {
      manager = {
        cwd = { fg = "#94e2d5"; };
        hovered = { fg = "#1e1e2e"; bg = "#89b4fa"; };
        preview_hovered = { underline = true; };
        find_keyword = { fg = "#f9e2af"; italic = true; };
        find_position = { fg = "#f5c2e7"; bg = "reset"; italic = true; };
        marker_selected = { fg = "#a6e3a1"; bg = "#a6e3a1"; };
        marker_copied = { fg = "#f9e2af"; bg = "#f9e2af"; };
        marker_cut = { fg = "#f38ba8"; bg = "#f38ba8"; };
        tab_active = { fg = "#1e1e2e"; bg = "#89b4fa"; };
        tab_inactive = { fg = "#cdd6f4"; bg = "#45475a"; };
        tab_width = 1;
        border_symbol = "│";
        border_style = { fg = "#7f849c"; };
        syntect_theme = "~/.config/yazi/Catppuccin-mocha.tmTheme";
      };

      status = {
        separator_open = "";
        separator_close = "";
        separator_style = { fg = "#45475a"; bg = "#45475a"; };
        mode_normal = { fg = "#1e1e2e"; bg = "#89b4fa"; bold = true; };
        mode_select = { fg = "#1e1e2e"; bg = "#a6e3a1"; bold = true; };
        mode_unset = { fg = "#1e1e2e"; bg = "#f2cdcd"; bold = true; };
        progress_label = { fg = "#ffffff"; bold = true; };
        progress_normal = { fg = "#89b4fa"; bg = "#45475a"; };
        progress_error = { fg = "#f38ba8"; bg = "#45475a"; };
        permissions_t = { fg = "#89b4fa"; };
        permissions_r = { fg = "#f9e2af"; };
        permissions_w = { fg = "#f38ba8"; };
        permissions_x = { fg = "#a6e3a1"; };
        permissions_s = { fg = "#7f849c"; };
      };

      input = {
        border = { fg = "#89b4fa"; };
        title = { };
        value = { };
        selected = { reversed = true; };
      };

      select = {
        border = { fg = "#89b4fa"; };
        active = { fg = "#f5c2e7"; };
        inactive = { };
      };

      tasks = {
        border = { fg = "#89b4fa"; };
        title = { };
        hovered = { underline = true; };
      };

      which = {
        mask = { bg = "#313244"; };
        cand = { fg = "#94e2d5"; };
        rest = { fg = "#9399b2"; };
        desc = { fg = "#f5c2e7"; };
        separator = "  ";
        separator_style = { fg = "#585b70"; };
      };

      help = {
        on = { fg = "#f5c2e7"; };
        exec = { fg = "#94e2d5"; };
        desc = { fg = "#9399b2"; };
        hovered = { bg = "#585b70"; bold = true; };
        footer = { fg = "#45475a"; bg = "#cdd6f4"; };
      };

      filetype = {
        rules = [
          { mime = "image/*"; fg = "#94e2d5"; }
          { mime = "video/*"; fg = "#f9e2af"; }
          { mime = "audio/*"; fg = "#f9e2af"; }
          { mime = "application/zip"; fg = "#f5c2e7"; }
          { mime = "application/gzip"; fg = "#f5c2e7"; }
          { mime = "application/x-tar"; fg = "#f5c2e7"; }
          { mime = "application/x-bzip"; fg = "#f5c2e7"; }
          { mime = "application/x-bzip2"; fg = "#f5c2e7"; }
          { mime = "application/x-7z-compressed"; fg = "#f5c2e7"; }
          { mime = "application/x-rar"; fg = "#f5c2e7"; }
          { name = "*"; fg = "#cdd6f4"; }
          { name = "*/"; fg = "#89b4fa"; }
        ];
      };
    };
  };
}
