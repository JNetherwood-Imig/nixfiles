{ config, lib, ... }:

let
  cfg = config.fish;
in
{
  options.fish = {
    enable = lib.mkEnableOption "fish";
  };

  config = lib.mkIf cfg.enable {
    programs.fish.enable = true;
  };
}
