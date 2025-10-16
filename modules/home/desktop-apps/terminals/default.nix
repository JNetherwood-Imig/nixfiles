{ lib, ... }:
{
  imports = [
    ./alacritty.nix
    ./foot.nix
    ./ghostty.nix
    ./kitty.nix
  ];

  options.desktopApps.terminals = {
    defaultCmd = lib.mkOption {
      type = lib.types.enum [
        "alacritty"
        "footclient"
        "ghostty"
        "kitty"
      ];
    };
    alacritty.enable = lib.mkEnableOption "alacritty";
    foot.enable = lib.mkEnableOption "foot";
    ghostty.enable = lib.mkEnableOption "ghostty";
    kitty.enable = lib.mkEnableOption "kitty";
  };
}
