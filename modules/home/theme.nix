{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.theme;
in
{
  options.theme = {
    enable = lib.mkEnableOption "theme";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.dconf ];
    dconf = {
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };
    };

    gtk = {
      enable = true;
      theme = {
        name = "Gruvbox-Dark-Medium";
        package = pkgs.gruvbox-gtk-theme.override {
          tweakVariants = [ "medium" ];
        };
      };
      iconTheme = {
        name = "Gruvbox Plus Dark";
        package = pkgs.gruvbox-plus-icons;
      };
      cursorTheme = {
        name = "capitaine-cursors";
        size = 32;
        package = pkgs.capitaine-cursors;
      };
    };

    home.pointerCursor = {
      enable = true;
      name = "rose-pine-hyprcursor";
      package = pkgs.rose-pine-hyprcursor;
      size = 32;
      hyprcursor.enable = true;
    };
  };
}
