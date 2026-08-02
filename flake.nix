{
  ### CLEAN GARBAGES
  # >> nix-collect-garbage

  description = "Flake combining whole OS together with home-manager and programs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Noctalia v5
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    noctalia,
    ...
  } @inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/laptop-dragon/configuration.nix

        home-manager.nixosModules.home-manager
        {
          # Home Manager settings
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.masiasaig = import ./home/home.nix;
          # Optional backup extension
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = {
            inherit inputs;
          };
        }
      ];
    };
  };
}
