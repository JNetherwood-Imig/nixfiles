{ config, lib, pkgs, ... }: {
  programs.firefox = lib.mkIf (config.desktopApps.browser == "firefox") {
    enable = true;
  };
}
