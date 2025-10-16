{ config, lib, ... }:
{
  config.programs.helix = lib.mkIf config.tuiApps.editors.helix.enable {
    enable = true;
    defaultEditor = (config.tuiApps.editors.default == "helix");
  };
}
