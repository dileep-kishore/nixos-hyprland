{
  description = "NixOS hyprland setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@attrs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        nixos-xps = lib.nixosSystem {
          inherit system;
          specialArgs = attrs;
          modules = [
            ./nixos/nixos-xps/configuration.nix
          ];
        };

        tsuki = lib.nixosSystem {
          inherit system;
          specialArgs = attrs;
          modules = [
            ./nixos/tsuki/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                users.dileep = ./home-manager/home.nix;
              };
            }
          ];
        };
      };
    };
}
