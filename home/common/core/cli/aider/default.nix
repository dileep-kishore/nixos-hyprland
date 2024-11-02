{pkgs, ...}: {
  home.packages = with pkgs; [
    aider-chat
  ];
  home.file.".aider.conf.yml".source = ./.aider.conf.yml;
}
