{
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./docker.nix
    ./fonts.nix
    ./gnupg.nix
    ./locale.nix
    ./networking.nix
    ./nix.nix
    ./pipewire.nix
    ./services.nix
    ./zsh.nix
  ];

  nixpkgs = {
    # you can add global overlays here
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron"
        "zotero-6.0.27"
      ];
    };
  };

  hardware.enableRedistributableFirmware = true;
}
