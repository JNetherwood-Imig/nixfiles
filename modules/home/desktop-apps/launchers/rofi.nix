{ config, lib, ... }:
{
  config.programs.rofi = lib.mkIf config.desktopApps.launchers.rofi.enable {
    enable = true;
  };
}
