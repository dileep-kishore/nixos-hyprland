# You can build these directly using 'nix build .#example'
{pkgs ? import <nixpkgs> {}}: rec {
  #################### Packages with external source ####################

  # example = pkgs.callPackage ./example { };
  clickup-latest = pkgs.callPackage ./clickup-latest {};
  capacities-latest = pkgs.callPackage ./capacities-latest {};
  morgen-latest = pkgs.callPackage ./morgen-latest {};
  opencode-latest = pkgs.callPackage ./opencode-latest {};
}
