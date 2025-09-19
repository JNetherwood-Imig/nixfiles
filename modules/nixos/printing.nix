{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.printing;
in
{
  options.printing.enable = lib.mkEnableOption "printing";
  config = lib.mkIf cfg.enable {
    services.printing = {
      enable = true;
      drivers = [
        pkgs.gutenprintBin
        pkgs.canon-cups-ufr2
      ];
    };
    services.avahi = {
      enable = true;
      openFirewall = true;
      nssmdns4 = true;
    };
  };
}
