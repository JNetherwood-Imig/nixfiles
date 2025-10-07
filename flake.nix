{
  description = "NixOS System Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
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

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      sops-nix,
      spicetify-nix,
      zen-browser,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      spicePkgs = spicetify-nix.legacyPackages.${system};
      overlays = [
        (self: super: {
          cheatbreaker = super.callPackage ./pkgs/cheatbreaker.nix { };
          spicetifyExtensions = spicePkgs.extensions;
          spicetifyThemes = spicePkgs.themes;
        })
      ];

      home-modules = [
        ./home
        ./modules/home
        sops-nix.homeManagerModules.sops
        spicetify-nix.homeManagerModules.spicetify
        zen-browser.homeModules.beta
      ];

      common-modules = [
        ./hosts/common
        ./modules/nixos
        home-manager.nixosModules.home-manager
        {
          nixpkgs.overlays = overlays;
          home-manager = {
            backupFileExtension = "backup";
            useGlobalPkgs = true;
            useUserPackages = true;
            users.jackson = import ./home;
            sharedModules = home-modules;
            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    in
    {
      nixosConfigurations = {
        redpoint = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/redpoint
          ]
          ++ common-modules;
        };

        onsight = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/onsight ] ++ common-modules;
        };
      };
    };
}
