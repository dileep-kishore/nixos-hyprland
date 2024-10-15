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
      fg = "#cdd6f4";
      bg = "#1e1e2e";
      hl = "#f38ba8";
      "fg+" = "#cdd6f4";
      "bg+" = "#313244";
      "hl+" = "#f38ba8";
      # border = "#1e1e2e";
      header = "#f38ba8";
      # gutter = "#191724";
      spinner = "#f5e0dc";
      info = "#cba6f7";
      # separator = "#1e1e2e";
      pointer = "#f5e0dc";
      marker = "#b4befe";
      prompt = "#cba6f7";
    };
    tmux = {
      enableShellIntegration = true;
    };
  };
}
