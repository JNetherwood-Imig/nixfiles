{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.desktopApps.protonPass;
in
{
  options.desktopApps.protonPass = {
    enable = lib.mkEnableOption "proton-pass";
  };
  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.proton-pass ];
  };
}
