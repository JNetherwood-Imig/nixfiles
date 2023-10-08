{ config, pkgs, ... }:

{
  config = {
    programs.firefox.enable = true;
    programs.alacritty.enable = true;
    services.easyeffects.enable = true;
    fonts.fontconfig.enable = true;
    gtk = {
      enable = true;

      cursorTheme = {
        name = "capitaine-cursors";
        package = pkgs.capitaine-cursors;
      };

      iconTheme = {
        name = "Nordzy-dark";
        package = pkgs.nordzy-icon-theme;
      };

      theme = {
        name = "Nordic-dark";
        package = pkgs.nordic;
      };
    };
    home.stateVersion = "23.11";
  };
}
