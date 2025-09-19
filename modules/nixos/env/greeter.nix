{ config, lib, ... }:

let
  cfg = config.greeter;
in
{
  options.greeter = lib.mkOption {
    type = lib.types.enum [ "sddm" ];
  };

  config = {
    services.displayManager.sddm = lib.mkIf (cfg == "sddm") {
      enable = true;
      wayland.enable = true;
    };
  };
}
