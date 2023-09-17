{
  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let nixosModules.default = import ./modules/nixos;
    homeModules.default = import ./modules/home;
    in {
      nixosConfigurations = {
        redpoint = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/redpoint/configuration.nix
            nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.sharedModules = [ homeModules.default ];
            }
          ];
        };
      };
    };
}
