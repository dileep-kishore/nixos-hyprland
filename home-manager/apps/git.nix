{
  programs.git = {
    enable = true;
    includes = [
      {path = ./config/gitconfig;}
    ];
    delta = {
      enable = true;
      options = {
        features = "line-numbers decorations";
      };
    };
  };
}
