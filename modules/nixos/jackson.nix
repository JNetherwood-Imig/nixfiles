{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.jackson;
in
{
  options.jackson.enable = lib.mkEnableOption "jackson";
  config = lib.mkIf cfg.enable {
    users.users.jackson = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      shell = pkgs.${config.env.shells.default};
    };
  };
}
