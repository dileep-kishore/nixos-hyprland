# https://github.com/emersion/mako
{
  services.mako = {
    enable = false;
    settings = {
      anchor = "top-right";
      borderRadius = "2";
      borderSize = "2";
      font = "Maple Mono";
      icons = "true";
      backgroundColor = "#1e1e2e";
      textColor = "#cdd6f4";
      borderColor = "#cba6f7";
      progressColor = "#313244";
    };
    criteria = {
      "urgency=high" = {
        borderColor = "#fab387";
      };
    };
  };
}
