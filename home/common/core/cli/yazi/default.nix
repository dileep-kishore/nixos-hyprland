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
    theme = {
      manager = {
        cwd = {fg = "#94e2d5";};
        hovered = {
          fg = "#1e1e2e";
          bg = "#31748f";
        };
        preview_hovered = {underline = true;};
        find_keyword = {
          fg = "#f6c177";
          italic = true;
        };
        find_position = {
          fg = "#ebbcba";
          bg = "reset";
          italic = true;
        };
        marker_selected = {
          fg = "#56949f";
          bg = "#56949f";
        };
        marker_copied = {
          fg = "#f6c177";
          bg = "#f6c177";
        };
        marker_cut = {
          fg = "#eb6f92";
          bg = "#eb6f92";
        };
        tab_active = {
          fg = "#1e1e2e";
          bg = "#31748f";
        };
        tab_inactive = {
          fg = "#cdd6f4";
          bg = "#524f67";
        };
        tab_width = 1;
        border_symbol = "│";
        border_style = {fg = "#7f849c";};
        syntect_theme = "~/.config/yazi/themes/Catppuccin-mocha.tmTheme";
      };

      status = {
        separator_open = "";
        separator_close = "";
        separator_style = {
          fg = "#524f67";
          bg = "#524f67";
        };
        mode_normal = {
          fg = "#1e1e2e";
          bg = "#31748f";
          bold = true;
        };
        mode_select = {
          fg = "#1e1e2e";
          bg = "#56949f";
          bold = true;
        };
        mode_unset = {
          fg = "#1e1e2e";
          bg = "#f2cdcd";
          bold = true;
        };
        progress_label = {
          fg = "#ffffff";
          bold = true;
        };
        progress_normal = {
          fg = "#31748f";
          bg = "#524f67";
        };
        progress_error = {
          fg = "#eb6f92";
          bg = "#524f67";
        };
        permissions_t = {fg = "#31748f";};
        permissions_r = {fg = "#f6c177";};
        permissions_w = {fg = "#eb6f92";};
        permissions_x = {fg = "#56949f";};
        permissions_s = {fg = "#7f849c";};
      };

      input = {
        border = {fg = "#31748f";};
        title = {};
        value = {};
        selected = {reversed = true;};
      };

      select = {
        border = {fg = "#31748f";};
        active = {fg = "#ebbcba";};
        inactive = {};
      };

      tasks = {
        border = {fg = "#31748f";};
        title = {};
        hovered = {underline = true;};
      };

      which = {
        mask = {bg = "#313244";};
        cand = {fg = "#94e2d5";};
        rest = {fg = "#9399b2";};
        desc = {fg = "#ebbcba";};
        separator = "  ";
        separator_style = {fg = "#585b70";};
      };

      help = {
        on = {fg = "#ebbcba";};
        exec = {fg = "#94e2d5";};
        desc = {fg = "#9399b2";};
        hovered = {
          bg = "#585b70";
          bold = true;
        };
        footer = {
          fg = "#524f67";
          bg = "#cdd6f4";
        };
      };

      filetype = {
        rules = [
          {
            mime = "image/*";
            fg = "#94e2d5";
          }
          {
            mime = "video/*";
            fg = "#f6c177";
          }
          {
            mime = "audio/*";
            fg = "#f6c177";
          }
          {
            mime = "application/zip";
            fg = "#ebbcba";
          }
          {
            mime = "application/gzip";
            fg = "#ebbcba";
          }
          {
            mime = "application/x-tar";
            fg = "#ebbcba";
          }
          {
            mime = "application/x-bzip";
            fg = "#ebbcba";
          }
          {
            mime = "application/x-bzip2";
            fg = "#ebbcba";
          }
          {
            mime = "application/x-7z-compressed";
            fg = "#ebbcba";
          }
          {
            mime = "application/x-rar";
            fg = "#ebbcba";
          }
          {
            name = "*";
            fg = "#cdd6f4";
          }
          {
            name = "*/";
            fg = "#31748f";
          }
        ];
      };
    };
  };

  # copy themes
  home.file.".config/yazi/themes" = {
    recursive = true;
    source = ./themes;
  };

  # aliases
  home.shellAliases = {
    y = "yazi";
  };
}
