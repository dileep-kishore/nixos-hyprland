{ config, lib, pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableTransience = true;
    settings = {
      format = "[┏](bold cyan)$status$all";
      add_newline = true;
      character = {
        format = "$symbol";
        success_symbol = "[┗━](bold cyan)[ ](bold cyan)";
        error_symbol = "[┗━](bold red)[ ](bold red)";
        vicmd_symbol = "[┗━](bold green)[ ](bold green)";
      };
      sudo = {
        format = "[as ](italic)[$symbol]($style)";
        symbol = " ";
        disabled = false;
      };
      directory = {
        read_only = "  ";
        home_symbol = " ";
        truncation_symbol = "../";
        truncate_to_repo = true;
      };
      status = {
        disabled = false;
        symbol = " ";
        not_executable_symbol = " ";
      };
      shlvl = {
        disabled = false;
        symbol = " ";
        threshold = 3;
      };
      jobs = {
        number_threshold = 2;
        symbol = " ";
      };
      cmd_duration = {
        format = "[took](italic) [$duration]($style) ";
        min_time = 5000;
      };
      memory_usage = {
        threshold = 80;
        disabled = false;
      };
      # symbols
      aws = {
        symbol = "  ";
      };
      buf = {
        symbol = " ";
      };
      c = {
        symbol = " ";
      };
      conda = {
        symbol = " ";
      };
      dart = {
        symbol = " ";
      };
      docker_context = {
        symbol = " ";
      };
      elixir = {
        symbol = " ";
      };
      elm = {
        symbol = " ";
      };
      fossil_branch = {
        symbol = " ";
      };
      git_branch = {
        format = "[on](italic) [$symbol$branch(:$remote_branch)]($style) ";
        symbol = " ";
      };
      golang = {
        symbol = " ";
      };
      guix_shell = {
        symbol = " ";
      };
      haskell = {
        symbol = " ";
      };
      haxe = {
        symbol = " ";
      };
      hg_branch = {
        symbol = " ";
      };
      hostname = {
        ssh_symbol = " ";
      };
      java = {
        symbol = " ";
      };
      julia = {
        symbol = " ";
      };
      lua = {
        symbol = " ";
      };
      memory_usage = {
        symbol = "󰍛 ";
      };
      meson = {
        symbol = "󰔷 ";
      };
      nim = {
        symbol = "󰆥 ";
      };
      nix_shell = {
        format = "[via](italic) [$symbol$state( \($name\))]($style) ";
        symbol = " ";
      };
      nodejs = {
        format = "[via](italic) [$symbol($version )]($style)";
        symbol = "󰎙 ";
      };
      package = {
        symbol = "󰏗 ";
      };
      pijul_channel = {
        symbol = " ";
      };
      python = {
        format = "[via](italic) [$symbol$pyenv_prefix($version )(\($virtualenv\) )]($style)";
        symbol = " ";
      };
      rlang = {
        symbol = "󰟔 ";
      };
      ruby = {
        symbol = " ";
      };
      rust = {
        symbol = " ";
      };
      scala = {
        symbol = " ";
      };
    };
  };
}
