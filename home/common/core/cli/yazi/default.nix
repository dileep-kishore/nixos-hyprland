# https://github.com/sxyazi/yazi
{pkgs, ...}: {
  # NOTE: Default keybinding are here: https://github.com/sxyazi/yazi/blob/main/yazi-config/preset/keymap.toml
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      mgr = {
        show_hidden = false;
        sort_by = "alphabetical";
        sort_sensitive = false;
        sort_dir_first = true;
        sort_reverse = false;
        linemode = "size_and_mtime";
      };
      plugin = {
        prepend_fetchers = [
          {
            id = "git";
            name = "*";
            run = "git";
          }
          {
            id = "git";
            name = "*/";
            run = "git";
          }
        ];
        prepend_previewers = [
          {
            name = "*.md";
            run = "piper -- CLICOLOR_FORCE=1 glow -w=$w -s=dracula \"$1\"";
          }
          {
            mime = "application/{,g}zip";
            run = "ouch";
          }
          {
            mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}";
            run = "ouch";
          }
          {
            name = "*.rst";
            run = "rich-preview";
          }
          {
            name = "*.ipynb";
            run = "rich-preview";
          }
        ];
      };
    };
    initLua = ./init.lua;
    plugins = with pkgs.yaziPlugins; {
      git = git;
      piper = piper;
      ouch = ouch;
      rich-preview = rich-preview;
      jump-to-char = jump-to-char;
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = "s";
          run = "plugin jump-to-char";
          desc = "Jump to char";
        }
        {
          on = "C";
          run = "plugin ouch";
          desc = "Compress with ouch";
        }
      ];
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
