{ config, lib, ... }: {
  programs.foot = lib.mkIf (config.desktopApps.terminal == "foot") {
    enable = true;
    server.enable = true;
  };
}
