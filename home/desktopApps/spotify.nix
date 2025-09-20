{ pkgs, ... }:

{
  programs.spicetify = {
    enable = true;
    windowManagerPatch = true;
    theme = pkgs.spicetifyThemes.onepunch;
    colorScheme = "dark";
  };
}
