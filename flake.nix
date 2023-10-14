{
  description = "NixOS hyprland setup";

  # TODO: Git init (set up main)

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs }: {

    nixosConfigurations.hyprland = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];
    };

    home-manager.users.hyprland = {
      imports = [
        ./home.nix
      ];
    };

  };
}
