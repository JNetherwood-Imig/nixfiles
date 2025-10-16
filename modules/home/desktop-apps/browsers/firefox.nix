{ config, lib, ... }:
{
  config.programs.firefox = lib.mkIf config.desktopApps.browsers.firefox.enable {
    enable = true;
  };
}
