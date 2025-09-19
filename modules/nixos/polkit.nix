{ config, lib, ... }:
let
  cfg = config.polkit;
in
{
  options.polkit.enable = lib.mkEnableOption "polkit";
  config = lib.mkIf cfg.enable {
    security.polkit.enable = true;
    services.gnome.gnome-keyring.enable = true;
  };
}
