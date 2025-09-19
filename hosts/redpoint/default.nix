{ ... }:

{
  default = {
    imports = [
      ./monitors.nix
      ./nvidia.nix
      ./hardware.nix
    ];

    networking.hostName = "redpoint";
    system.stateVersion = "25.05";
  };

  exports = import ./exports.nix;
}
