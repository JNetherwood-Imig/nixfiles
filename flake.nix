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

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      hyprland,
      niri,
      sops,
      spicetify,
      stylix,
      zen,
      ...
    }:
    let
      system = "x86_64-linux";

      hyprPkgs = hyprland.packages.${system};
      # spicePkgs = spicetify.legacyPackages.${system};

      overlays = [
        niri.overlays.niri

        (self: super: {
          cheatbreaker = super.callPackage ./pkgs/cheatbreaker.nix { };
          hyprland = hyprPkgs.hyprland;
          xdg-desktop-portal-hyprland = hyprPkgs.xdg-desktop-portal-hyprland;
          # spicetify.extensions = spicePkgs.extensions;
          # spicetify.themes = spicePkgs.themes;
        })
      ];

      home-modules = [
        ./home
        ./modules/home

        niri.homeModules.niri
        niri.homeModules.stylix
        sops.homeManagerModules.sops
        spicetify.homeManagerModules.spicetify
        zen.homeModules.beta
      ];

      host-modules = [
        ./hosts/common
        ./modules/nixos

        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager

        {
          nixpkgs.overlays = overlays;
          home-manager = {
            backupFileExtension = "backup";
            useGlobalPkgs = true;
            useUserPackages = true;
            users.jackson = import ./home;
            sharedModules = home-modules;
          };
        }
      ];
    in
    {
      nixosConfigurations = {
        redpoint = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/redpoint ] ++ host-modules;
        };

        onsight = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/onsight ] ++ host-modules;
        };
      };
    };
}
