{ config, lib, ... }:

let
  cfg = config.desktopApps.ghostty;
in
{
  options.desktopApps.ghostty = {
    enable = lib.mkEnableOption "ghostty";

    theme = lib.mkOption {
      type = lib.types.str;
      description = "Ghostty theme";

      default = "Gruvbox Dark";
    };

    fontSize = lib.mkOption {
      type = lib.types.int;
      description = "Font size";

      default = 16;
    };
  };

  config = lib.mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;
      installVimSyntax = true;
      installBatSyntax = true;
      settings = {
        theme = cfg.theme;
        font-size = cfg.fontSize;
      };
    };
  };
}
