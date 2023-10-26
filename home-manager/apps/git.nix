{
  programs.git = {
    enable = true;
    includes = [
      { path = "~/nixos-hyprland/home-manager/apps/config/gitconfig"; }
    ];
    delta = {
      enable = true;
      options = {
        features = "side-by-side line-numbers decorations";
        width = 200;
      };
    };
  };
}
