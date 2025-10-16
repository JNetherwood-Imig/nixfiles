{ config, lib, ... }:
{
  config.programs.kitty = lib.mkIf config.desktopApps.terminals.kitty.enable {
    enable = true;
    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
