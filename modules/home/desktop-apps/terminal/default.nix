{ lib, ... }: {
  imports = [
    ./alacritty.nix
    ./foot.nix
    ./ghostty.nix
    ./kitty.nix
  ];

  options.desktopApps.terminal = lib.mkOption {
    type = lib.types.enum [ "alacritty" "foot" "ghostty" "kitty" ];
  };
}
