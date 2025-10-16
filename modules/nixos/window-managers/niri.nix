{ config, lib, ... }:
{
  config = {
    programs.niri.enable = config.windowManagers.niri.enable;
    programs.dconf.enable = lib.mkForce true;
  };
}
