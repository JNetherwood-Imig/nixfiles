{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  cfg = config.desktopApps.spotify;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  options.desktopApps.spotify = {
    enable = lib.mkEnableOption "spotify";

    manageExtensions = lib.mkOption {
      type = lib.types.bool;
      description = "Manage Spotify extensions";

      default = true;
    };

    theme = {
      scheme = lib.mkOption {
        type = lib.types.str;
        description = "Theme color scheme";

        default = "mocha";
      };

      package = lib.mkOption {
        type = lib.types.enum (builtins.attrValues spicePkgs.themes);
        description = "Spicetify theme package";

        default = spicePkgs.themes.catppuccin;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.spicetify = {
      enable = true;
      theme = cfg.theme.package;
      colorScheme = cfg.theme.scheme;
      enabledExtensions = lib.mkIf cfg.manageExtensions (
        with spicePkgs.extensions;
        [
          hidePodcasts
        ]
      );
    };
  };
}
