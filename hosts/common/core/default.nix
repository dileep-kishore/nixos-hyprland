{outputs, ...}: {
  imports = [
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
        "electron-24.8.6"
        "electron-22.3.27"
        "electron-25.9.0"
        "zotero-6.0.27"
      ];
    };
  };

  hardware.enableRedistributableFirmware = true;
}
