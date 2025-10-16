{ config, lib, ... }:
{
  config.programs.fuzzel = lib.mkIf config.desktopApps.launchers.fuzzel.enable {
    enable = true;
  };
}
