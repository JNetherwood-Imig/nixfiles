{ config, lib, pkgs, ... }:
let
  base16Theme = name:
    "${pkgs.base16-schemes}/share/themes/" + name + ".yaml";
in {
  config = lib.mkIf (config.globalTheme == "everforest-dark") {
    stylix = {
      base16Scheme = base16Theme "everforest-dark";
    };
  };
}
