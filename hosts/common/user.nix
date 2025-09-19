{ config, pkgs, ... }:

{
  users.users.jackson = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.${config.env.shells.default};
  };
}
