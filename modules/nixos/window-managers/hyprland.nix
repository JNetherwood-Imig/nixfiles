{ config, lib, ... }:
{
  config = {
    programs.hyprland.enable = config.windowManagers.hyprland.enable;
    programs.dconf.enable = lib.mkForce true;
  };
}
