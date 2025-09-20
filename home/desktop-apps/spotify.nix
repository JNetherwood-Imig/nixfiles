{ pkgs, ... }:

{
  programs.spicetify = {
    enable = true;
    theme = pkgs.spicetifyThemes.onepunch;
    colorScheme = "dark";
  };
}
