{ config, lib, pkgs, ... }:
{
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
      };
      palette = "catppuccin_mocha";
      format = lib.concatStrings [
        "[┏](bold blue)[  ](bold bg:blue fg:crust)"
        "[](fg:blue bg:black)"
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
        style = "bg:red fg:crust";
        format = "[](fg:red)[$symbol$status]($style)[](fg:red)";
        disabled = false;
        symbol = " ";
        not_executable_symbol = " ";
      };
      shlvl = {
        disabled = false;
        format = "[](fg:yellow)[$symbol$shlvl]($style)[](fg:yellow)";
        style = "bg:yellow fg:crust";
        symbol = " ";
        threshold = 3;
      };
      sudo = {
        format = "[](fg:red)[$symbol]($style)[](fg:red)";
        style = "bg:red fg:crust";
        symbol = " ";
        disabled = false;
      };
      username = {
        style_user = "bg:cyan fg:crust";
        style_root = "bg:cyan fg:crust";
        format = "[](fg:cyan)[$user]($style)[](fg:cyan)";
        disabled = false;
        show_always = false;
      };
      hostname = {
        format = "[  ](bg:cyan fg:crust)[$hostname]($style)[](fg:cyan)";
        style = "bg:cyan fg:crust";
        ssh_symbol = " ";
      };
      directory = {
        format = "[](fg:mauve)[$path]($style)[$read_only]($read_only_style)[](fg:mauve)";
        style = "bold bg:mauve fg:crust";
        read_only_style = "bold bg:mauve fg:red";
        read_only = "  ";
        home_symbol = " ";
        truncation_symbol = "/";
        truncate_to_repo = true;
      };

      git_branch = {
        format = "[](fg:green)[$symbol$branch]($style)";
        style = "bold bg:green fg:crust";
        symbol = " ";
        truncation_length = 25;
      };
      git_commit = {
        format = "[](fg:green)[\\($hash$tag\\)]($style)";
        tag_disabled = false;
        tag_symbol = " ";
        only_detached = true;
        style = "bold bg:green fg:crust";
      };
      git_state = {
        style = "bold bg:green fg:crust";
      };
      git_status = {
        format = "([\\[$all_status$ahead_behind\\]]($style))[](fg:green)";
        style = "bold bg:green fg:crust";
      };
      hg_branch = {
        format = "[](fg:green)[$symbol$branch]($style)[](fg:green)";
        style = "bold bg:green fg:crust";
        symbol = " ";
      };

      package = {
        format = "[](fg:peach)[$symbol$version]($style)[](fg:peach)";
        symbol = " ";
        style = "bold bg:peach fg:crust";
        display_private = true;
      };

      fill = {
        symbol = " ";
        style = "light gray";
      };

      # RIGHT prompt
      container = {
        format = "[](fg:blue)[$symbol $name]($style)[](fg:blue)";
        symbol = "󰡨";
        style = "bold bg:blue fg:crust";
      };
      docker_context = {
        format = "[](fg:blue)[$symbol$context]($style)[](fg:blue)";
        symbol = " ";
        style = "bold bg:blue fg:crust";
      };

      nix_shell = {
        format = "[](fg:blue)[$symbol$state(\($name\))]($style)[](fg:blue)";
        impure_msg = "[ ](bold fg:#8A3324  bg:blue)";
        pure_msg = "[ ](bold fg:crust bg:blue)";
        style = "bold bg:blue fg:crust";
        symbol = "";
      };

      python = {
        format = "[](fg:yellow)[$symbol$pyenv_prefix($version )(\($virtualenv\))]($style)[](fg:yellow)";
        symbol = " ";
        style = "bold bg:yellow fg:crust";
      };
      conda = {
        format = "[](fg:green)[$symbol$environment]($style)[](fg:green)";
        symbol = " ";
        style = "bold bg:green fg:crust";
      };


      lua = {
        format = "[](fg:sky)[$symbol$version]($style)[](fg:sky)";
        symbol = " ";
        style = "bold bg:sky fg:crust";
      };
      nodejs = {
        format = "[](fg:green)[$symbol($version )]($style)[](fg:green)";
        symbol = "󰎙 ";
        style = "bold bg:green fg:crust";
      };
      rlang = {
        format = "[](fg:sapphire)[$symbol($version)]($style)[](fg:sapphire)";
        symbol = "󰟔 ";
        style = "bold bg:sapphire fg:crust";
      };
      julia = {
        format = "[](fg:maroon)[$symbol($version)]($style)[](fg:maroon)";
        symbol = " ";
        style = "bold bg:maroon fg:crust";
      };
      golang = {
        symbol = " ";
        format = "[](fg:cyan)[$symbol($version)]($style)[](fg:cyan)";
        style = "bold bg:cyan fg:crust";
      };
      rust = {
        symbol = " ";
        format = "[](fg:peach)[$symbol($version)]($style)[](fg:peach)";
        style = "bold bg:peach fg:crust";
      };
      haskell = {
        symbol = " ";
        format = "[](fg:mauve)[$symbol($version)]($style)[](fg:mauve)";
        style = "bold bg:mauve fg:crust";
      };
      java = {
        symbol = " ";
        format = "[](fg:peach)[$symbol($version)]($style)[](fg:peach)";
        style = "bold bg:peach fg:crust";
      };
      dart = {
        symbol = " ";
        format = "[](fg:teal)[$symbol($version)]($style)[](fg:teal)";
        style = "bold bg:teal fg:crust";
      };
      ruby = {
        symbol = " ";
        format = "[](fg:red)[$symbol($version)]($style)[](fg:red)";
        style = "bold bg:red fg:crust";
      };
      scala = {
        symbol = " ";
        format = "[](fg:red)[$symbol($version)]($style)[](fg:red)";
        style = "bold bg:red fg:crust";
      };
      typst = {
        symbol = "t ";
        format = "[](fg:blue)[$symbol($version)]($style)[](fg:blue)";
        style = "bold bg:blue fg:crust";
      };

      c = {
        format = "[](fg:blue)[$symbol($version(-$name))]($style)[](fg:blue)";
        symbol = " ";
        style = "bold bg:blue fg:crust";
      };

      memory_usage = {
        threshold = 80;
        format = "[](fg:red)[$symbol$ram]($style)[](fg:red)";
        disabled = false;
        symbol = "󰍛 ";
        style = "bold bg:red fg:crust";
      };
      cmd_duration = {
        format = "[](fg:yellow)[ $duration]($style)[](fg:yellow)";
        min_time = 5000;
        style = "bold bg:yellow fg:crust";
      };
      jobs = {
        format = "[](fg:yellow)[$symbol$number]($style)[](fg:yellow)";
        number_threshold = 2;
        symbol = " ";
        style = "bold bg:yellow fg:crust";
      };
      time = {
        format = "[](fg:blue)[ $time ]($style)";
        disabled = false;
        time_format = "%R";
        style = "bold bg:blue fg:crust";
      };


      add_newline = true;
      character = {
        format = "$symbol";
        success_symbol = "[┗━](bold blue)[ ](bold blue)";
        error_symbol = "[┗━](bold red)[ ](bold red)";
        vicmd_symbol = "[┗━](bold green)[ ](bold green)";
      };
    };
  };
}
