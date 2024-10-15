{lib, ...}: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableTransience = true;
    settings = {
      palettes = {
        catppuccin_mocha = {
          rosewater = "#f5e0dc";
          flamingo = "#f2cdcd";
          pink = "#f5c2e7";
          mauve = "#cba6f7";
          red = "#f38ba8";
          maroon = "#eba0ac";
          peach = "#fab387";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          teal = "#94e2d5";
          sky = "#89dceb";
          sapphire = "#74c7ec";
          blue = "#89b4fa";
          lavender = "#b4befe";
          text = "#cdd6f4";
          subtext1 = "#bac2de";
          subtext0 = "#a6adc8";
          overlay2 = "#9399b2";
          overlay1 = "#7f849c";
          overlay0 = "#6c7086";
          surface2 = "#585b70";
          surface1 = "#45475a";
          surface0 = "#313244";
          base = "#1e1e2e";
          mantle = "#181825";
          crust = "#11111b";
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
      palette = "catppuccin_mocha";
      format = lib.concatStrings [
        "[┏](bold mauve)[  ](bold bg:mauve fg:base)"
        "[](fg:mauve bg:base)"
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
        style = "bg:red fg:base";
        format = "[](fg:red)[$symbol$status]($style)[](fg:red)";
        disabled = false;
        symbol = " ";
        not_executable_symbol = " ";
      };
      shlvl = {
        disabled = false;
        format = "[](fg:yellow)[$symbol$shlvl]($style)[](fg:yellow)";
        style = "bg:yellow fg:base";
        symbol = " ";
        threshold = 3;
      };
      sudo = {
        format = "[](fg:red)[$symbol]($style)[](fg:red)";
        style = "bg:red fg:base";
        symbol = " ";
        disabled = false;
      };
      username = {
        style_user = "bg:mauve fg:base";
        style_root = "bg:mauve fg:base";
        format = "[](fg:mauve)[$user]($style)[](fg:mauve)";
        disabled = false;
        show_always = false;
      };
      hostname = {
        format = "[](bg:mauve fg:base)[$hostname]($style)[](fg:mauve)";
        style = "bg:mauve fg:base";
        ssh_symbol = " ";
      };
      directory = {
        format = "[](fg:blue)[$path]($style)[$read_only]($read_only_style)[](fg:blue)";
        style = "bold bg:blue fg:base";
        read_only_style = "bold bg:blue fg:red";
        read_only = "  ";
        home_symbol = " ";
        truncation_symbol = "/";
        truncate_to_repo = true;
      };

      git_branch = {
        format = "[](fg:peach)[$symbol$branch]($style)";
        style = "bold bg:peach fg:base";
        symbol = " ";
        truncation_length = 25;
      };
      git_commit = {
        format = "[\\($hash$tag\\)]($style)";
        tag_disabled = false;
        tag_symbol = " ";
        only_detached = true;
        style = "bold bg:peach fg:base";
      };
      git_state = {
        format = "[$state( $progress_current/$progress_total)]($style)";
        style = "bold bg:peach fg:base";
      };
      git_status = {
        format = "([\\[$all_status$ahead_behind\\]]($style))[](fg:peach)";
        ahead = "↑";
        behind = "↓";
        diverged = "↕";
        style = "bold bg:peach fg:base";
      };
      hg_branch = {
        format = "[](fg:peach)[$symbol$branch]($style)[](fg:peach)";
        style = "bold bg:peach fg:base";
        symbol = " ";
      };

      package = {
        format = "[](fg:lavender)[$symbol$version]($style)[](fg:lavender)";
        symbol = " ";
        style = "bold bg:lavender fg:base";
        display_private = true;
      };

      fill = {
        symbol = " ";
        style = "light gray";
      };

      # RIGHT prompt
      container = {
        format = "[](fg:sky)[$symbol $name]($style)[](fg:sky)";
        symbol = "󰡨";
        style = "bold bg:sky fg:base";
      };
      docker_context = {
        format = "[](fg:sky)[$symbol$context]($style)[](fg:sky)";
        symbol = " ";
        style = "bold bg:sky fg:base";
      };

      nix_shell = {
        format = "[](fg:blue)[$symbol$state(\($name\))]($style)[](fg:blue)";
        impure_msg = "[ ](bold fg:maroon  bg:blue)";
        pure_msg = "[ ](bold fg:base bg:blue)";
        style = "bold bg:blue fg:base";
        symbol = "";
      };

      python = {
        format = "[](fg:yellow)[$symbol$pyenv_prefix($version )(\($virtualenv\))]($style)[](fg:yellow)";
        symbol = " ";
        style = "bold bg:yellow fg:base";
      };
      conda = {
        format = "[](fg:yellow)[$symbol$environment]($style)[](fg:yellow)";
        symbol = " ";
        style = "bold bg:yellow fg:base";
      };

      lua = {
        format = "[](fg:blue)[$symbol$version]($style)[](fg:blue)";
        symbol = " ";
        style = "bold bg:blue fg:base";
      };
      nodejs = {
        format = "[](fg:green)[$symbol($version )]($style)[](fg:green)";
        symbol = "󰎙 ";
        style = "bold bg:green fg:base";
      };
      rlang = {
        format = "[](fg:blue)[$symbol($version)]($style)[](fg:blue)";
        symbol = "󰟔 ";
        style = "bold bg:blue fg:base";
      };
      julia = {
        format = "[](fg:lavender)[$symbol($version)]($style)[](fg:lavender)";
        symbol = " ";
        style = "bold bg:lavender fg:base";
      };
      golang = {
        symbol = " ";
        format = "[](fg:blue)[$symbol($version)]($style)[](fg:blue)";
        style = "bold bg:blue fg:base";
      };
      rust = {
        symbol = " ";
        format = "[](fg:maroon)[$symbol($version)]($style)[](fg:maroon)";
        style = "bold bg:maroon fg:base";
      };
      haskell = {
        symbol = " ";
        format = "[](fg:lavender)[$symbol($version)]($style)[](fg:lavender)";
        style = "bold bg:lavender fg:base";
      };
      java = {
        symbol = " ";
        format = "[](fg:maroon)[$symbol($version)]($style)[](fg:maroon)";
        style = "bold bg:maroon fg:base";
      };
      dart = {
        symbol = " ";
        format = "[](fg:blue)[$symbol($version)]($style)[](fg:blue)";
        style = "bold bg:blue fg:base";
      };
      ruby = {
        symbol = " ";
        format = "[](fg:red)[$symbol($version)]($style)[](fg:red)";
        style = "bold bg:red fg:base";
      };
      scala = {
        symbol = " ";
        format = "[](fg:red)[$symbol($version)]($style)[](fg:red)";
        style = "bold bg:red fg:base";
      };
      typst = {
        symbol = "t ";
        format = "[](fg:teal)[$symbol($version)]($style)[](fg:teal)";
        style = "bold bg:teal fg:base";
      };

      c = {
        format = "[](fg:teal)[$symbol($version(-$name))]($style)[](fg:teal)";
        symbol = " ";
        style = "bold bg:teal fg:base";
      };

      memory_usage = {
        threshold = 80;
        format = "[](fg:red)[$symbol$ram]($style)[](fg:red)";
        disabled = false;
        symbol = "󰍛 ";
        style = "bold bg:red fg:base";
      };
      cmd_duration = {
        format = "[](fg:lavender)[ $duration]($style)[](fg:lavender)";
        min_time = 5000;
        style = "bold bg:lavender fg:base";
      };
      jobs = {
        format = "[](fg:lavender)[$symbol$number]($style)[](fg:lavender)";
        number_threshold = 2;
        symbol = " ";
        style = "bold bg:lavender fg:base";
      };
      time = {
        format = "[](fg:mauve)[ $time ]($style)";
        disabled = false;
        time_format = "%R";
        style = "bold bg:mauve fg:base";
      };

      add_newline = true;
      character = {
        format = "$symbol";
        success_symbol = "[┗━](bold mauve)[ ](bold mauve)";
        error_symbol = "[┗━](bold red)[ ](bold red)";
        vicmd_symbol = "[┗━](bold green)[ ](bold green)";
      };
    };
  };
}
