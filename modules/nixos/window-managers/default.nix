{ config, lib, ... }:
let
  wm = lib.types.enum [
    "gnome"
    "hyprland"
    "niri"
    "plasma"
  ];
in
{
  imports = [
    ./plasma.nix
    ./gnome.nix
  ];

  options.windowManagers = lib.mkOption {
    type = lib.types.listOf wm;
  };

  config.home-manager.extraSpecialArgs.window-managers = config.windowManagers;
}
