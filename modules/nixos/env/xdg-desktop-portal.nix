{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.env.xdgDesktopPortal;
in
{
  options.env.xdgDesktopPortal = {
    enable = lib.mkEnableOption "xdg-desktop-portal";
  };

  config = lib.mkIf cfg.enable {
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
        pkgs.xdg-desktop-portal-wlr
      ];

      config.common = {
        "org.freedesktop.portal.Secret" = [ "gnome-keyring" ];
        default = "gtk";
      };
    };

    security.polkit.enable = true;
    services.gnome.gnome-keyring.enable = true;
  };
}
