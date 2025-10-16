{ lib, ... }:
{
  imports = [
    ./firefox.nix
    ./zen.nix
  ];

  options.desktopApps.browsers = {
    defaultCmd = lib.mkOption {
      type = lib.types.enum [
        "firefox"
        "zen"
      ];
    };
    firefox.enable = lib.mkEnableOption "firefox";
    zen.enable = lib.mkEnableOption "zen";
  };
}
