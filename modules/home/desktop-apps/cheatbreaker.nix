{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.desktopApps.cheatbreaker;
in
{
  options.desktopApps.cheatbreaker.enable = lib.mkEnableOption "cheatbreaker";
  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.cheatbreaker ];
  };
}
