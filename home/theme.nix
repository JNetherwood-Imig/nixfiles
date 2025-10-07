{ pkgs, ... }:
{
  gtk = {
    enable = true;
    colorScheme = "dark";
    theme = {
      name = "Gruvbox-Dark-Medium";
      package = pkgs.gruvbox-gtk-theme.override {
        tweakVariants = [ "medium" ];
      };
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    cursorTheme = {
      name = "capitaine-cursors";
      size = 32;
      package = pkgs.capitaine-cursors;
    };
  };
}
