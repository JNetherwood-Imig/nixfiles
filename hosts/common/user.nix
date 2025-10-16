{ config, pkgs, ... }:
{
  users.users.jackson = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager" ];
    shell = pkgs.${config.shells.default};
  };
}
