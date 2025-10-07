{ lib, ... }: {
  imports = [
    ./rofi.nix
  ];

  options.desktopApps.launcher = lib.mkOption {
    type = lib.types.enum [ "rofi" ];
  };
}
