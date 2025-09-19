{ config, lib, ... }:

let
  cfg = config.bootLoader;
in
{
  options.bootLoader = lib.mkOption {
    type = lib.types.enum [ "systemd-boot" ];
  };
  config = {
    boot.loader = {
      efi.canTouchEfiVariables = true;
      timeout = 0;
      systemd-boot = lib.mkIf (cfg == "systemd-boot") {
        enable = true;
        editor = false;
      };
    };
  };
}
