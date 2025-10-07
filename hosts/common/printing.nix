{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    drivers = [
      pkgs.gutenprintBin
      pkgs.canon-cups-ufr2
    ];
  };

  services.avahi = {
    enable = true;
    openFirewall = true;
    nssmdns4 = true;
  };
}
