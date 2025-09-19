{ config, lib, ... }:

let
  cfg = config.desktopApps.rofi;
in
{
  options.desktopApps.rofi = {
    enable = lib.mkEnableOption "rofi";
  };

  config = lib.mkIf cfg.enable {
    programs.rofi.enable = true;
  };
}
