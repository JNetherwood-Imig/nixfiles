{ config, lib, ... }:
{
  services.displayManager.sddm = lib.mkIf (config.greeter == "sddm") {
    enable = true;
    wayland.enable = true;
  };
}
