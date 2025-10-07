{ config, lib, ... }:
{
  services.displayManager.gdm = lib.mkIf (config.greeter == "gdm") {
    enable = true;
    wayland = true;
  };
}
