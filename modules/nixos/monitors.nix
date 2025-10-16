{ lib, ... }:

let
  autoMode = lib.types.enum [
    "preferred"
  ];
  mode =
    { ... }:
    with lib;
    {
      width = mkOption { type = types.int; };
      height = mkOption { type = types.int; };
      refreshRate = mkOption {
        type = types.oneOf [
          types.int
          types.float
        ];
      };
    };
  position =
    { ... }:
    with lib;
    {
      x = mkOption { type = types.int; };
      y = mkOption { type = types.int; };
    };
  transform = lib.types.enum [
    "normal"
    "90"
    "180"
    "270"
    "flipped"
    "flipped-90"
    "flipped-180"
    "flipped-270"
  ];
  monitor =
    { ... }:
    with lib;
    {
      output = mkOption { type = types.str; };
      enable = mkOption {
        type = types.bool;
        default = true;
      };
      mode = mkOption {
        type = types.oneOf [
          autoMode
          (types.submodule mode)
        ];
        default = "preferred";
      };
      position = mkOption {
        type = types.submodule position;
        default = {
          x = 0;
          y = 0;
        };
      };
      scale = mkOption {
        type = types.oneOf [
          types.float
          types.int
        ];
        default = 1;
      };
      transform = mkOption {
        type = transform;
        default = "normal";
      };
    };
in
{
  options.monitors = lib.mkOption { type = lib.types.listOf monitor; };
}
