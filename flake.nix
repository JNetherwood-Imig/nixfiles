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

    nix-colors.url = "github:Misterio77/nix-colors";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zig.url = "github:mitchellh/zig-overlay";
  };

  outputs =
    {
      nixpkgs-stable,
      nixpkgs,
      home-manager,
      nix-colors,
      sops-nix,
      spicetify-nix,
      zen-browser,
      zig,
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
            cheatbreaker = super.callPackage ./pkgs/cheatbreaker.nix { };
            spicetifyExtensions = spicePkgs.extensions;
            spicetifyThemes = spicePkgs.themes;
            zigpkgs = zig.packages.${system};
          })
        ];
      };

      modules = [
        ./home
        ./modules/home
        nix-colors.homeManagerModules.default
        spicetify-nix.homeManagerModules.spicetify
        sops-nix.homeManagerModules.sops
        zen-browser.homeModules.beta
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
            inherit (inputs) nix-colors;
          };
          inherit modules;
        };
      };

    };
}
