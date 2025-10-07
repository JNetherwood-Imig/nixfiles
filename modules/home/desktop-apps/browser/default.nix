{ lib, ... }: {
  imports = [
    ./firefox.nix
    ./zen.nix
  ];

  options.desktopApps.browser = lib.mkOption {
    type = lib.types.enum [ "firefox" "zen" ];
  };
}
