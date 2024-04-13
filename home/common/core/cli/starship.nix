{lib, ...}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableTransience = true;
    settings = {
      palettes = {
        catppuccin_mocha = {
          rosewater = "#f4dbd6";
          flamingo = "#f0c6c6";
          pink = "#f5bde6";
          mauve = "#c6a0f6";
          red = "#ed8796";
          maroon = "#ee99a0";
          peach = "#f5a97f";
          yellow = "#eed49f";
          green = "#a6da95";
          teal = "#8bd5ca";
          sky = "#91d7e3";
          sapphire = "#7dc4e4";
          blue = "#8aadf4";
          lavender = "#b7bdf8";
          text = "#cad3f5";
          subtext1 = "#b8c0e0";
          subtext0 = "#a5adcb";
          overlay2 = "#939ab7";
          overlay1 = "#8087a2";
          overlay0 = "#6e738d";
          surface2 = "#5b6078";
          surface1 = "#494d64";
          surface0 = "#363a4f";
          base = "#24273a";
          mantle = "#1e2030";
          crust = "#181926";
          black = "#181926";
        };
        rose_pine = {
          _nc = "#16141f";
          base = "#191724";
          surface = "#1f1d2e";
          overlay = "#26233a";
          muted = "#6e6a86";
          subtle = "#908caa";
          text = "#e0def4";
          love = "#eb6f92";
          gold = "#f6c177";
          gold2 = "#ea9d34";
          rose = "#ebbcba";
          rose2 = "#ea9a97";
          pine = "#31748f";
          pine2 = "#3e8fb0";
          foam = "#9ccfd8";
          foam2 = "#56949f";
          iris = "#c4a7e7";
          iris2 = "#907aa9";
        };
      };
      palette = "rose_pine";
      format = lib.concatStrings [
        "[┏](bold foam)[  ](bold bg:foam fg:base)"
        "[](fg:foam bg:base)"
        "$status"
        "$shlvl"
        "$sudo"
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_status"
        "$hg_branch"
        "$package"
        "$fill"
        "$docker_context"
        "$container"
        "$nix_shell"
        "$python"
        "$conda"
        "$lua"
        "$nodejs"
        "$rlang"
        "$julia"
        "$golang"
        "$rust"
        "$haskell"
        "$java"
        "$dart"
        "$ruby"
        "$scala"
        "$typst"
        "$c"
        "$memory_usage"
        "$cmd_duration"
        "$jobs"
        "$time"
        "$line_break"
        "$character"
      ];

      # LEFT prompt
      status = {
        style = "bg:love fg:base";
        format = "[](fg:love)[$symbol$status]($style)[](fg:love)";
        disabled = false;
        symbol = " ";
        not_executable_symbol = " ";
      };
      shlvl = {
        disabled = false;
        format = "[](fg:gold)[$symbol$shlvl]($style)[](fg:gold)";
        style = "bg:gold fg:base";
        symbol = " ";
        threshold = 3;
      };
      sudo = {
        format = "[](fg:love)[$symbol]($style)[](fg:love)";
        style = "bg:love fg:base";
        symbol = " ";
        disabled = false;
      };
      username = {
        style_user = "bg:foam fg:base";
        style_root = "bg:foam fg:base";
        format = "[](fg:foam)[$user]($style)[](fg:foam)";
        disabled = false;
        show_always = false;
      };
      hostname = {
        format = "[](bg:foam fg:base)[$hostname]($style)[](fg:foam)";
        style = "bg:foam fg:base";
        ssh_symbol = " ";
      };
      directory = {
        format = "[](fg:pine)[$path]($style)[$read_only]($read_only_style)[](fg:pine)";
        style = "bold bg:pine fg:base";
        read_only_style = "bold bg:pine fg:love";
        read_only = "  ";
        home_symbol = " ";
        truncation_symbol = "/";
        truncate_to_repo = true;
      };

      git_branch = {
        format = "[](fg:rose)[$symbol$branch]($style)";
        style = "bold bg:rose fg:base";
        symbol = " ";
        truncation_length = 25;
      };
      git_commit = {
        format = "[\\($hash$tag\\)]($style)";
        tag_disabled = false;
        tag_symbol = " ";
        only_detached = true;
        style = "bold bg:rose fg:base";
      };
      git_state = {
        format = "[$state( $progress_current/$progress_total)]($style)";
        style = "bold bg:rose fg:base";
      };
      git_status = {
        format = "([\\[$all_status$ahead_behind\\]]($style))[](fg:rose)";
        ahead = "↑";
        behind = "↓";
        diverged = "↕";
        style = "bold bg:rose fg:base";
      };
      hg_branch = {
        format = "[](fg:rose)[$symbol$branch]($style)[](fg:rose)";
        style = "bold bg:rose fg:base";
        symbol = " ";
      };

      package = {
        format = "[](fg:iris)[$symbol$version]($style)[](fg:iris)";
        symbol = " ";
        style = "bold bg:iris fg:base";
        display_private = true;
      };

      fill = {
        symbol = " ";
        style = "light gray";
      };

      # RIGHT prompt
      container = {
        format = "[](fg:foam)[$symbol $name]($style)[](fg:foam)";
        symbol = "󰡨";
        style = "bold bg:foam fg:base";
      };
      docker_context = {
        format = "[](fg:foam)[$symbol$context]($style)[](fg:foam)";
        symbol = " ";
        style = "bold bg:foam fg:base";
      };

      nix_shell = {
        format = "[](fg:foam)[$symbol$state(\($name\))]($style)[](fg:foam)";
        impure_msg = "[ ](bold fg:#8A3324  bg:foam)";
        pure_msg = "[ ](bold fg:base bg:foam)";
        style = "bold bg:foam fg:base";
        symbol = "";
      };

      python = {
        format = "[](fg:gold)[$symbol$pyenv_prefix($version )(\($virtualenv\))]($style)[](fg:gold)";
        symbol = " ";
        style = "bold bg:gold fg:base";
      };
      conda = {
        format = "[](fg:gold)[$symbol$environment]($style)[](fg:gold)";
        symbol = " ";
        style = "bold bg:gold fg:base";
      };

      lua = {
        format = "[](fg:pine2)[$symbol$version]($style)[](fg:pine2)";
        symbol = " ";
        style = "bold bg:pine2 fg:base";
      };
      nodejs = {
        format = "[](fg:foam2)[$symbol($version )]($style)[](fg:foam2)";
        symbol = "󰎙 ";
        style = "bold bg:foam2 fg:base";
      };
      rlang = {
        format = "[](fg:pine2)[$symbol($version)]($style)[](fg:pine2)";
        symbol = "󰟔 ";
        style = "bold bg:pine2 fg:base";
      };
      julia = {
        format = "[](fg:iris)[$symbol($version)]($style)[](fg:iris)";
        symbol = " ";
        style = "bold bg:iris fg:base";
      };
      golang = {
        symbol = " ";
        format = "[](fg:foam)[$symbol($version)]($style)[](fg:foam)";
        style = "bold bg:foam fg:base";
      };
      rust = {
        symbol = " ";
        format = "[](fg:rose2)[$symbol($version)]($style)[](fg:rose2)";
        style = "bold bg:rose2 fg:base";
      };
      haskell = {
        symbol = " ";
        format = "[](fg:iris)[$symbol($version)]($style)[](fg:iris)";
        style = "bold bg:iris fg:base";
      };
      java = {
        symbol = " ";
        format = "[](fg:rose2)[$symbol($version)]($style)[](fg:rose2)";
        style = "bold bg:rose2 fg:base";
      };
      dart = {
        symbol = " ";
        format = "[](fg:pine2)[$symbol($version)]($style)[](fg:pine2)";
        style = "bold bg:pine2 fg:base";
      };
      ruby = {
        symbol = " ";
        format = "[](fg:love)[$symbol($version)]($style)[](fg:love)";
        style = "bold bg:love fg:base";
      };
      scala = {
        symbol = " ";
        format = "[](fg:love)[$symbol($version)]($style)[](fg:love)";
        style = "bold bg:love fg:base";
      };
      typst = {
        symbol = "t ";
        format = "[](fg:pine)[$symbol($version)]($style)[](fg:pine)";
        style = "bold bg:pine fg:base";
      };

      c = {
        format = "[](fg:pine)[$symbol($version(-$name))]($style)[](fg:pine)";
        symbol = " ";
        style = "bold bg:pine fg:base";
      };

      memory_usage = {
        threshold = 80;
        format = "[](fg:love)[$symbol$ram]($style)[](fg:love)";
        disabled = false;
        symbol = "󰍛 ";
        style = "bold bg:love fg:base";
      };
      cmd_duration = {
        format = "[](fg:iris)[ $duration]($style)[](fg:iris)";
        min_time = 5000;
        style = "bold bg:iris fg:base";
      };
      jobs = {
        format = "[](fg:iris)[$symbol$number]($style)[](fg:iris)";
        number_threshold = 2;
        symbol = " ";
        style = "bold bg:iris fg:base";
      };
      time = {
        format = "[](fg:foam)[ $time ]($style)";
        disabled = false;
        time_format = "%R";
        style = "bold bg:foam fg:base";
      };

      add_newline = true;
      character = {
        format = "$symbol";
        success_symbol = "[┗━](bold foam)[ ](bold foam)";
        error_symbol = "[┗━](bold love)[ ](bold love)";
        vicmd_symbol = "[┗━](bold foam2)[ ](bold foam2)";
      };
    };
  };
}
