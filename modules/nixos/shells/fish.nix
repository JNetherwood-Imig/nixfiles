{ config, ... }:
let
  cfg = config.shells;
in
{
  programs.fish.enable = (cfg.default == "fish" || builtins.elem "fish" cfg.extraShells);
}
