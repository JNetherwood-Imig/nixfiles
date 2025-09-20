{ pkgs, ... }:

{
  programs.spicetify = {
    enable = true;
    theme = pkgs.spicetifyThemes.lucid;
    colorScheme = "dark";
    extensions = [ pkgs.spicetifyExtensions.fullAppDisplay ];
  };
}
