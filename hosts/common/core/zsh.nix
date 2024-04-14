#
# This is a basic enablement of zsh at the host level as a safe guard
#
{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [zsh];
}
