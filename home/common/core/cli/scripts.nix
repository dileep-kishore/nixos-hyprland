{pkgs, ...}: {
  home.packages = with pkgs; [
    (writeShellScriptBin "font-install" (builtins.readFile ./bin/font-install.sh))
    (writeShellScriptBin "rm-sync-conflict" (builtins.readFile ./bin/rm-sync-conflict.sh))
    (writeShellScriptBin "git-bare-clone" (builtins.readFile ./bin/git-bare-clone.sh))
  ];
}
