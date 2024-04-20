{
  description = "NixOS hyprland setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # TODO: Apply fixes to nixos-xps
    hardware.url = "github:nixos/nixos-hardware";
    nix-colors.url = "github:misterio77/nix-colors";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-darwin
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # secrets
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };

    # neovim
    neovim = {
      url = "github:dileep-kishore/neovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland
    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib // nix-darwin.lib;
    systems = ["x86_64-linux" "x86_64-darwin"];
    forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs systems (system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
  in {
    inherit lib;

    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    # Custom modifications/overrides to upstream packages.
    overlays = import ./overlays {inherit inputs outputs;};

    # Custom packages to be shared or upstreamed.
    packages = forEachSystem (pkgs: import ./pkgs {inherit pkgs;});

    formatter = forEachSystem (pkgs: pkgs.alejandra);

    devShells = forEachSystem (pkgs: import ./shell.nix {inherit pkgs;});

    # NOTE: home-manager is also imported as a module within nixosConfigurations
    nixosConfigurations = {
      # Main desktop
      tsuki = lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/tsuki
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {inherit inputs outputs;};
          }
        ];
      };

      # Home Laptop
      nixos-xps = lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/nixos-xps
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {inherit inputs outputs;};
          }
        ];
      };
    };

    darwinConfigurations = {
      # Work Laptop
      Mac124929 = lib.darwinSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/Mac124929
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {inherit inputs outputs;};
          }
        ];
      };
    };

    homeConfigurations = {
      # Work
      "g8k@Mac124929" = lib.homeManagerConfiguration {
        modules = [./home/Mac124929.nix];
        pkgs = pkgsFor.x86_64-darwin;
        extraSpecialArgs = {inherit inputs outputs;};
      };
      "g8k@lap135849" = lib.homeManagerConfiguration {
        modules = [./home/lap135849.nix];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
      };
    };
  };
}
