{pkgs, ...}: {
  home.packages = with pkgs; [
    aider-chat
    python312Packages.playwright
    python312Packages.greenlet
    python312Packages.pyee
    python312Packages.typing-extensions
  ];
  home.file.".aider.conf.yml".source = ./.aider.conf.yml;
}
