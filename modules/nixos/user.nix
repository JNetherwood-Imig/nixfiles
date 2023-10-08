{ config, pkgs, lib, ... }: {
  config = {
    users.users.jackson = {
      isNormalUser = true;
      description = "Jackson Netherwood-Imig";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.fish;
    };
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      users = lib.attrsets.genAttrs [ "jackson" ] (_: { });
    };
  };
}
