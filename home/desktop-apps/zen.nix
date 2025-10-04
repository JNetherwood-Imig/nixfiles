{ pkgs, ... }:
{
programs.zen-browser = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableAppUpdate = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      # Install extensions
      ExtensionSettings = let
        mkExtension = (pluginId: {
          installation_mode = "force_installed";
          install_url =
            "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
        });
        mkExtensions = builtins.mapAttrs (_: id: mkExtension id);
      in mkExtensions {
        "{8927f234-4dd9-48b1-bf76-44a9e153eee0}" = "better-canvas";
        "es-es@dictionaries.addons.mozilla.org" = "diccionario-de-espanol-espana";
        "{72bd91c9-3dc5-40a8-9b10-dec633c0873f}" = "enhanced-github";
        "jid1-KKzOGWgsW3Ao4Q@jetpack" = "i-dont-care-about-cookies";
        "{eac6e624-97fa-4f28-9d24-c06c9b8aa713}" = "material-icons-for-github";
        "78272b6fa58f4a1abaac99321d503a20@proton.me" = "proton-pass";
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = "return-youtube-dislikes";
        "sponsorBlocker@ajay.app" = "sponsorblock";
        "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = "styl-us";
        "uBlock0@raymondhill.net" = "ublock-origin";
      };
    };
    profiles.default = {
      search = {
        force = true;
        default = "ddg";
        engines = let
          nixSnowflake =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        in {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "channel";
                  value = "unstable";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }];
            icon = nixSnowflake;
            definedAliases = [ "nixpkgs" "np" ];
          };
          "Nix Options" = {
            urls = [{
              template = "https://search.nixos.org/options";
              params = [
                {
                  name = "channel";
                  value = "unstable";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }];
            icon = nixSnowflake;
            definedAliases = [ "nixopts" "no" ];
          };
          "Home Manager Options" = {
            urls = [{
              template = "https://home-manager-options.extranix.com/";
              params = [
                {
                  name = "query";
                  value = "{searchTerms}";
                }
                {
                  name = "release";
                  value = "master"; # unstable
                }
              ];
            }];
            icon = nixSnowflake;
            definedAliases = [ "hms" "home" ];
          };
          "Noogle" = {
            urls = [{
              template = "https://noogle.dev/q";
              params = [{
                name = "term";
                value = "{searchTerms}";
              }];
            }];
            icon = nixSnowflake;
            definedAliases = [ "noogle" "ng" ];
          };
          bing.metaData.hidden = "true";
        };
      };
    };
  };
}
