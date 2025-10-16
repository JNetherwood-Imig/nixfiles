{ config, lib, ... }:
{
  config.programs.foot = lib.mkIf config.desktopApps.terminals.foot.enable {
    enable = true;
    server.enable = true;
  };
}
