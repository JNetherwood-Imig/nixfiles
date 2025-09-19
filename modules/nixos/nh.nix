{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.nh;
in
{
  options.nh = {
    enable = lib.mkEnableOption "nh";
  };
  config = lib.mkIf cfg.enable {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep 3";
      flake = "/home/jackson/nixfiles";
    };
    environment.systemPackages = with pkgs; [
      nix-output-monitor
      nvd
    ];
  };
}
