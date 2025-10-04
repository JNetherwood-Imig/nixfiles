{ pkgs, ... }:

{
  programs.spicetify = {
    enable = true;
    theme = pkgs.spicetifyThemes.lucid;
    colorScheme = "dark";
    enabledExtensions = [ pkgs.spicetifyExtensions.fullAppDisplay ];
  };
}
