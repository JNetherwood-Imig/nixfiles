{ config, lib, ... }:

let
  cfg = config.desktopApps.swww;
in
{
  options.desktopApps.swww = {
    enable = lib.mkEnableOption "swww";
  };

  config = lib.mkIf cfg.enable {
    services.swww.enable = true;
  };
}
