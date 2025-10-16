{ config, lib, pkgs, ... }:
let
  base16Theme = name:
    "${pkgs.base16-schemes}/share/themes/" + name + ".yaml";
in {
  config = lib.mkIf (config.globalTheme == "gruvbox") {
    stylix = {
      base16Scheme = base16Theme "gruvbox-dark-medium";
      polarity = "dark";
      image = ../../../wallpapers/gruvbox-road.png;
      targets.helix.enable = false;
    };
    programs.helix.settings.theme = "gruvbox";
  };
}
