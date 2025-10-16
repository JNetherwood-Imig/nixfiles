{ config, lib, ... }:
{
  config.programs.alacritty = lib.mkIf config.desktopApps.terminals.alacritty.enable {
    enable = true;
  };
}
