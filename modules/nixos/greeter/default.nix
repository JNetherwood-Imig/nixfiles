{ lib, ... }:
{
  imports = [
    ./gdm.nix
    ./sddm.nix
  ];

  options.greeter = lib.mkOption {
    type = lib.types.enum [
      "gdm"
      "sddm"
    ];
  };
}
