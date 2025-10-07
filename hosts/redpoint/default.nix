{
  imports = [
    ./monitors.nix
    ./nvidia.nix
    ./hardware.nix
  ];

  windowManagers = [ "plasma" ];

  networking.hostName = "redpoint";
  system.stateVersion = "25.05";
}
