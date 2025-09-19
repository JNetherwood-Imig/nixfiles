{
  description = "NixOS System Configuration";

  inputs = {
    nixpkgs-stable.url = "nixpkgs/nixos-25.05";
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs =
    {
      nixpkgs-stable,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      hosts = {
        common = import ./hosts/common { };
        redpoint = import ./hosts/redpoint { };
        onsight = import ./hosts/onsight { };
      };

      lib =
        (import nixpkgs-stable {
          config.allowUnfree = true;
        }).lib;

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (self: super: {
            cheatbreaker = super.callPackage ./pkgs/cheatbreaker { };
          })
        ];
      };

      host-exports = {
        common = hosts.common.exports;
        redpoint = hosts.redpoint.exports;
        onsight = hosts.onsight.exports;
      };

      modules = [
        ./home
        ./modules/home
        inputs.spicetify-nix.homeManagerModules.spicetify
        inputs.sops-nix.homeManagerModules.sops
      ];

      host-modules = [
        hosts.common.default
        ./modules/nixos
      ];
    in
    {
      homeConfigurations.jackson = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
          inherit host-exports;
        };
        inherit modules;
      };

      nixosConfigurations = {
        redpoint = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ hosts.redpoint.default ] ++ host-modules;
        };

        onsight = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ hosts.onsight.default ] ++ host-modules;
        };
      };
    };
}
