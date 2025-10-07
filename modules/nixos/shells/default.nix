{ config, lib, ... }:
let
  shell = lib.types.enum [
    "fish"
    "nushell"
  ];
in
{
  imports = [
    ./fish.nix
    ./nushell.nix
  ];

  options.shells = {
    default = lib.mkOption {
      type = shell;
    };
    extraShells = lib.mkOption {
      type = lib.types.listOf shell;
    };
  };

  config.home-manager.extraSpecialArgs.shells = [
    config.shells.default
  ]
  ++ config.shells.extraShells;
}
