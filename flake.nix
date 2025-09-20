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
      sops-nix,
      spicetify-nix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      hosts = {
        common = import ./hosts/common { };
        redpoint = import ./hosts/redpoint { };
        onsight = import ./hosts/onsight { };
      };

      spicePkgs = spicetify-nix.legacyPackages.${system};
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (self: super: {
            spicetifyThemes = spicePkgs.themes;
            spicetifyExtensions = spicePkgs.extensions;
            cheatbreaker = super.callPackage ./pkgs/cheatbreaker.nix { };
          })
        ];
      };

      modules = [
        ./home
        ./modules/home
        spicetify-nix.homeManagerModules.spicetify
        sops-nix.homeManagerModules.sops
      ];

      host-modules = [
        hosts.common.default
        ./modules/nixos
      ];
    in
    {
      nixosConfigurations = {
        redpoint = nixpkgs-stable.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ hosts.redpoint.default ] ++ host-modules;
        };

        onsight = nixpkgs-stable.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ hosts.onsight.default ] ++ host-modules;
        };
      };

      homeConfigurations = {
        "jackson@redpoint" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs;
          };
          inherit modules;
        };
      };

    };
}
