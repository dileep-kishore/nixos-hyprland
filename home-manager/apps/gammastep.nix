{
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 36.012009;
    longitude = -84.265533;
    dawnTime = "4:00-5:00";
    duskTime = "18:00-19:00";
    temperature = {
      day = 6500;
      night = 4500;
    };
    settings = {
      general = {
        brightness-day = 1.0;
        brightness-night = 1.0;
      };
    };
    tray = true;
  };
}
