{
  # Requires: git, flakes, home manager

  description = "Initial flake combining everything together";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      # 'follows' for inheriting/following home-manager's (25.11) nixpkgs
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {

#    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;
#    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      #specialArgs = { inherit inputs; };
      modules = [
        ./hosts/laptop-dragon/configuration.nix
      ];
    };

    homeConfigurations.masiasaig = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home/home.nix
      ];
    };
  };
}
