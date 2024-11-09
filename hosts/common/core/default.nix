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
        "electron-28.3.3"
        "electron-27.3.11"
        "electron-25.9.0"
        "electron-24.8.6"
        "electron-22.3.27"
        "zotero-6.0.27"
      ];
    };
  };

  hardware.enableRedistributableFirmware = true;
}
