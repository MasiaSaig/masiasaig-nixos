{
  description = "Flake combining whole OS together with home-manager and programs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:outfoxxed/quickshell";
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
    quickshell,
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
