{ config, lib, ... }:

let
  cfg = config.env.windowManagers;
in
{
  options.env.windowManagers = lib.mkOption {
    type = lib.types.listOf lib.types.str;
  };
  config.programs = lib.foldl' (
    acc: wm: if builtins.hasAttr wm config.programs then acc // { ${wm}.enable = true; } else acc
  ) { } cfg;
}
