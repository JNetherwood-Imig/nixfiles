{ config, lib, ... }: {
  programs.kitty = lib.mkIf (config.desktopApps.terminal == "kitty") {
    enable = true;
    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
