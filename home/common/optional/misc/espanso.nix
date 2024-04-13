{pkgs, ...}: {
  services.espanso = {
    enable = true;
    package = pkgs.espanso-wayland;
    configs = {
      default = {};
    };
    matches = {
      base = {
        matches = [
          {
            trigger = ":espanso";
            replace = "Hi there!";
          }
          {
            trigger = ":date";
            replace = "{{mydate}}";
          }
        ];
      };
      global_vars = {
        global_vars = [
          {
            name = "mydate";
            type = "date";
            params = {format = "%Y-%m-%d";};
          }
        ];
      };
    };
  };
}
