{ config, lib, ... }: {
  programs.rofi = lib.mkIf (config.desktopApps.launcher == "rofi") {
    enable = true;
  };
}
