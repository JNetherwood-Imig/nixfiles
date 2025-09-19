{ config, lib, ... }:

let
  cfg = config.desktopApps.vesktop;
in
{
  options.desktopApps.vesktop = {
    enable = lib.mkEnableOption "vesktop";
  };

  config = lib.mkIf cfg.enable {
    programs.vesktop.enable = true;
  };
}
