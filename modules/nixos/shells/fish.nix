{ config, lib, ... }:
let
  cfg = config.shells;
in
{
  config = lib.mkIf (cfg.default == "fish" || builtins.elem "fish" cfg.extraShells) {
    programs.fish.enable = true;
    documentation.man.generateCaches = false;
  };
}
