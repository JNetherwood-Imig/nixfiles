{ lib, ... }:
{
  imports = [
    ./fuzzel.nix
    ./rofi.nix
  ];

  options.desktopApps.launchers = {
    defaultCmd = lib.mkOption {
      type = lib.types.enum [
        "fuzzel"
        "rofi -show drun -show-icons"
      ];
    };
    fuzzel.enable = lib.mkEnableOption "fuzzel";
    rofi.enable = lib.mkEnableOption "rofi";
  };
}
