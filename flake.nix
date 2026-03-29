{
  # Requires: git, flakes, home manager

  description = "Initial flake combining whole OS together with home-manager and programs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    #nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
      /*url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";*/
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {

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
