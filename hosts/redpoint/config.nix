{ ... }:

{
  monitors = [
    {
      output = "DP-1";
      mode = {
        width = 3440;
        height = 1440;
        refreshRate = 144;
      };
      scale = 1.25;
    }
  ];

  networking.hostName = "redpoint";

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = true;
  };

  system.stateVersion = "25.05";
}
