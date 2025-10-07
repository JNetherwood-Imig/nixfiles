{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.shells;
in
{
  environment.systemPackages =
    lib.mkIf (cfg.default == "nushell" || builtins.elem "nushell" cfg.extraShells)
      [
        pkgs.nushell
      ];
}
