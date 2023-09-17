{
  inputs = { nixpkgs.url = "github:NixOs/nixpkgs/"; };

  outputs = { nixpkgs, ... }:
    let nixosModules.default = import ./modules/nixos;
    in {
      nixosConfigurations = {
        redpoint = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/redpoint/configuration.nix
            nixosModules.default
          ];
        };
      };
    };
}
