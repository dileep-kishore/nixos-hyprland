# https://github.com/emersion/mako
{
  services.mako = {
    enable = true;
    anchor = "top-right";
    backgroundColor = "#191724";
    borderColor = "#c4a7e7";
    borderRadius = 2;
    textColor = "#e0def4";
    progressColor = "over #f6c177";
    borderSize = 2;
    font = "Maple Mono";
    icons = true;
    extraConfig = builtins.readFile ./config;
  };
}
