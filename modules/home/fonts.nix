{
  config,
  lib,
  ...
}:

let
  cfg = config.fonts;
in
{
  options.fonts.enable = lib.mkEnableOption "fonts";
  config = lib.mkIf cfg.enable {
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        # sansSerif = "Noto Sans";
        # emoji = "Noto Color Emoji";
        monospace = "JetBrains Mono Nerd Font";
      };
    };
  };
}
