{ pkgs, ... }: {
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
}
