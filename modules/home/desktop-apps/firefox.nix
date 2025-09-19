{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  cfg = config.desktopApps.firefox;
in
{
  options.desktopApps.firefox = {
    enable = lib.mkEnableOption "firefox";

    manageExtensions = lib.mkOption {
      type = lib.types.bool;
      description = "Enable managing Firefox extensions";

      default = true;
    };

    extraSearchEngines = {
      enable = lib.mkOption {
        type = lib.types.bool;
        description = "Enable extra search engines";

        default = true;
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;

      profiles.jackson = {
        extensions.packages = lib.mkIf cfg.manageExtensions (
          with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
          [
            better-canvas
            better-darker-docs
            dictionary-spanish
            darkreader
            enhanced-github
            i-dont-care-about-cookies
            mtab
            plasma-integration
            proton-pass
            return-youtube-dislikes
            sponsorblock
            stylus
          ]
        );

        search.force = cfg.extraSearchEngines.enable;
        search.engines = lib.mkIf cfg.extraSearchEngines.enable {
          # "Nix Packages" = lib.mkIf cfg.nixpkgsSearchEngine { };
          # "NixOS Options" = lib.mkIf cfg.nixoptsSearchEngine { };
          # "Home Manager Options" = lib.mkIf cfg.homeManagerSearchEngine { };
        };
      };
    };
  };
}
