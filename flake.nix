{
  description = "NixOS hyprland setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = { self, nixpkgs, home-manager, sops-nix, ... }@attrs:
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
                extraSpecialArgs = { inherit attrs; };
                useGlobalPkgs = true;
                users.dileep = ./home-manager/home.nix;
              };
            }
          ];
        };
      };
    };
}
