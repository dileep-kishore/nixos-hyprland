{
  description = "NixOS hyprland setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... }@attrs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        nixos-xps = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = attrs;
          modules = [
            ./nixos/nixos-xps/configuration.nix
          ];
        };

        tsuki = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = attrs;
          modules = [
            ./nixos/tsuki/configuration.nix
          ];
        };
      };

      # home-manager.users.hyprland = {
      #   imports = [
      #     ./home.nix
      #   ];
      # };

    };
}
