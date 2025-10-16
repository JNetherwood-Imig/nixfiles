{ lib, ... }:
{
  imports = [
    ./zed.nix
  ];

  options.desktopApps.editors = {
    defaultCmd = lib.mkOption {
      type = lib.types.enum [ "zeditor" ];
    };
    zed.enable = lib.mkEnableOption "zed";
  };
}
