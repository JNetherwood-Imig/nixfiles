{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.env.shells;
in
{
  options.env.shells = {
    default = lib.mkOption {
      type = lib.types.str;
      default = "fish";
    };
    extraShells = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
    };
  };
  config =
    let
      allShells = lib.lists.unique (cfg.extraShells ++ [ cfg.default ]);
    in
    {
      programs = lib.foldl' (
        acc: shell:
        if builtins.hasAttr shell config.programs then acc // { ${shell}.enable = true; } else acc
      ) { } allShells;

      environment.systemPackages = lib.filter (pkgs: pkgs != null) (
        map (shell: if builtins.hasAttr shell config.programs then null else pkgs.${shell}) allShells
      );
    };
}
