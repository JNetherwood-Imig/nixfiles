{
  description = "NixOS System Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      hosts = {
        common = import ./hosts/common {};
        redpoint = import ./hosts/redpoint {};
        onsight = import ./hosts/onsight {};
      };

      host-modules = [
        hosts.common.default
        ./modules/nixos
      ];

      host-exports = {
        common = hosts.common.exports;
        redpoint = hosts.redpoint.exports;
        onsight = hosts.onsight.exports;
      };

      home-modules = [
        ./home
        ./modules/home
        inputs.spicetify-nix.homeManagerModules.spicetify
      ];

    in
    {
      nixosConfigurations = {
        redpoint = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ hosts.redpoint.default ] ++ host-modules;
        };

        onsight = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ hosts.onsight.default ] ++ host-modules;
        };
      };

      homeConfigurations.jackson = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs-unstable.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs;
          inherit host-exports;
        };
        modules = home-modules;
      };
    };
}
