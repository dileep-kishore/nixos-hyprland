{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode-fhs
    zed-editor
  ];
}
