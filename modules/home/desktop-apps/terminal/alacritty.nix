{ config, lib, ... }: {
  programs.alacritty = lib.mkIf (config.desktopApps.terminal == "alacritty") {
    enable = true;
  };
}
