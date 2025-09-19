{ ... }:

{
  default = {
    imports = [
      ./config.nix
      ./hardware.nix
    ];
  };
  exports = import ./exports.nix;
}
