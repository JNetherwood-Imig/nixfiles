{ config, lib, pkgs, ... }:
let
  base16Theme = name:
    "${pkgs.base16-schemes}/share/themes/" + name + ".yaml";
in {
  config = lib.mkIf (config.globalTheme == "adwaita-light") {
    stylix = {
      base16Scheme = base16Theme "adwaita-light";
    };
  };
}
