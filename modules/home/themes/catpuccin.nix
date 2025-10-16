{ config, lib, pkgs, ... }:
let
  base16Theme = name:
    "${pkgs.base16-schemes}/share/themes/" + name + ".yaml";
in {
  config = lib.mkIf (config.globalTheme == "catpuccin") {
    stylix = {
      base16Scheme = base16Theme "catpuccin-macchiato";
    };
  };
}
