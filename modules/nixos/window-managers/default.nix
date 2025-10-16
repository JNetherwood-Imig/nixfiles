{ config, lib, ... }:
{
  imports = [
    ./gnome.nix
    ./hyprland.nix
    ./niri.nix
    ./plasma.nix
  ];

  options.windowManagers = {
    gnome.enable = lib.mkEnableOption "gnome";
    hyprland.enable = lib.mkEnableOption "hyprland";
    niri.enable = lib.mkEnableOption "niri";
    plasma.enable = lib.mkEnableOption "plasma";
  };

  config.home-manager.extraSpecialArgs.window-managers = config.windowManagers;
}
