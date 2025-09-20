{ config, lib, ... }:

let
  cfg = config.env.greeter;
in
{
  options.env.greeter = lib.mkOption {
    type = lib.types.enum [ "sddm" ];
  };

  config = {
    services.displayManager.sddm = lib.mkIf (cfg == "sddm") {
      enable = true;
      wayland.enable = true;
    };
  };
}
