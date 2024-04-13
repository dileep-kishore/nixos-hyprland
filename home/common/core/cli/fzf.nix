# https://github.com/junegunn/fzf
{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    defaultCommand = "fd";
    defaultOptions = [
      "--height 40%"
      "--reverse"
    ];
    fileWidgetOptions = [
      "--preview 'bat --style=numbers --color=always --line-range :100 {}'"
    ];
    colors = {
      fg = "#908caa";
      bg = "#191724";
      hl = "#ebbcba";
      "fg+" = "#e0def4";
      "bg+" = "#26233a";
      "hl+" = "#ebbcba";
      border = "#403d52";
      header = "#31748f";
      gutter = "#191724";
      spinner = "#f6c177";
      info = "#9ccfd8";
      separator = "#403d52";
      pointer = "#c4a7e7";
      marker = "#eb6f92";
      prompt = "#908caa";
    };
    tmux = {
      enableShellIntegration = true;
    };
  };
}
