{ lib, ... }:
{
  imports = [
    ./helix.nix
    ./nvim.nix
  ];

  options.tuiApps.editors = {
    default = lib.mkOption {
      type = lib.types.enum [
        "helix"
        "nvim"
      ];
    };
    helix.enable = lib.mkEnableOption "helix";
    nvim.enable = lib.mkEnableOption "nvim";
  };
}
