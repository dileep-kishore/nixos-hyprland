{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };
      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];
      input-field = [
        {
          size = "200, 50";
          halign = "center";
          valign = "center";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          hide_input = false;
          font_family = "Maple Mono NF";
          font_color = "rgb(205, 214, 244)";
          inner_color = "rgb(30, 30, 46)";
          outer_color = "rgb(203, 166, 247)";
          outline_thickness = 5;
          placeholder_text = "<i>Password...</i>";
          shadow_passes = 2;
          check_color = "rgb(166, 227, 161)";
          fail_color = "rgb(243, 139, 168)";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          fail_timeout = 2000;
          fail_transition = 300;
        }
      ];
    };
  };
}
