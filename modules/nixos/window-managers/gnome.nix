{
  config,
  lib,
  pkgs,
  ...
}:
{
  # TODO: Add home manager gnome config
  # home-manager.users.myuser = {
  #   dconf = {
  #     enable = true;
  #     settings."org/gnome/shell" = {
  #       disable-user-extensions = false;
  #       enabled-extensions = with pkgs.gnomeExtensions; [
  #         blur-my-shell.extensionUuid
  #         gsconnect.extensionUuid
  #       ];
  #     };
  #   };
  # };

  config = lib.mkIf config.windowManagers.gnome.enable {
    services.desktopManager.gnome.enable = true;
    environment.gnome.excludePackages = (
      with pkgs;
      [
        atomix # puzzle game
        cheese # webcam tool
        epiphany # web browser
        evince # document viewer
        geary # email reader
        gedit # text editor
        gnome-characters
        gnome-music
        gnome-photos
        gnome-terminal
        gnome-tour
        hitori # sudoku game
        iagno # go game
        tali # poker game
        totem # video player
      ]
    );
  };
}
